import '/components/lesson_item_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/subject_card_widget.dart';
import '/components/switch_component_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'academic_library_widget.dart' show AcademicLibraryWidget;
import 'package:flutter/material.dart';

class AcademicLibraryModel extends FlutterFlowModel<AcademicLibraryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for SwitchComponent.
  late SwitchComponentModel switchComponentModel;
  // Model for SubjectCard.
  late SubjectCardModel subjectCardModel1;
  // Model for SubjectCard.
  late SubjectCardModel subjectCardModel2;
  // Model for SubjectCard.
  late SubjectCardModel subjectCardModel3;
  // Model for SubjectCard.
  late SubjectCardModel subjectCardModel4;
  // Model for LessonItem.
  late LessonItemModel lessonItemModel1;
  // Model for LessonItem.
  late LessonItemModel lessonItemModel2;
  // Model for LessonItem.
  late LessonItemModel lessonItemModel3;
  // Model for LessonItem.
  late LessonItemModel lessonItemModel4;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    switchComponentModel = createModel(context, () => SwitchComponentModel());
    subjectCardModel1 = createModel(context, () => SubjectCardModel());
    subjectCardModel2 = createModel(context, () => SubjectCardModel());
    subjectCardModel3 = createModel(context, () => SubjectCardModel());
    subjectCardModel4 = createModel(context, () => SubjectCardModel());
    lessonItemModel1 = createModel(context, () => LessonItemModel());
    lessonItemModel2 = createModel(context, () => LessonItemModel());
    lessonItemModel3 = createModel(context, () => LessonItemModel());
    lessonItemModel4 = createModel(context, () => LessonItemModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    switchComponentModel.dispose();
    subjectCardModel1.dispose();
    subjectCardModel2.dispose();
    subjectCardModel3.dispose();
    subjectCardModel4.dispose();
    lessonItemModel1.dispose();
    lessonItemModel2.dispose();
    lessonItemModel3.dispose();
    lessonItemModel4.dispose();
    mainBottomNavigationModel.dispose();
  }
}
