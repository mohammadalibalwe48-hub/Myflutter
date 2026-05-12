import '/components/annotation_tool_widget.dart';
import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/quality_chip_widget.dart';
import '/components/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'content_viewer_widget.dart' show ContentViewerWidget;
import 'package:flutter/material.dart';

class ContentViewerModel extends FlutterFlowModel<ContentViewerWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for QualityChip.
  late QualityChipModel qualityChipModel1;
  // Model for QualityChip.
  late QualityChipModel qualityChipModel2;
  // Model for QualityChip.
  late QualityChipModel qualityChipModel3;
  // Model for AnnotationTool.
  late AnnotationToolModel annotationToolModel1;
  // Model for AnnotationTool.
  late AnnotationToolModel annotationToolModel2;
  // Model for AnnotationTool.
  late AnnotationToolModel annotationToolModel3;
  // Model for AnnotationTool.
  late AnnotationToolModel annotationToolModel4;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    qualityChipModel1 = createModel(context, () => QualityChipModel());
    qualityChipModel2 = createModel(context, () => QualityChipModel());
    qualityChipModel3 = createModel(context, () => QualityChipModel());
    annotationToolModel1 = createModel(context, () => AnnotationToolModel());
    annotationToolModel2 = createModel(context, () => AnnotationToolModel());
    annotationToolModel3 = createModel(context, () => AnnotationToolModel());
    annotationToolModel4 = createModel(context, () => AnnotationToolModel());
    buttonModel = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    qualityChipModel1.dispose();
    qualityChipModel2.dispose();
    qualityChipModel3.dispose();
    annotationToolModel1.dispose();
    annotationToolModel2.dispose();
    annotationToolModel3.dispose();
    annotationToolModel4.dispose();
    buttonModel.dispose();
    mainBottomNavigationModel.dispose();
  }
}
