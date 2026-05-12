import '/components/lesson_item2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'unit_accordion_child_widget.dart' show UnitAccordionChildWidget;
import 'package:flutter/material.dart';

class UnitAccordionChildModel
    extends FlutterFlowModel<UnitAccordionChildWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LessonItem2.
  late LessonItem2Model lessonItem2Model1;
  // Model for LessonItem2.
  late LessonItem2Model lessonItem2Model2;
  // Model for LessonItem2.
  late LessonItem2Model lessonItem2Model3;
  // Model for LessonItem2.
  late LessonItem2Model lessonItem2Model4;

  @override
  void initState(BuildContext context) {
    lessonItem2Model1 = createModel(context, () => LessonItem2Model());
    lessonItem2Model2 = createModel(context, () => LessonItem2Model());
    lessonItem2Model3 = createModel(context, () => LessonItem2Model());
    lessonItem2Model4 = createModel(context, () => LessonItem2Model());
  }

  @override
  void dispose() {
    lessonItem2Model1.dispose();
    lessonItem2Model2.dispose();
    lessonItem2Model3.dispose();
    lessonItem2Model4.dispose();
  }
}
