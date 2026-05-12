import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/onboarding_slide_widget.dart';
import '/components/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phone_login_profile_setup/phone_login_profile_setup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_and_onboarding_model.dart';
export 'splash_and_onboarding_model.dart';

class SplashAndOnboardingWidget extends StatefulWidget {
  const SplashAndOnboardingWidget({super.key});

  static String routeName = 'SplashAndOnboarding';
  static String routePath = '/splashAndOnboarding';

  @override
  State<SplashAndOnboardingWidget> createState() =>
      _SplashAndOnboardingWidgetState();
}

class _SplashAndOnboardingWidgetState extends State<SplashAndOnboardingWidget> {
  late SplashAndOnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashAndOnboardingModel());
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
                    padding: EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.buttonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            content: 'English',
                            iconPresent: false,
                            iconEndPresent: false,
                            variant: 'ghost',
                            size: 'small',
                            fullWidth: false,
                            loading: false,
                            disabled: false,
                          ),
                        ),
                        InkWell(
                          onTap: () => context
                              .go(PhoneLoginProfileSetupWidget.routePath),
                          child: wrapWithModel(
                            model: _model.buttonModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              content: 'تخطي',
                              iconPresent: false,
                              iconEndPresent: false,
                              variant: 'ghost',
                              size: 'small',
                              fullWidth: false,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Container(
                      child: Container(
                        child: wrapWithModel(
                          model: _model.onboardingSlideModel,
                          updateCallback: () => safeSetState(() {}),
                          child: OnboardingSlideWidget(
                            animationDesc:
                                'https://dimg.dreamflow.cloud/v1/lottie/student+studying+offline+with+books+and+lightbulb',
                            description:
                                'وصول كامل للمواد الدراسية حتى بدون إنترنت. حمّل دروسك وذاكر في أي وقت.',
                            title: 'تعلّم بلا حدود',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.stepIndicatorModel,
                          updateCallback: () => safeSetState(() {}),
                          child: StepIndicatorWidget(
                            active: 'option_1',
                          ),
                        ),
                        Container(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () => context
                              .go(PhoneLoginProfileSetupWidget.routePath),
                          child: wrapWithModel(
                            model: _model.buttonModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              content: 'التالي',
                              iconPresent: false,
                              iconEnd: Icon(
                                Icons.arrow_back_rounded,
                                color:
                                    FlutterFlowTheme.of(context).onPrimary,
                                size: 16.0,
                              ),
                              iconEndPresent: true,
                              variant: 'primary',
                              size: 'large',
                              fullWidth: true,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'لديك حساب بالفعل؟',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.tajawal(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.6,
                                  ),
                            ),
                            InkWell(
                              onTap: () => context
                                  .go(PhoneLoginProfileSetupWidget.routePath),
                              child: wrapWithModel(
                                model: _model.buttonModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ButtonWidget(
                                  content: 'تسجيل الدخول',
                                  iconPresent: false,
                                  iconEndPresent: false,
                                  variant: 'ghost',
                                  size: 'small',
                                  fullWidth: false,
                                  loading: false,
                                  disabled: false,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 0.0,
              height: 0.0,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 48.0, 0.0),
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).warning,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 8.0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.speed_rounded,
                                size: 16.0,
                              ),
                              Text(
                                'وضع توفير البيانات مفعّل',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
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
                    activeTab: 'home',
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
