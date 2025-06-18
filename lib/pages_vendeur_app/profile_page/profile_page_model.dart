import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
