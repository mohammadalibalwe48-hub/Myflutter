import '/academic_library/academic_library_widget.dart';
import '/community_feed/community_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_dashboard/home_dashboard_widget.dart';
import '/profile_storage_settings/profile_storage_settings_widget.dart';
import '/weekly_planner/weekly_planner_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_bottom_navigation_model.dart';
export 'main_bottom_navigation_model.dart';

class MainBottomNavigationWidget extends StatefulWidget {
  const MainBottomNavigationWidget({
    super.key,
    String? activeTab,
    String? currentPage,
  })  : this.activeTab = activeTab ?? 'home',
        this.currentPage = currentPage ?? 'home';

  final String activeTab;
  final String currentPage;

  @override
  State<MainBottomNavigationWidget> createState() =>
      _MainBottomNavigationWidgetState();
}

class _MainBottomNavigationWidgetState
    extends State<MainBottomNavigationWidget> {
  late MainBottomNavigationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainBottomNavigationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Widget _navTab({
    required String tabKey,
    required IconData icon,
    required String label,
    required String route,
  }) {
    final theme = FlutterFlowTheme.of(context);
    final active = widget.activeTab == tabKey;
    return Expanded(
      flex: 1,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!active) context.go(route);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              child: Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: active ? theme.primary : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Icon(
              icon,
              color: active ? theme.primary : theme.secondaryText,
              size: 24.0,
            ),
            Text(
              label,
              style: theme.labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: theme.labelMedium.fontWeight,
                  fontStyle: theme.labelMedium.fontStyle,
                ),
                color: active ? theme.primary : theme.secondaryText,
                letterSpacing: 0.0,
                fontWeight: theme.labelMedium.fontWeight,
                fontStyle: theme.labelMedium.fontStyle,
                lineHeight: 1.3,
              ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: theme.alternate,
              shape: BoxShape.rectangle,
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              height: 79.0,
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _navTab(
                    tabKey: 'home',
                    icon: Icons.home_rounded,
                    label: 'الرئيسية',
                    route: HomeDashboardWidget.routePath,
                  ),
                  _navTab(
                    tabKey: 'library',
                    icon: Icons.local_library_rounded,
                    label: 'المكتبة',
                    route: AcademicLibraryWidget.routePath,
                  ),
                  _navTab(
                    tabKey: 'community',
                    icon: Icons.groups_rounded,
                    label: 'المجتمع',
                    route: CommunityFeedWidget.routePath,
                  ),
                  _navTab(
                    tabKey: 'planner',
                    icon: Icons.event_note_rounded,
                    label: 'المخطط',
                    route: WeeklyPlannerWidget.routePath,
                  ),
                  _navTab(
                    tabKey: 'profile',
                    icon: Icons.person_rounded,
                    label: 'حسابي',
                    route: ProfileStorageSettingsWidget.routePath,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
