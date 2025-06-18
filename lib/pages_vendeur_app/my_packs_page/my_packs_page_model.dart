import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/component_vendeur_app/pack_list_item_component/pack_list_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'my_packs_page_widget.dart' show MyPacksPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPacksPageModel extends FlutterFlowModel<MyPacksPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PackListItemComponent component.
  late PackListItemComponentModel packListItemComponentModel1;
  // Model for PackListItemComponent component.
  late PackListItemComponentModel packListItemComponentModel2;
  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    packListItemComponentModel1 =
        createModel(context, () => PackListItemComponentModel());
    packListItemComponentModel2 =
        createModel(context, () => PackListItemComponentModel());
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    packListItemComponentModel1.dispose();
    packListItemComponentModel2.dispose();
    navBarreModel.dispose();
  }
}
