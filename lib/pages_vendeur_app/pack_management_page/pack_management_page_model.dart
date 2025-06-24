import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pack_management_page_widget.dart' show PackManagementPageWidget;
import 'package:flutter/material.dart';

class PackManagementPageModel
    extends FlutterFlowModel<PackManagementPageWidget> {
  ///  Local state fields for this page.

  PackDataStruct? currentPack;
  void updateCurrentPackStruct(Function(PackDataStruct) updateFn) {
    updateFn(currentPack ??= PackDataStruct());
  }

  bool toggleBlur = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFullPackDetails] action in PackManagementPage widget.
  PackDataStruct? fullPackData;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<PacksRow>? activeForSaleTrue;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<PacksRow>? activeForSaleFalse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Switch widget.
  List<PacksRow>? switchValueShopTrue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Switch widget.
  List<PacksRow>? switchValueShopTrueCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionTextController?.dispose();
  }
}
