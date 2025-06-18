import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/component_vendeur_app/pack_item_shop_link/pack_item_shop_link_widget.dart';
import '/component_vendeur_app/promo_code_manager_component/promo_code_manager_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'seller_shop_page_widget.dart' show SellerShopPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellerShopPageModel extends FlutterFlowModel<SellerShopPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel1;
  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel2;
  // Model for PackItemShopLink component.
  late PackItemShopLinkModel packItemShopLinkModel3;
  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    packItemShopLinkModel1 =
        createModel(context, () => PackItemShopLinkModel());
    packItemShopLinkModel2 =
        createModel(context, () => PackItemShopLinkModel());
    packItemShopLinkModel3 =
        createModel(context, () => PackItemShopLinkModel());
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    packItemShopLinkModel1.dispose();
    packItemShopLinkModel2.dispose();
    packItemShopLinkModel3.dispose();
    navBarreModel.dispose();
  }
}
