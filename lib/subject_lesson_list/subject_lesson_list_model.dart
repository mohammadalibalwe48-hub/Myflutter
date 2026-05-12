import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/switch_component_widget.dart';
import '/components/unit_accordion2_widget.dart';
import '/components/unit_accordion_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subject_lesson_list_widget.dart' show SubjectLessonListWidget;
import 'package:flutter/material.dart';

class SubjectLessonListModel extends FlutterFlowModel<SubjectLessonListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SwitchComponent.
  late SwitchComponentModel switchComponentModel;
  // Model for UnitAccordion.
  late UnitAccordionModel unitAccordionModel;
  // Model for UnitAccordion2.
  late UnitAccordion2Model unitAccordion2Model1;
  // Model for UnitAccordion2.
  late UnitAccordion2Model unitAccordion2Model2;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    switchComponentModel = createModel(context, () => SwitchComponentModel());
    unitAccordionModel = createModel(context, () => UnitAccordionModel());
    unitAccordion2Model1 = createModel(context, () => UnitAccordion2Model());
    unitAccordion2Model2 = createModel(context, () => UnitAccordion2Model());
    buttonModel = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    switchComponentModel.dispose();
    unitAccordionModel.dispose();
    unitAccordion2Model1.dispose();
    unitAccordion2Model2.dispose();
    buttonModel.dispose();
    mainBottomNavigationModel.dispose();
  }
}
