import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/selection_card_widget.dart';
import '/components/step_indicator2_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'phone_login_profile_setup_widget.dart'
    show PhoneLoginProfileSetupWidget;
import 'package:flutter/material.dart';

class PhoneLoginProfileSetupModel
    extends FlutterFlowModel<PhoneLoginProfileSetupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StepIndicator2.
  late StepIndicator2Model stepIndicator2Model;
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for SelectionCard.
  late SelectionCardModel selectionCardModel1;
  // Model for SelectionCard.
  late SelectionCardModel selectionCardModel2;
  // Model for SelectionCard.
  late SelectionCardModel selectionCardModel3;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    stepIndicator2Model = createModel(context, () => StepIndicator2Model());
    textFieldModel = createModel(context, () => TextFieldModel());
    selectionCardModel1 = createModel(context, () => SelectionCardModel());
    selectionCardModel2 = createModel(context, () => SelectionCardModel());
    selectionCardModel3 = createModel(context, () => SelectionCardModel());
    buttonModel = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    stepIndicator2Model.dispose();
    textFieldModel.dispose();
    selectionCardModel1.dispose();
    selectionCardModel2.dispose();
    selectionCardModel3.dispose();
    buttonModel.dispose();
    mainBottomNavigationModel.dispose();
  }
}
