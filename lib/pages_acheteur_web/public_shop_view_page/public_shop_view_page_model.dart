import '/backend/api_requests/api_calls.dart';
import '/component_vendeur_app/pack_item_shop_link/pack_item_shop_link_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'public_shop_view_page_widget.dart' show PublicShopViewPageWidget;
import 'package:flutter/material.dart';

class PublicShopViewPageModel
    extends FlutterFlowModel<PublicShopViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getPublicShopData)] action in PublicShopViewPage widget.
  ApiCallResponse? shopDataResponse;
  // Models for PackItemShopLink dynamic component.
  late FlutterFlowDynamicModels<PackItemShopLinkModel> packItemShopLinkModels;

  @override
  void initState(BuildContext context) {
    packItemShopLinkModels =
        FlutterFlowDynamicModels(() => PackItemShopLinkModel());
  }

  @override
  void dispose() {
    packItemShopLinkModels.dispose();
  }
}
