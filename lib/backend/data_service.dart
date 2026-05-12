import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_service.dart';
import 'models.dart';

/// Single entry point every screen uses to talk to Supabase. Designed to
/// degrade gracefully: any query that fails (no network, RLS rejects,
/// etc.) returns an empty list / null so the existing widget trees fall
/// back to their previously hardcoded Arabic copy.
class DataService {
  DataService._();
  static final DataService instance = DataService._();

  SupabaseClient get _c => Supabase.instance.client;

  // ---------- subjects ------------------------------------------------
  Future<List<SubjectModel>> listSubjects() async {
    try {
      final rows = await _c
          .from('subjects')
          .select()
          .order('order_index', ascending: true);
      return (rows as List)
          .map((e) => SubjectModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  // ---------- lessons -------------------------------------------------
  Future<List<LessonModel>> listRecentLessons({int limit = 4}) async {
    try {
      final rows = await _c
          .from('lessons')
          .select('id, title, duration_label, size_label, cover_asset,'
              ' subject_id, subject:subjects(title)')
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((e) => LessonModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<List<LessonModel>> listLessonsForSubject(String subjectSlug) async {
    try {
      final rows = await _c
          .from('lessons')
          .select('id, title, duration_label, size_label, cover_asset,'
              ' subject_id, subject:subjects!inner(title, slug)')
          .eq('subject.slug', subjectSlug)
          .order('order_index', ascending: true);
      return (rows as List)
          .map((e) => LessonModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  // ---------- universities --------------------------------------------
  Future<List<UniversityModel>> listUniversities() async {
    try {
      final rows = await _c
          .from('universities')
          .select()
          .order('order_index', ascending: true);
      return (rows as List)
          .map((e) => UniversityModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  // ---------- community feed ------------------------------------------
  Future<List<CommunityPostModel>> listCommunityPosts({int limit = 50}) async {
    try {
      final rows = await _c
          .from('community_feed_view')
          .select()
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((e) => CommunityPostModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<void> createPost({
    required String body,
    String? subject,
    String? topic,
  }) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return;
    await _c.from('community_posts').insert({
      'author_id': user.id,
      'body': body,
      if (subject != null) 'subject': subject,
      if (topic != null) 'topic': topic,
      'time_label': 'الآن',
    });
  }

  Future<void> togglePostLike(String postId) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return;
    final existing = await _c
        .from('post_likes')
        .select('post_id')
        .eq('post_id', postId)
        .eq('user_id', user.id)
        .maybeSingle();
    if (existing == null) {
      await _c.from('post_likes').insert({
        'post_id': postId,
        'user_id': user.id,
      });
    } else {
      await _c
          .from('post_likes')
          .delete()
          .eq('post_id', postId)
          .eq('user_id', user.id);
    }
  }

  // ---------- weekly planner ------------------------------------------
  Future<List<PlannerEntryModel>> listPlannerEntries({int? dayOfWeek}) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return const [];
    try {
      dynamic query = _c
          .from('weekly_plan_entries')
          .select()
          .eq('user_id', user.id);
      if (dayOfWeek != null) {
        query = query.eq('day_of_week', dayOfWeek);
      }
      final rows = await query.order('start_time', ascending: true);
      return (rows as List)
          .map((e) => PlannerEntryModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<void> addPlannerEntry({
    required int dayOfWeek,
    required String startTime,
    required String endTime,
    required String subject,
    required String title,
    String? location,
    String color = '#6366f1',
  }) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return;
    await _c.from('weekly_plan_entries').insert({
      'user_id': user.id,
      'day_of_week': dayOfWeek,
      'start_time': startTime,
      'end_time': endTime,
      'subject': subject,
      'title': title,
      'location': location,
      'color': color,
    });
  }

  Future<void> deletePlannerEntry(String id) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return;
    await _c
        .from('weekly_plan_entries')
        .delete()
        .eq('id', id)
        .eq('user_id', user.id);
  }

  // ---------- profile -------------------------------------------------
  Future<ProfileModel?> getCurrentProfile() async {
    final user = AuthService.instance.currentUser;
    if (user == null) return null;
    try {
      final row = await _c
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();
      if (row == null) return null;
      return ProfileModel.fromMap(Map<String, dynamic>.from(row));
    } catch (_) {
      return null;
    }
  }

  Future<void> updateProfile({
    String? displayName,
    String? initials,
    String? grade,
    String? province,
    String? fieldOfStudy,
    int? weeklyGoalMinutes,
  }) async {
    final user = AuthService.instance.currentUser;
    if (user == null) return;
    await _c.from('profiles').update({
      if (displayName != null) 'display_name': displayName,
      if (initials != null) 'initials': initials,
      if (grade != null) 'grade': grade,
      if (province != null) 'province': province,
      if (fieldOfStudy != null) 'field_of_study': fieldOfStudy,
      if (weeklyGoalMinutes != null) 'weekly_goal_minutes': weeklyGoalMinutes,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', user.id);
  }
}
