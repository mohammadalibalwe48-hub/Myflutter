/// Plain-Dart data classes used between the Supabase data layer and the
/// FlutterFlow-generated widgets. Kept deliberately tiny: every class only
/// holds the fields the existing screens already render.

class SubjectModel {
  SubjectModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.coverAsset,
    required this.totalLessons,
  });

  final String id;
  final String slug;
  final String title;
  final String description;
  final String coverAsset;
  final int totalLessons;

  factory SubjectModel.fromMap(Map<String, dynamic> m) => SubjectModel(
        id: m['id']?.toString() ?? '',
        slug: m['slug']?.toString() ?? '',
        title: m['title']?.toString() ?? '',
        description: m['description']?.toString() ?? '',
        coverAsset: m['cover_asset']?.toString() ?? '',
        totalLessons: (m['total_lessons'] as num?)?.toInt() ?? 0,
      );
}

class LessonModel {
  LessonModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.size,
    required this.coverAsset,
    required this.subjectId,
    required this.subjectTitle,
  });

  final String id;
  final String title;
  final String duration;
  final String size;
  final String coverAsset;
  final String subjectId;
  final String subjectTitle;

  factory LessonModel.fromMap(Map<String, dynamic> m) => LessonModel(
        id: m['id']?.toString() ?? '',
        title: m['title']?.toString() ?? '',
        duration: m['duration_label']?.toString() ?? '15 دقيقة',
        size: m['size_label']?.toString() ?? '12MB',
        coverAsset: m['cover_asset']?.toString() ?? '',
        subjectId: m['subject_id']?.toString() ?? '',
        subjectTitle: (m['subject'] is Map)
            ? (m['subject']['title']?.toString() ?? '')
            : '',
      );
}

class UniversityModel {
  UniversityModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.location,
    required this.logoAsset,
    required this.website,
  });

  final String id;
  final String slug;
  final String name;
  final String location;
  final String logoAsset;
  final String website;

  factory UniversityModel.fromMap(Map<String, dynamic> m) => UniversityModel(
        id: m['id']?.toString() ?? '',
        slug: m['slug']?.toString() ?? '',
        name: m['name']?.toString() ?? '',
        location: m['location']?.toString() ?? '',
        logoAsset: m['logo_asset']?.toString() ?? '',
        website: m['website']?.toString() ?? '',
      );
}

class CommunityPostModel {
  CommunityPostModel({
    required this.id,
    required this.body,
    required this.subject,
    required this.governorate,
    required this.grade,
    required this.timeLabel,
    required this.likeCount,
    required this.commentCount,
    required this.authorName,
    required this.authorInitials,
  });

  final String id;
  final String body;
  final String subject;
  final String governorate;
  final String grade;
  final String timeLabel;
  final int likeCount;
  final int commentCount;
  final String authorName;
  final String authorInitials;

  factory CommunityPostModel.fromMap(Map<String, dynamic> m) =>
      CommunityPostModel(
        id: m['id']?.toString() ?? '',
        body: m['body']?.toString() ?? '',
        subject: m['subject']?.toString() ?? 'عام',
        governorate: m['governorate']?.toString() ?? '',
        grade: m['grade']?.toString() ?? '',
        timeLabel: m['time_label']?.toString() ?? '',
        likeCount: (m['like_count'] as num?)?.toInt() ?? 0,
        commentCount: (m['comment_count'] as num?)?.toInt() ?? 0,
        authorName: m['author_name']?.toString() ?? 'مستخدم',
        authorInitials: m['author_initials']?.toString() ?? 'م',
      );
}

class PlannerEntryModel {
  PlannerEntryModel({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.title,
    required this.location,
    required this.color,
  });

  final String id;
  final int dayOfWeek; // 0..6, 0 = Saturday locally
  final String startTime;
  final String endTime;
  final String subject;
  final String title;
  final String location;
  final String color;

  String get timeLabel => '$startTime - $endTime';

  factory PlannerEntryModel.fromMap(Map<String, dynamic> m) =>
      PlannerEntryModel(
        id: m['id']?.toString() ?? '',
        dayOfWeek: (m['day_of_week'] as num?)?.toInt() ?? 0,
        startTime: (m['start_time']?.toString() ?? '').substring(
          0,
          ((m['start_time']?.toString() ?? '').length).clamp(0, 5),
        ),
        endTime: (m['end_time']?.toString() ?? '').substring(
          0,
          ((m['end_time']?.toString() ?? '').length).clamp(0, 5),
        ),
        subject: m['subject']?.toString() ?? '',
        title: m['title']?.toString() ?? '',
        location: m['location']?.toString() ?? '',
        color: m['color']?.toString() ?? '#6366f1',
      );
}

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.displayName,
    required this.initials,
    required this.phoneNumber,
    required this.grade,
    required this.province,
    required this.fieldOfStudy,
    required this.storageUsedMb,
    required this.storageQuotaMb,
  });

  final String id;
  final String displayName;
  final String initials;
  final String phoneNumber;
  final String grade;
  final String province;
  final String fieldOfStudy;
  final int storageUsedMb;
  final int storageQuotaMb;

  factory ProfileModel.fromMap(Map<String, dynamic> m) => ProfileModel(
        id: m['id']?.toString() ?? '',
        displayName: m['display_name']?.toString() ?? '',
        initials: m['initials']?.toString() ?? '',
        phoneNumber: m['phone_number']?.toString() ?? '',
        grade: m['grade']?.toString() ?? '',
        province: m['province']?.toString() ?? '',
        fieldOfStudy: m['field_of_study']?.toString() ?? '',
        storageUsedMb: (m['storage_used_mb'] as num?)?.toInt() ?? 0,
        storageQuotaMb: (m['storage_quota_mb'] as num?)?.toInt() ?? 2048,
      );
}
