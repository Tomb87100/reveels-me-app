import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'public_pack_view_page_widget.dart' show PublicPackViewPageWidget;
import 'package:flutter/material.dart';

class PublicPackViewPageModel
    extends FlutterFlowModel<PublicPackViewPageWidget> {
  ///  Local state fields for this page.

  dynamic packData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getPublicPackDetailsAPI)] action in PublicPackViewPage widget.
  ApiCallResponse? packSlugAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
