-- Seed the public content (subjects, units, lessons, universities) so that
-- a freshly installed APK renders the exact same Arabic content the design
-- already showed when it was hardcoded.

-- Subjects ---------------------------------------------------------------
insert into public.subjects (slug, title, description, cover_asset, total_lessons, order_index) values
  ('math',     'الرياضيات',     'الجبر والهندسة والحساب المتكامل', 'assets/images/dreamflow/math_blackboard.jpg',              48, 1),
  ('science',  'العلوم',        'الأحياء والكيمياء والعلوم العامة', 'assets/images/dreamflow/biology_cell_structure.jpg',       42, 2),
  ('physics',  'الفيزياء',      'الميكانيكا والكهرباء والمغناطيسية', 'assets/images/dreamflow/physics_laboratory_equipment.jpg', 36, 3),
  ('arabic',   'اللغة العربية', 'النحو والصرف والأدب والبلاغة',     'assets/images/dreamflow/arabic_calligraphy.jpg',           54, 4),
  ('chemistry','الكيمياء',      'الكيمياء العضوية وغير العضوية',     'assets/images/dreamflow/molecular_structure_3d.jpg',       30, 5),
  ('history',  'التاريخ',       'تاريخ سوريا والوطن العربي',         'assets/images/dreamflow/historical_ruins_syria.jpg',       24, 6),
  ('languages','اللغات',        'الإنجليزية والفرنسية',              'assets/images/dreamflow/arabic_calligraphy_manuscript.jpg',18, 7)
on conflict (slug) do update set
  title = excluded.title,
  description = excluded.description,
  cover_asset = excluded.cover_asset,
  total_lessons = excluded.total_lessons,
  order_index = excluded.order_index;

-- Units & lessons --------------------------------------------------------
with phys as (select id from public.subjects where slug = 'physics')
insert into public.units (id, subject_id, title, order_index)
select gen_random_uuid(), id, 'الوحدة الأولى: الحركة التحريكية', 1 from phys
union all select gen_random_uuid(), id, 'الوحدة الثانية: ميكانيك السوائل', 2 from phys
union all select gen_random_uuid(), id, 'الوحدة الثالثة: الكهطيسية', 3 from phys
on conflict do nothing;

-- Lessons (a small representative set; used by home + library + subject pages)
insert into public.lessons (subject_id, unit_id, title, duration_label, size_label, cover_asset, lesson_type, order_index)
select s.id, u.id,
       'جبر - المعادلات الخطية', '20 دقيقة', '12MB',
       'assets/images/dreamflow/math_blackboard.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'math'
union all
select s.id, u.id, 'الخلية ووظائفها الأساسية', '25 دقيقة', '18MB',
       'assets/images/dreamflow/biology_cell_structure.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'science'
union all
select s.id, u.id, 'تاريخ سوريا المعاصر', '30 دقيقة', '22MB',
       'assets/images/dreamflow/historical_ruins_syria.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'history'
union all
select s.id, u.id, 'قواعد اللغة العربية', '15 دقيقة', '10MB',
       'assets/images/dreamflow/arabic_calligraphy.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'arabic'
union all
select s.id, u.id, 'ميكانيكا السوائل', '22 دقيقة', '16MB',
       'assets/images/dreamflow/physics_laboratory_equipment.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 2
where s.slug = 'physics'
union all
select s.id, u.id, 'قواعد النحو: المرفوعات', '18 دقيقة', '14MB',
       'assets/images/dreamflow/arabic_calligraphy_manuscript.jpg', 'video', 2
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'arabic'
union all
select s.id, u.id, 'الروابط التساهمية', '20 دقيقة', '15MB',
       'assets/images/dreamflow/molecular_structure_3d.jpg', 'video', 1
from public.subjects s
left join public.units u on u.subject_id = s.id and u.order_index = 1
where s.slug = 'chemistry';

-- Universities -----------------------------------------------------------
insert into public.universities (slug, name, location, logo_asset, website, order_index) values
  ('damascus',  'جامعة دمشق',         'دمشق، البرامكة', 'assets/images/dreamflow/damascus_university_logo.jpg', 'https://damascusuniversity.edu.sy/', 1),
  ('aleppo',    'جامعة حلب',          'حلب، الفرقان',   'assets/images/dreamflow/aleppo_university_logo.jpg',   'https://alepuniv.edu.sy/',          2),
  ('tishreen',  'جامعة تشرين',        'اللاذقية',       'assets/images/dreamflow/tishreen_university_logo.jpg', 'https://tishreen.edu.sy/',         3),
  ('svu',       'الجامعة الافتراضية', 'عبر الإنترنت',   'assets/images/dreamflow/svu_logo.jpg',                'https://svuonline.org/',           4)
on conflict (slug) do update set
  name = excluded.name,
  location = excluded.location,
  logo_asset = excluded.logo_asset,
  website = excluded.website,
  order_index = excluded.order_index;

-- Demo community posts: only seed if there are no posts yet, attributed to
-- a special "system" profile so they survive even before users sign up.
do $$
declare
  demo_id uuid;
begin
  if (select count(*) from public.community_posts) > 0 then
    return;
  end if;

  -- create or find a demo profile (no auth.user row) - we relax FK by inserting null author_id
  insert into public.community_posts (author_id, body, topic) values
    (null, 'كيف يمكنني حل مسألة النواس المرن في الفيزياء؟ هل هناك تبسيط للقوانين؟', 'physics'),
    (null, 'إليكم ملخص شامل لقواعد الإعراب للشهادة الإعدادية. بالتوفيق لجميع الطلاب.', 'arabic'),
    (null, 'متى يبدأ التسجيل على المفاضلة الجامعية لهذا العام؟', 'general');
end $$;
