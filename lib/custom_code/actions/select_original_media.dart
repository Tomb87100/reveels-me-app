// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Ce code est une version modifiée de votre Code 1.
import 'package:file_picker/file_picker.dart';

Future<List<FFUploadedFile>> selectOriginalMedia() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.media,
  );

  if (result == null) {
    return [];
  }

  return result.files
      .map((file) => FFUploadedFile(
            name: file.name,
            bytes: file.bytes,
          ))
      .toList();
}
