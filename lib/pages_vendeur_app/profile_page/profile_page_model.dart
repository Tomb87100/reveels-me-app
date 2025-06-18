import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    navBarreModel.dispose();
  }
}
