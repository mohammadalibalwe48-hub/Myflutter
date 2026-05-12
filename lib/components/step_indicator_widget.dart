import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'step_indicator_model.dart';
export 'step_indicator_model.dart';

class StepIndicatorWidget extends StatefulWidget {
  const StepIndicatorWidget({
    super.key,
    String? active,
  }) : this.active = active ?? 'option_1';

  final String active;

  @override
  State<StepIndicatorWidget> createState() => _StepIndicatorWidgetState();
}

class _StepIndicatorWidgetState extends State<StepIndicatorWidget> {
  late StepIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepIndicatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: () {
            if (widget.active == 'option_2') {
              return 8.0;
            } else if (widget.active == 'option_3') {
              return 8.0;
            } else {
              return 24.0;
            }
          }(),
          height: 8.0,
          decoration: BoxDecoration(
            color: () {
              if (widget.active == 'option_2') {
                return FlutterFlowTheme.of(context).alternate;
              } else if (widget.active == 'option_3') {
                return FlutterFlowTheme.of(context).alternate;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
          ),
        ),
        Container(
          width: widget.active == 'option_2' ? 24.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: widget.active == 'option_2'
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
          ),
        ),
        Container(
          width: widget.active == 'option_3' ? 24.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: widget.active == 'option_3'
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
          ),
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}
