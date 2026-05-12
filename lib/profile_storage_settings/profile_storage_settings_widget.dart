import '/backend/auth_service.dart';
import '/backend/data_service.dart';
import '/backend/models.dart';
import '/components/achievement_badge_widget.dart';
import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/storage_item_widget.dart';
import '/components/switch_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/splash_and_onboarding/splash_and_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_storage_settings_model.dart';
export 'profile_storage_settings_model.dart';

class ProfileStorageSettingsWidget extends StatefulWidget {
  const ProfileStorageSettingsWidget({super.key});

  static String routeName = 'ProfileStorageSettings';
  static String routePath = '/profileStorageSettings';

  @override
  State<ProfileStorageSettingsWidget> createState() =>
      _ProfileStorageSettingsWidgetState();
}

class _ProfileStorageSettingsWidgetState
    extends State<ProfileStorageSettingsWidget> {
  late ProfileStorageSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileModel? _profile;
  bool _signingOut = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStorageSettingsModel());
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final p = await DataService.instance.getCurrentProfile();
    if (mounted) setState(() => _profile = p);
  }

  Future<void> _signOut() async {
    if (_signingOut) return;
    setState(() => _signingOut = true);
    try {
      await AuthService.instance.signOut();
      if (!mounted) return;
      context.go(SplashAndOnboardingWidget.routePath);
    } finally {
      if (mounted) setState(() => _signingOut = false);
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 16.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.arrow_forward_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          'الملف الشخصي',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.settings_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(9999.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              (_profile?.initials.isNotEmpty ?? false)
                                                  ? _profile!.initials
                                                  : 'أ',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .onPrimary,
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                    lineHeight: 1.3,
                                                  ),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(9999.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.edit_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .onSecondary,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _profile?.displayName.isNotEmpty == true
                                          ? _profile!.displayName
                                          : 'أحمد المحمد',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                            lineHeight: 1.35,
                                          ),
                                    ),
                                    Text(
                                      _profile?.grade.isNotEmpty == true
                                          ? _profile!.grade
                                          : 'الصف الحادي عشر - علمي',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.tajawal(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.6,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).primary5,
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primary20,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 8.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.local_fire_department_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .onPrimary,
                                            size: 20.0,
                                          ),
                                          Text(
                                            'سلسلة دراسة: 12 يوم',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'الإنجازات',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      'عرض الكل',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.achievementBadgeModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AchievementBadgeWidget(
                                                bg: FlutterFlowTheme.of(context)
                                                    .primary10,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.school_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 32.0,
                                                ),
                                                label: 'بطل القراءة',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.achievementBadgeModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AchievementBadgeWidget(
                                                bg: FlutterFlowTheme.of(context)
                                                    .secondary10,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons.timer_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 32.0,
                                                ),
                                                label: 'ساعة تركيز',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.achievementBadgeModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AchievementBadgeWidget(
                                                bg: FlutterFlowTheme.of(context)
                                                    .accent10,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.psychology_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 32.0,
                                                ),
                                                label: 'مفكر مبدع',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.achievementBadgeModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AchievementBadgeWidget(
                                                bg: Color(0x1A8B5CF6),
                                                color: Color(0xFF8B5CF6),
                                                icon: Icon(
                                                  Icons.military_tech_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 32.0,
                                                ),
                                                label: 'الأول على الصف',
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'إدارة التخزين (بدون إنترنت)',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'المساحة المستخدمة',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.tajawal(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                              Text(
                                                '1.2 GB / 4 GB',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.tajawal(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            child: Container(
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        9999.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 0.0)),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 8.0,
                                                    height: 8.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9999.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                  Text(
                                                    'فيديو',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                          lineHeight: 1.2,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 8.0,
                                                    height: 8.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9999.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                  Text(
                                                    'ملفات PDF',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                          lineHeight: 1.2,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    wrapWithModel(
                                      model: _model.storageItemModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StorageItemWidget(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        files: '12',
                                        icon: Icon(
                                          Icons.play_circle_filled_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        size: '450 MB',
                                        title: 'دروس الفيزياء - الوحدة الأولى',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.storageItemModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StorageItemWidget(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        files: '5',
                                        icon: Icon(
                                          Icons.description_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        size: '85 MB',
                                        title: 'ملخصات الرياضيات',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.storageItemModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StorageItemWidget(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        files: '8',
                                        icon: Icon(
                                          Icons.record_voice_over_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        size: '120 MB',
                                        title: 'تسجيلات اللغة الإنجليزية',
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'إعدادات التطبيق',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          wrapWithModel(
                                            model: _model.switchComponentModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SwitchComponentWidget(
                                              label: 'وضع توفير البيانات',
                                              labelPresent: true,
                                              variant: 'iOS 26+',
                                              active: true,
                                            ),
                                          ),
                                          Divider(
                                            height: 16.0,
                                            thickness: 1.0,
                                            indent: 0.0,
                                            endIndent: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          wrapWithModel(
                                            model: _model.switchComponentModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SwitchComponentWidget(
                                              label:
                                                  'التنزيل التلقائي (Wi-Fi فقط)',
                                              labelPresent: true,
                                              variant: 'iOS 26+',
                                              active: false,
                                            ),
                                          ),
                                          Divider(
                                            height: 16.0,
                                            thickness: 1.0,
                                            indent: 0.0,
                                            endIndent: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.language_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 22.0,
                                                    ),
                                                    Text(
                                                      'لغة التطبيق',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .tajawal(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.6,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'العربية',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .tajawal(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.6,
                                                              ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_left_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .onSurface,
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: InkWell(
                                  onTap: _signOut,
                                  child: wrapWithModel(
                                    model: _model.buttonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ButtonWidget(
                                      content: 'تسجيل الخروج',
                                      icon: Icon(
                                        Icons.logout_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                      iconPresent: true,
                                      iconEndPresent: false,
                                      variant: 'outline',
                                      size: 'medium',
                                      fullWidth: true,
                                      loading: _signingOut,
                                      disabled: _signingOut,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.mainBottomNavigationModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MainBottomNavigationWidget(
                        activeTab: 'profile',
                        currentPage: 'profile',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
