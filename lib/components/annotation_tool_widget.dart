import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'annotation_tool_model.dart';
export 'annotation_tool_model.dart';

class AnnotationToolWidget extends StatefulWidget {
  const AnnotationToolWidget({
    super.key,
    bool? active,
    this.icon,
  }) : this.active = active ?? true;

  final bool active;
  final Widget? icon;

  @override
  State<AnnotationToolWidget> createState() => _AnnotationToolWidgetState();
}

class _AnnotationToolWidgetState extends State<AnnotationToolWidget> {
  late AnnotationToolModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnotationToolModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.edit_rounded,
        size: 24.0,
      ),
    );
  }
}
