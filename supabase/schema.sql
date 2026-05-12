-- Schema for the Myflutter (ioop) Arabic study app.
-- All textual content is bilingual where helpful but defaults to the Arabic
-- copy already shown in the UI, so the screens look identical out of the box.

create extension if not exists "pgcrypto";

-- ------------------------------------------------------------------
-- profiles : 1 row per auth user
-- ------------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '',
  initials text not null default '',
  phone_number text,
  province text,
  grade text,
  field_of_study text,
  goal text,
  avatar_url text,
  storage_used_mb int not null default 0,
  storage_quota_mb int not null default 2048,
  weekly_goal_minutes int not null default 600,
  weekly_progress_minutes int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, phone_number, display_name, initials)
  values (
    new.id,
    new.phone,
    coalesce(new.raw_user_meta_data ->> 'display_name', ''),
    coalesce(new.raw_user_meta_data ->> 'initials', '')
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ------------------------------------------------------------------
-- subjects + units + lessons : library content
-- ------------------------------------------------------------------
create table if not exists public.subjects (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text,
  cover_asset text,
  cover_url text,
  total_lessons int not null default 0,
  order_index int not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.units (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid references public.subjects(id) on delete cascade,
  title text not null,
  order_index int not null default 0
);

create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  unit_id uuid references public.units(id) on delete cascade,
  subject_id uuid references public.subjects(id) on delete cascade,
  title text not null,
  duration_label text not null default '15 دقيقة',
  size_label text not null default '12MB',
  cover_asset text,
  cover_url text,
  lesson_type text not null default 'video',
  is_downloaded boolean not null default true,
  body_md text,
  order_index int not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.lesson_progress (
  user_id uuid references auth.users(id) on delete cascade,
  lesson_id uuid references public.lessons(id) on delete cascade,
  progress numeric(5,2) not null default 0,
  completed boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

-- ------------------------------------------------------------------
-- weekly planner
-- ------------------------------------------------------------------
create table if not exists public.weekly_plan_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  day_of_week int not null check (day_of_week between 0 and 6),
  start_time time not null,
  end_time time not null,
  subject text not null,
  title text not null,
  location text,
  color text not null default '#6366f1',
  created_at timestamptz not null default now()
);

-- ------------------------------------------------------------------
-- community
-- ------------------------------------------------------------------
create table if not exists public.community_posts (
  id uuid primary key default gen_random_uuid(),
  author_id uuid references auth.users(id) on delete cascade,
  body text not null,
  image_url text,
  topic text,
  like_count int not null default 0,
  comment_count int not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.post_likes (
  post_id uuid references public.community_posts(id) on delete cascade,
  user_id uuid references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (post_id, user_id)
);

create table if not exists public.post_comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid references public.community_posts(id) on delete cascade,
  author_id uuid references auth.users(id) on delete cascade,
  body text not null,
  created_at timestamptz not null default now()
);

create or replace function public.bump_post_counts()
returns trigger language plpgsql security definer as $$
begin
  if tg_op = 'INSERT' then
    if tg_table_name = 'post_likes' then
      update public.community_posts set like_count = like_count + 1 where id = new.post_id;
    elsif tg_table_name = 'post_comments' then
      update public.community_posts set comment_count = comment_count + 1 where id = new.post_id;
    end if;
  elsif tg_op = 'DELETE' then
    if tg_table_name = 'post_likes' then
      update public.community_posts set like_count = greatest(0, like_count - 1) where id = old.post_id;
    elsif tg_table_name = 'post_comments' then
      update public.community_posts set comment_count = greatest(0, comment_count - 1) where id = old.post_id;
    end if;
  end if;
  return coalesce(new, old);
end;
$$;

drop trigger if exists post_likes_count_trg on public.post_likes;
create trigger post_likes_count_trg
  after insert or delete on public.post_likes
  for each row execute function public.bump_post_counts();

drop trigger if exists post_comments_count_trg on public.post_comments;
create trigger post_comments_count_trg
  after insert or delete on public.post_comments
  for each row execute function public.bump_post_counts();

-- ------------------------------------------------------------------
-- universities (career prep page)
-- ------------------------------------------------------------------
create table if not exists public.universities (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  location text,
  logo_asset text,
  logo_url text,
  description text,
  website text,
  order_index int not null default 0
);

create table if not exists public.university_favourites (
  user_id uuid references auth.users(id) on delete cascade,
  university_id uuid references public.universities(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, university_id)
);

-- ------------------------------------------------------------------
-- achievements
-- ------------------------------------------------------------------
create table if not exists public.achievements (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  title text not null,
  subtitle text,
  icon text,
  awarded_at timestamptz not null default now()
);

-- ------------------------------------------------------------------
-- storage_items : items shown on the profile storage page
-- ------------------------------------------------------------------
create table if not exists public.storage_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  title text not null,
  category text not null,
  size_mb int not null default 0,
  icon text,
  created_at timestamptz not null default now()
);

-- ------------------------------------------------------------------
-- helpful view : recent posts with author name + did_i_like
-- ------------------------------------------------------------------
create or replace view public.community_feed_view as
  select
    p.id,
    p.body,
    p.image_url,
    p.topic,
    p.like_count,
    p.comment_count,
    p.created_at,
    p.author_id,
    coalesce(pr.display_name, 'مستخدم') as author_name,
    coalesce(pr.initials, 'م') as author_initials
  from public.community_posts p
  left join public.profiles pr on pr.id = p.author_id
  order by p.created_at desc;

-- ------------------------------------------------------------------
-- RLS
-- ------------------------------------------------------------------
alter table public.profiles enable row level security;
alter table public.subjects enable row level security;
alter table public.units enable row level security;
alter table public.lessons enable row level security;
alter table public.lesson_progress enable row level security;
alter table public.weekly_plan_entries enable row level security;
alter table public.community_posts enable row level security;
alter table public.post_likes enable row level security;
alter table public.post_comments enable row level security;
alter table public.universities enable row level security;
alter table public.university_favourites enable row level security;
alter table public.achievements enable row level security;
alter table public.storage_items enable row level security;

-- public read for static content (anon allowed for splash before login)
drop policy if exists "subjects readable by all" on public.subjects;
create policy "subjects readable by all" on public.subjects for select using (true);

drop policy if exists "units readable by all" on public.units;
create policy "units readable by all" on public.units for select using (true);

drop policy if exists "lessons readable by all" on public.lessons;
create policy "lessons readable by all" on public.lessons for select using (true);

drop policy if exists "universities readable by all" on public.universities;
create policy "universities readable by all" on public.universities for select using (true);

-- profiles: own write, all read (so community can render author names)
drop policy if exists "profiles readable by all" on public.profiles;
create policy "profiles readable by all" on public.profiles for select using (true);

drop policy if exists "profiles owner upsert" on public.profiles;
create policy "profiles owner upsert" on public.profiles for insert with check (id = auth.uid());

drop policy if exists "profiles owner update" on public.profiles;
create policy "profiles owner update" on public.profiles for update using (id = auth.uid()) with check (id = auth.uid());

-- per-user data
drop policy if exists "lesson_progress owner crud" on public.lesson_progress;
create policy "lesson_progress owner crud" on public.lesson_progress
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "weekly_plan owner crud" on public.weekly_plan_entries;
create policy "weekly_plan owner crud" on public.weekly_plan_entries
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "favourites owner crud" on public.university_favourites;
create policy "favourites owner crud" on public.university_favourites
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "achievements owner read" on public.achievements;
create policy "achievements owner read" on public.achievements
  for select using (user_id = auth.uid());

drop policy if exists "storage_items owner crud" on public.storage_items;
create policy "storage_items owner crud" on public.storage_items
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

-- community: any authenticated user reads, owns rows for write
drop policy if exists "posts read by all" on public.community_posts;
create policy "posts read by all" on public.community_posts for select using (true);

drop policy if exists "posts owner insert" on public.community_posts;
create policy "posts owner insert" on public.community_posts
  for insert with check (author_id = auth.uid());

drop policy if exists "posts owner update delete" on public.community_posts;
create policy "posts owner update delete" on public.community_posts
  for update using (author_id = auth.uid()) with check (author_id = auth.uid());

drop policy if exists "post_likes read by all" on public.post_likes;
create policy "post_likes read by all" on public.post_likes for select using (true);

drop policy if exists "post_likes owner write" on public.post_likes;
create policy "post_likes owner write" on public.post_likes
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "post_comments read by all" on public.post_comments;
create policy "post_comments read by all" on public.post_comments for select using (true);

drop policy if exists "post_comments owner insert" on public.post_comments;
create policy "post_comments owner insert" on public.post_comments
  for insert with check (author_id = auth.uid());

drop policy if exists "post_comments owner update delete" on public.post_comments;
create policy "post_comments owner update delete" on public.post_comments
  for update using (author_id = auth.uid()) with check (author_id = auth.uid());

-- grants on the view
grant select on public.community_feed_view to anon, authenticated;
