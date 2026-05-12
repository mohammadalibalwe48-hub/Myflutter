import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/local_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_slide_model.dart';
export 'onboarding_slide_model.dart';

class OnboardingSlideWidget extends StatefulWidget {
  const OnboardingSlideWidget({
    super.key,
    String? animationDesc,
    String? description,
    String? title,
  })  : this.animationDesc = animationDesc ??
            'https://dimg.dreamflow.cloud/v1/lottie/student+studying+offline+with+books+and+lightbulb',
        this.description = description ??
            'وصول كامل للمواد الدراسية حتى بدون إنترنت. حمّل دروسك وذاكر في أي وقت.',
        this.title = title ?? 'تعلّم بلا حدود';

  final String animationDesc;
  final String description;
  final String title;

  @override
  State<OnboardingSlideWidget> createState() => _OnboardingSlideWidgetState();
}

class _OnboardingSlideWidgetState extends State<OnboardingSlideWidget> {
  late OnboardingSlideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingSlideModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300.0,
          height: 300.0,
          alignment: AlignmentDirectional(0.0, 0.0),
          child: DreamflowLottie(
            url: valueOrDefault<String>(
              widget.animationDesc,
              'https://dimg.dreamflow.cloud/v1/lottie/student+studying+offline+with+books+and+lightbulb',
            ),
            width: 280.0,
            height: 280.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'تعلّم بلا حدود',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.description,
                  'وصول كامل للمواد الدراسية حتى بدون إنترنت. حمّل دروسك وذاكر في أي وقت.',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.tajawal(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ].divide(SizedBox(height: 32.0)),
    );
  }
}
