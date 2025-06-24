import '/backend/schema/structs/index.dart';
import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/component_vendeur_app/pack_list_item_component/pack_list_item_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_packs_page_widget.dart' show MyPacksPageWidget;
import 'package:flutter/material.dart';

class MyPacksPageModel extends FlutterFlowModel<MyPacksPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchAndMapUserPacks] action in MyPacksPage widget.
  List<PackDataStruct>? myPacksList;
  // Models for PackListItemComponent dynamic component.
  late FlutterFlowDynamicModels<PackListItemComponentModel>
      packListItemComponentModels;
  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    packListItemComponentModels =
        FlutterFlowDynamicModels(() => PackListItemComponentModel());
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    packListItemComponentModels.dispose();
    navBarreModel.dispose();
  }
}
