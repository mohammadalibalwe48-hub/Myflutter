import '/components/learning_card_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/quick_action_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_dashboard_widget.dart' show HomeDashboardWidget;
import 'package:flutter/material.dart';

class HomeDashboardModel extends FlutterFlowModel<HomeDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for QuickAction.
  late QuickActionModel quickActionModel1;
  // Model for QuickAction.
  late QuickActionModel quickActionModel2;
  // Model for QuickAction.
  late QuickActionModel quickActionModel3;
  // Model for QuickAction.
  late QuickActionModel quickActionModel4;
  // Model for QuickAction.
  late QuickActionModel quickActionModel5;
  // Model for QuickAction.
  late QuickActionModel quickActionModel6;
  // Model for LearningCard.
  late LearningCardModel learningCardModel1;
  // Model for LearningCard.
  late LearningCardModel learningCardModel2;
  // Model for LearningCard.
  late LearningCardModel learningCardModel3;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    quickActionModel1 = createModel(context, () => QuickActionModel());
    quickActionModel2 = createModel(context, () => QuickActionModel());
    quickActionModel3 = createModel(context, () => QuickActionModel());
    quickActionModel4 = createModel(context, () => QuickActionModel());
    quickActionModel5 = createModel(context, () => QuickActionModel());
    quickActionModel6 = createModel(context, () => QuickActionModel());
    learningCardModel1 = createModel(context, () => LearningCardModel());
    learningCardModel2 = createModel(context, () => LearningCardModel());
    learningCardModel3 = createModel(context, () => LearningCardModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    quickActionModel1.dispose();
    quickActionModel2.dispose();
    quickActionModel3.dispose();
    quickActionModel4.dispose();
    quickActionModel5.dispose();
    quickActionModel6.dispose();
    learningCardModel1.dispose();
    learningCardModel2.dispose();
    learningCardModel3.dispose();
    mainBottomNavigationModel.dispose();
  }
}
