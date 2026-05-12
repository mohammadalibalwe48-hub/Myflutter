import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/onboarding_slide_widget.dart';
import '/components/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'splash_and_onboarding_widget.dart' show SplashAndOnboardingWidget;
import 'package:flutter/material.dart';

class SplashAndOnboardingModel
    extends FlutterFlowModel<SplashAndOnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for OnboardingSlide.
  late OnboardingSlideModel onboardingSlideModel;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel;
  // Model for Button.
  late ButtonModel buttonModel3;
  // Model for Button.
  late ButtonModel buttonModel4;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    onboardingSlideModel = createModel(context, () => OnboardingSlideModel());
    stepIndicatorModel = createModel(context, () => StepIndicatorModel());
    buttonModel3 = createModel(context, () => ButtonModel());
    buttonModel4 = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
    onboardingSlideModel.dispose();
    stepIndicatorModel.dispose();
    buttonModel3.dispose();
    buttonModel4.dispose();
    mainBottomNavigationModel.dispose();
  }
}
