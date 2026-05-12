import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/switch_component_widget.dart';
import '/components/unit_accordion2_widget.dart';
import '/components/unit_accordion_child_widget.dart';
import '/components/unit_accordion_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/academic_library/academic_library_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'subject_lesson_list_model.dart';
export 'subject_lesson_list_model.dart';

class SubjectLessonListWidget extends StatefulWidget {
  const SubjectLessonListWidget({super.key});

  static String routeName = 'SubjectLessonList';
  static String routePath = '/subjectLessonList';

  @override
  State<SubjectLessonListWidget> createState() =>
      _SubjectLessonListWidgetState();
}

class _SubjectLessonListWidgetState extends State<SubjectLessonListWidget> {
  late SubjectLessonListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectLessonListModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  if (context.canPop()) {
                                    context.pop();
                                  } else {
                                    context.go(
                                        AcademicLibraryWidget.routePath);
                                  }
                                },
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'الفيزياء - الثالث الثانوي',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                      Text(
                                        'المنهاج السوري الحديث',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.search_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sensors_off_rounded,
                            size: 18.0,
                          ),
                          Text(
                            'وضع توفير البيانات مفعّل: جودة الفيديو محدودة',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'تم إنجاز 45%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary80,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                                Text(
                                                  'الميكانيك والكهرباء',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.tajawal(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                        lineHeight: 1.35,
                                                      ),
                                                ),
                                                LinearPercentIndicator(
                                                  percent: 0.45,
                                                  lineHeight: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .onPrimary20,
                                                  barRadius:
                                                      Radius.circular(9999.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                          Container(
                                            width: 64.0,
                                            height: 64.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary10,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.functions_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onSurface,
                                              size: 36.0,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 24.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.check_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      Text(
                                                        'الكل',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'فيديو',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'ملخصات PDF',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
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
                                          Text(
                                            'المحملة فقط',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.inter(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                          wrapWithModel(
                                            model: _model.switchComponentModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SwitchComponentWidget(
                                              label: '',
                                              labelPresent: false,
                                              variant: 'iOS',
                                              active: false,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ],
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.unitAccordionModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UnitAccordionWidget(
                                    lessonCount: '٦',
                                    title: 'الوحدة الأولى: الحركة التحريكية',
                                    totalSize: '١٢٤ ميجابايت',
                                    unitNum: '١',
                                    child: () => UnitAccordionChildWidget(),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.unitAccordion2Model1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UnitAccordion2Widget(
                                    lessonCount: '٤',
                                    title: 'الوحدة الثانية: ميكانيك السوائل',
                                    totalSize: '٨٥ ميجابايت',
                                    unitNum: '٢',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.unitAccordion2Model2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UnitAccordion2Widget(
                                    lessonCount: '٨',
                                    title: 'الوحدة الثالثة: الكهطيسية',
                                    totalSize: '١٩٠ ميجابايت',
                                    unitNum: '٣',
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .surfaceVariant,
                                    borderRadius: BorderRadius.circular(16.0),
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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 48.0,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9999.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.bluetooth_audio_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onSurfaceVariant,
                                              size: 24.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'مشاركة مع زميل',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.tajawal(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                                Text(
                                                  'أرسل الدروس المحملة بدون إنترنت عبر البلوتوث',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.tajawal(
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
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.buttonModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ButtonWidget(
                                              content: 'بدء',
                                              iconPresent: false,
                                              iconEndPresent: false,
                                              variant: 'outline',
                                              size: 'small',
                                              fullWidth: false,
                                              loading: false,
                                              disabled: false,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 24.0,
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      child: Container(
                        width: 0.0,
                        height: 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 84.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        4.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: wrapWithModel(
                  model: _model.mainBottomNavigationModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainBottomNavigationWidget(
                    activeTab: 'library',
                    currentPage: 'home',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
