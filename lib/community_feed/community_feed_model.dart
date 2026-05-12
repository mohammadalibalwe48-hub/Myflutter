import '/components/main_bottom_navigation_widget.dart';
import '/components/question_card_widget.dart';
import '/components/tab_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_feed_widget.dart' show CommunityFeedWidget;
import 'package:flutter/material.dart';

class CommunityFeedModel extends FlutterFlowModel<CommunityFeedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for QuestionCard.
  late QuestionCardModel questionCardModel1;
  // Model for QuestionCard.
  late QuestionCardModel questionCardModel2;
  // Model for QuestionCard.
  late QuestionCardModel questionCardModel3;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    questionCardModel1 = createModel(context, () => QuestionCardModel());
    questionCardModel2 = createModel(context, () => QuestionCardModel());
    questionCardModel3 = createModel(context, () => QuestionCardModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    questionCardModel1.dispose();
    questionCardModel2.dispose();
    questionCardModel3.dispose();
    mainBottomNavigationModel.dispose();
  }
}
