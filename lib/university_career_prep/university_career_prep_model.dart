import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/prep_resource_widget.dart';
import '/components/university_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'university_career_prep_widget.dart' show UniversityCareerPrepWidget;
import 'package:flutter/material.dart';

class UniversityCareerPrepModel
    extends FlutterFlowModel<UniversityCareerPrepWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for PrepResource.
  late PrepResourceModel prepResourceModel1;
  // Model for PrepResource.
  late PrepResourceModel prepResourceModel2;
  // Model for PrepResource.
  late PrepResourceModel prepResourceModel3;
  // Model for UniversityCard.
  late UniversityCardModel universityCardModel1;
  // Model for UniversityCard.
  late UniversityCardModel universityCardModel2;
  // Model for UniversityCard.
  late UniversityCardModel universityCardModel3;
  // Model for UniversityCard.
  late UniversityCardModel universityCardModel4;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    prepResourceModel1 = createModel(context, () => PrepResourceModel());
    prepResourceModel2 = createModel(context, () => PrepResourceModel());
    prepResourceModel3 = createModel(context, () => PrepResourceModel());
    universityCardModel1 = createModel(context, () => UniversityCardModel());
    universityCardModel2 = createModel(context, () => UniversityCardModel());
    universityCardModel3 = createModel(context, () => UniversityCardModel());
    universityCardModel4 = createModel(context, () => UniversityCardModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    prepResourceModel1.dispose();
    prepResourceModel2.dispose();
    prepResourceModel3.dispose();
    universityCardModel1.dispose();
    universityCardModel2.dispose();
    universityCardModel3.dispose();
    universityCardModel4.dispose();
    buttonModel2.dispose();
    mainBottomNavigationModel.dispose();
  }
}
