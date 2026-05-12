import '/backend/data_service.dart';
import '/backend/models.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/question_card_widget.dart';
import '/components/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community_feed_model.dart';
export 'community_feed_model.dart';

class CommunityFeedWidget extends StatefulWidget {
  const CommunityFeedWidget({super.key});

  static String routeName = 'CommunityFeed';
  static String routePath = '/communityFeed';

  @override
  State<CommunityFeedWidget> createState() => _CommunityFeedWidgetState();
}

class _CommunityFeedWidgetState extends State<CommunityFeedWidget> {
  late CommunityFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CommunityPostModel> _posts = const [];
  final TextEditingController _composeController = TextEditingController();
  bool _composing = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityFeedModel());
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final fresh = await DataService.instance.listCommunityPosts();
    if (!mounted) return;
    if (fresh.isNotEmpty) setState(() => _posts = fresh);
  }

  Future<void> _compose() async {
    final body = _composeController.text.trim();
    if (body.isEmpty || _composing) return;
    setState(() => _composing = true);
    try {
      await DataService.instance.createPost(body: body);
      _composeController.clear();
      if (!mounted) return;
      Navigator.of(context).maybePop();
      await _loadPosts();
    } finally {
      if (mounted) setState(() => _composing = false);
    }
  }

  Future<void> _openCompose() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (ctx) {
        final theme = FlutterFlowTheme.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('سؤال جديد',
                  textAlign: TextAlign.right,
                  style: theme.titleMedium),
              const SizedBox(height: 12.0),
              TextField(
                controller: _composeController,
                minLines: 3,
                maxLines: 6,
                textDirection: ui.TextDirection.rtl,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'اكتب سؤالك أو ملاحظتك...',
                ),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: theme.primary,
                ),
                onPressed: _composing ? null : _compose,
                child: Text(_composing ? '...' : 'نشر'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _toggleLike(String postId) async {
    await DataService.instance.togglePostLike(postId);
    await _loadPosts();
  }

  @override
  void dispose() {
    _composeController.dispose();
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
                                  Icons.notifications_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                'مجتمع نور',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                      lineHeight: 1.4,
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
                            ],
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
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                    child: Container(
                      child: wrapWithModel(
                        model: _model.tabGroupModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TabGroupWidget(
                          label1: 'الكل',
                          label2: 'صفّي',
                          label2Present: true,
                          label3: 'محافظتي',
                          label3Present: true,
                          label4: '',
                          label4Present: false,
                          label5: '',
                          label5Present: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
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
                                      color: FlutterFlowTheme.of(context)
                                          .warning10,
                                      borderRadius: BorderRadius.circular(12.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .warning30,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.speed_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onWarning,
                                              size: 20.0,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'وضع توفير البيانات مفعّل - يتم ضغط الصور',
                                                textAlign: TextAlign.end,
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
                                                              .onWarning,
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
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_posts.length > 0)
                                    InkWell(
                                      onTap: () => _toggleLike(_posts[0].id),
                                      child: wrapWithModel(
                                        model: _model.questionCardModel1,
                                        updateCallback: () => safeSetState(() {}),
                                        child: QuestionCardWidget(
                                          comments: _posts[0].commentCount.toString(),
                                          content: _posts[0].body,
                                          governorate: _posts[0].governorate,
                                          grade: _posts[0].grade,
                                          isVerified: false,
                                          subject: _posts[0].subject,
                                          time: _posts[0].timeLabel,
                                          userInitials: _posts[0].authorInitials,
                                          userName: _posts[0].authorName,
                                          votes: _posts[0].likeCount.toString(),
                                          voted: true,
                                        ),
                                      ),
                                    )
                                  else
                                    wrapWithModel(
                                      model: _model.questionCardModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: QuestionCardWidget(
                                        comments: '8',
                                        content:
                                            'كيف يمكنني حل مسألة النواس المرن في الفيزياء؟ هل هناك تبسيط للقوانين؟',
                                        governorate: 'دمشق',
                                        grade: 'بكالوريا - علمي',
                                        isVerified: false,
                                        subject: 'فيزياء',
                                        time: 'منذ ساعتين',
                                        userInitials: 'أ',
                                        userName: 'أحمد المحمد',
                                        votes: '24',
                                        voted: true,
                                      ),
                                    ),
                                  if (_posts.length > 1)
                                    InkWell(
                                      onTap: () => _toggleLike(_posts[1].id),
                                      child: wrapWithModel(
                                        model: _model.questionCardModel2,
                                        updateCallback: () => safeSetState(() {}),
                                        child: QuestionCardWidget(
                                          comments: _posts[1].commentCount.toString(),
                                          content: _posts[1].body,
                                          governorate: _posts[1].governorate,
                                          grade: _posts[1].grade,
                                          isVerified: true,
                                          subject: _posts[1].subject,
                                          time: _posts[1].timeLabel,
                                          userInitials: _posts[1].authorInitials,
                                          userName: _posts[1].authorName,
                                          votes: _posts[1].likeCount.toString(),
                                          voted: false,
                                        ),
                                      ),
                                    )
                                  else
                                    wrapWithModel(
                                      model: _model.questionCardModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: QuestionCardWidget(
                                        comments: '42',
                                        content:
                                            'إليكم ملخص شامل لقواعد الإعراب للشهادة الإعدادية. بالتوفيق لجميع الطلاب.',
                                        governorate: 'حلب',
                                        grade: 'مدرس لغة عربية',
                                        isVerified: true,
                                        subject: 'اللغة العربية',
                                        time: 'منذ 4 ساعات',
                                        userInitials: 'س',
                                        userName: 'أ. سارة العلي',
                                        votes: '156',
                                        voted: false,
                                      ),
                                    ),
                                  if (_posts.length > 2)
                                    InkWell(
                                      onTap: () => _toggleLike(_posts[2].id),
                                      child: wrapWithModel(
                                        model: _model.questionCardModel3,
                                        updateCallback: () => safeSetState(() {}),
                                        child: QuestionCardWidget(
                                          comments: _posts[2].commentCount.toString(),
                                          content: _posts[2].body,
                                          governorate: _posts[2].governorate,
                                          grade: _posts[2].grade,
                                          isVerified: false,
                                          subject: _posts[2].subject,
                                          time: _posts[2].timeLabel,
                                          userInitials: _posts[2].authorInitials,
                                          userName: _posts[2].authorName,
                                          votes: _posts[2].likeCount.toString(),
                                          voted: false,
                                        ),
                                      ),
                                    )
                                  else
                                    wrapWithModel(
                                      model: _model.questionCardModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: QuestionCardWidget(
                                        comments: '3',
                                        content:
                                            'متى يبدأ التسجيل على المفاضلة الجامعية لهذا العام؟',
                                        governorate: 'حمص',
                                        grade: 'تاسع',
                                        isVerified: false,
                                        subject: 'عام',
                                        time: 'منذ يوم',
                                        userInitials: 'ل',
                                        userName: 'ليلى إدريس',
                                        votes: '12',
                                        voted: false,
                                      ),
                                    ),
                                  Container(
                                    height: 160.0,
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 100.0),
                child: InkWell(
                  onTap: _openCompose,
                  borderRadius: BorderRadius.circular(9999.0),
                  child: Container(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Container(
                      child: Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(9999.0),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.add_rounded,
                          color: FlutterFlowTheme.of(context).onPrimary,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 84.0,
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
                        activeTab: 'community',
                        currentPage: 'community',
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
