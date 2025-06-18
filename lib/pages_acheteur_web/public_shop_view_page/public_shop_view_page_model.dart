import '/component_vendeur_app/pack_item_shop_link/pack_item_shop_link_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'public_shop_view_page_widget.dart' show PublicShopViewPageWidget;
import 'package:flutter/material.dart';

class PublicShopViewPageModel
    extends FlutterFlowModel<PublicShopViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel1;
  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel2;
  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel3;

  @override
  void initState(BuildContext context) {
    packItemShopLinkModel1 =
        createModel(context, () => PackItemShopLinkModel());
    packItemShopLinkModel2 =
        createModel(context, () => PackItemShopLinkModel());
    packItemShopLinkModel3 =
        createModel(context, () => PackItemShopLinkModel());
  }

  @override
  void dispose() {
    packItemShopLinkModel1.dispose();
    packItemShopLinkModel2.dispose();
    packItemShopLinkModel3.dispose();
  }
}
