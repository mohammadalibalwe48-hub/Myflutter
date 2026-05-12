import '/components/achievement_badge_widget.dart';
import '/components/button_widget.dart';
import '/components/main_bottom_navigation_widget.dart';
import '/components/storage_item_widget.dart';
import '/components/switch_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_storage_settings_widget.dart' show ProfileStorageSettingsWidget;
import 'package:flutter/material.dart';

class ProfileStorageSettingsModel
    extends FlutterFlowModel<ProfileStorageSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel1;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel2;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel3;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel4;
  // Model for StorageItem.
  late StorageItemModel storageItemModel1;
  // Model for StorageItem.
  late StorageItemModel storageItemModel2;
  // Model for StorageItem.
  late StorageItemModel storageItemModel3;
  // Model for SwitchComponent.
  late SwitchComponentModel switchComponentModel1;
  // Model for SwitchComponent.
  late SwitchComponentModel switchComponentModel2;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for MainBottomNavigation.
  late MainBottomNavigationModel mainBottomNavigationModel;

  @override
  void initState(BuildContext context) {
    achievementBadgeModel1 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel2 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel3 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel4 =
        createModel(context, () => AchievementBadgeModel());
    storageItemModel1 = createModel(context, () => StorageItemModel());
    storageItemModel2 = createModel(context, () => StorageItemModel());
    storageItemModel3 = createModel(context, () => StorageItemModel());
    switchComponentModel1 = createModel(context, () => SwitchComponentModel());
    switchComponentModel2 = createModel(context, () => SwitchComponentModel());
    buttonModel = createModel(context, () => ButtonModel());
    mainBottomNavigationModel =
        createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    achievementBadgeModel1.dispose();
    achievementBadgeModel2.dispose();
    achievementBadgeModel3.dispose();
    achievementBadgeModel4.dispose();
    storageItemModel1.dispose();
    storageItemModel2.dispose();
    storageItemModel3.dispose();
    switchComponentModel1.dispose();
    switchComponentModel2.dispose();
    buttonModel.dispose();
    mainBottomNavigationModel.dispose();
  }
}
