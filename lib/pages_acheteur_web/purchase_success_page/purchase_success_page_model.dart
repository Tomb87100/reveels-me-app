import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'purchase_success_page_widget.dart' show PurchaseSuccessPageWidget;
import 'package:flutter/material.dart';

class PurchaseSuccessPageModel
    extends FlutterFlowModel<PurchaseSuccessPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUrlParameter] action in PurchaseSuccessPage widget.
  String? sessionIdFromUrl;
  // Stores action output result for [Backend Call - API (getPurchasedPackMedia)] action in PurchaseSuccessPage widget.
  ApiCallResponse? mediaResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
