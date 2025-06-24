import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'configure_pack_page_widget.dart' show ConfigurePackPageWidget;
import 'package:flutter/material.dart';

class ConfigurePackPageModel extends FlutterFlowModel<ConfigurePackPageWidget> {
  ///  Local state fields for this page.

  String? selectedCoverPath;

  String? newDedicatedCoverPath;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for EuroSymbole widget.
  FocusNode? euroSymboleFocusNode;
  TextEditingController? euroSymboleTextController;
  String? Function(BuildContext, String?)? euroSymboleTextControllerValidator;
  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionTextControllerValidator;
  // Stores action output result for [Custom Action - selectAndUploadCoverImage] action in OnlineMediaPreview widget.
  String? uploadedPath;
  // Stores action output result for [Custom Action - getAuthToken] action in Button widget.
  String? getAuthTokenOutput;
  // Stores action output result for [Backend Call - API (publishPack)] action in Button widget.
  ApiCallResponse? publishPackOutPut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    euroSymboleFocusNode?.dispose();
    euroSymboleTextController?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionTextController?.dispose();
  }
}
