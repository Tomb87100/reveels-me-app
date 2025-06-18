import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'infos_perso_widget.dart' show InfosPersoWidget;
import 'package:flutter/material.dart';

class InfosPersoModel extends FlutterFlowModel<InfosPersoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataGtt = false;
  FFUploadedFile uploadedLocalFile_uploadDataGtt =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataGtt = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
