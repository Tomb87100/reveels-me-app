import '/backend/api_requests/api_calls.dart';
import '/component_vendeur_app/item_transaction_virement/item_transaction_virement_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'financials_history_page_widget.dart' show FinancialsHistoryPageWidget;
import 'package:flutter/material.dart';

class FinancialsHistoryPageModel
    extends FlutterFlowModel<FinancialsHistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getAuthToken] action in Button widget.
  String? userAuthToken;
  // Stores action output result for [Backend Call - API (createStripeConnectAccount)] action in Button widget.
  ApiCallResponse? stripeApiResponse;
  // Stores action output result for [Backend Call - API (requestPayout)] action in Button widget.
  ApiCallResponse? payoutResponse;
  // Model for ItemTransactionVirement component.
  late ItemTransactionVirementModel itemTransactionVirementModel;

  @override
  void initState(BuildContext context) {
    itemTransactionVirementModel =
        createModel(context, () => ItemTransactionVirementModel());
  }

  @override
  void dispose() {
    itemTransactionVirementModel.dispose();
  }
}
