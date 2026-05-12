import '/components/button_widget.dart';
import '/components/day_selector_item_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/schedule_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'weekly_planner_widget.dart' show WeeklyPlannerWidget;
import 'package:flutter/material.dart';

class WeeklyPlannerModel extends FlutterFlowModel<WeeklyPlannerWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel1;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel2;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel3;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel4;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel5;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel6;
  // Model for DaySelectorItem.
  late DaySelectorItemModel daySelectorItemModel7;
  // Model for ScheduleItem.
  late ScheduleItemModel scheduleItemModel1;
  // Model for ScheduleItem.
  late ScheduleItemModel scheduleItemModel2;
  // Model for ScheduleItem.
  late ScheduleItemModel scheduleItemModel3;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    daySelectorItemModel1 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel2 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel3 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel4 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel5 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel6 = createModel(context, () => DaySelectorItemModel());
    daySelectorItemModel7 = createModel(context, () => DaySelectorItemModel());
    scheduleItemModel1 = createModel(context, () => ScheduleItemModel());
    scheduleItemModel2 = createModel(context, () => ScheduleItemModel());
    scheduleItemModel3 = createModel(context, () => ScheduleItemModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
    daySelectorItemModel1.dispose();
    daySelectorItemModel2.dispose();
    daySelectorItemModel3.dispose();
    daySelectorItemModel4.dispose();
    daySelectorItemModel5.dispose();
    daySelectorItemModel6.dispose();
    daySelectorItemModel7.dispose();
    scheduleItemModel1.dispose();
    scheduleItemModel2.dispose();
    scheduleItemModel3.dispose();
    mainBottomNavigationModel.dispose();
  }
}
