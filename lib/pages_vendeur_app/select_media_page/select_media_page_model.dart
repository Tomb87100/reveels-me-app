import '/backend/schema/structs/index.dart';
import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_media_page_widget.dart' show SelectMediaPageWidget;
import 'package:flutter/material.dart';

class SelectMediaPageModel extends FlutterFlowModel<SelectMediaPageWidget> {
  ///  Local state fields for this page.

  bool isUploading = false;

  List<FFUploadedFile> stagedFiles = [];
  void addToStagedFiles(FFUploadedFile item) => stagedFiles.add(item);
  void removeFromStagedFiles(FFUploadedFile item) => stagedFiles.remove(item);
  void removeAtIndexFromStagedFiles(int index) => stagedFiles.removeAt(index);
  void insertAtIndexInStagedFiles(int index, FFUploadedFile item) =>
      stagedFiles.insert(index, item);
  void updateStagedFilesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      stagedFiles[index] = updateFn(stagedFiles[index]);

  List<MediaItemDataStruct> newlyAddedMedia = [];
  void addToNewlyAddedMedia(MediaItemDataStruct item) =>
      newlyAddedMedia.add(item);
  void removeFromNewlyAddedMedia(MediaItemDataStruct item) =>
      newlyAddedMedia.remove(item);
  void removeAtIndexFromNewlyAddedMedia(int index) =>
      newlyAddedMedia.removeAt(index);
  void insertAtIndexInNewlyAddedMedia(int index, MediaItemDataStruct item) =>
      newlyAddedMedia.insert(index, item);
  void updateNewlyAddedMediaAtIndex(
          int index, Function(MediaItemDataStruct) updateFn) =>
      newlyAddedMedia[index] = updateFn(newlyAddedMedia[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - selectOriginalMedia] action in ContainerMedias widget.
  List<FFUploadedFile>? selectedFilesList;
  // Stores action output result for [Custom Action - generateVideoThumbnail] action in ContainerMedias widget.
  FFUploadedFile? generatedThumbnail;
  // Stores action output result for [Custom Action - uploadFilesAndCreateRecord] action in ContainerMedias widget.
  MediaItemDataStruct? newCompleteMediaItem;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionTextControllerValidator;
  // Model for NavBarre component.
  late NavBarreModel navBarreModel;

  @override
  void initState(BuildContext context) {
    navBarreModel = createModel(context, () => NavBarreModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionTextController?.dispose();

    navBarreModel.dispose();
  }
}
