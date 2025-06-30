import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_bottom_sheet_widget.dart' show CheckoutBottomSheetWidget;
import 'package:flutter/material.dart';

class CheckoutBottomSheetModel
    extends FlutterFlowModel<CheckoutBottomSheetWidget> {
  ///  Local state fields for this component.

  String? clientSecret;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // Stores action output result for [Backend Call - API (getPublicPackDetailsAPI)] action in Button widget.
  ApiCallResponse? packDetailsResponse;
  // Stores action output result for [Backend Call - API (createPaymentIntent)] action in Button widget.
  ApiCallResponse? reponsePaiementAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();
  }
}
