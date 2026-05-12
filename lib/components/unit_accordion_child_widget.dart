import '/components/lesson_item2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'unit_accordion_child_model.dart';
export 'unit_accordion_child_model.dart';

class UnitAccordionChildWidget extends StatefulWidget {
  const UnitAccordionChildWidget({super.key});

  @override
  State<UnitAccordionChildWidget> createState() =>
      _UnitAccordionChildWidgetState();
}

class _UnitAccordionChildWidgetState extends State<UnitAccordionChildWidget> {
  late UnitAccordionChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnitAccordionChildModel());
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        wrapWithModel(
          model: _model.lessonItem2Model1,
          updateCallback: () => safeSetState(() {}),
          child: LessonItem2Widget(
            duration: '١٨:٢٠',
            size: '٢٤ ميجا',
            title: 'النواس الثقلي البسيط',
            status: 'downloaded',
          ),
        ),
        wrapWithModel(
          model: _model.lessonItem2Model2,
          updateCallback: () => safeSetState(() {}),
          child: LessonItem2Widget(
            duration: '٢٢:١٥',
            size: '٣٢ ميجا',
            title: 'النواس المرن - دراسة تحريكية',
            status: 'downloading',
          ),
        ),
        wrapWithModel(
          model: _model.lessonItem2Model3,
          updateCallback: () => safeSetState(() {}),
          child: LessonItem2Widget(
            duration: '١٥:٤٥',
            size: '١٨ ميجا',
            title: 'تطبيقات الحركة الدائرية',
            status: 'downloaded',
          ),
        ),
        wrapWithModel(
          model: _model.lessonItem2Model4,
          updateCallback: () => safeSetState(() {}),
          child: LessonItem2Widget(
            duration: '٣٠:٠٠',
            size: '٥٠ ميجا',
            title: 'مراجعة وحل مسائل عامة',
            status: 'downloaded',
          ),
        ),
      ],
    );
  }
}
