import '/backend/schema/structs/index.dart';
import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/component_vendeur_app/pack_item_shop_link/pack_item_shop_link_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shop_page_widget.dart' show ShopPageWidget;
import 'package:flutter/material.dart';

class ShopPageModel extends FlutterFlowModel<ShopPageWidget> {
  ///  Local state fields for this page.

  List<PackDataStruct> packIndex = [];
  void addToPackIndex(PackDataStruct item) => packIndex.add(item);
  void removeFromPackIndex(PackDataStruct item) => packIndex.remove(item);
  void removeAtIndexFromPackIndex(int index) => packIndex.removeAt(index);
  void insertAtIndexInPackIndex(int index, PackDataStruct item) =>
      packIndex.insert(index, item);
  void updatePackIndexAtIndex(int index, Function(PackDataStruct) updateFn) =>
      packIndex[index] = updateFn(packIndex[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchPacksBySlug] action in ShopPage widget.
  List<PackDataStruct>? packsForThisShop;
  // Models for PackItemShopLink dynamic component.
  late FlutterFlowDynamicModels<PackItemShopLinkModel> packItemShopLinkModels;
  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    packItemShopLinkModels =
        FlutterFlowDynamicModels(() => PackItemShopLinkModel());
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    packItemShopLinkModels.dispose();
    navBarreModel.dispose();
  }
}
