// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';

Future<String?> selectAndUploadCoverImage(String sellerId) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    withData: false,
  );

  if (result == null || result.files.single.path == null) {
    return null;
  }

  final file = File(result.files.single.path!);
  final fileName = result.files.single.name;
  final sanitizedFileName = fileName.replaceAll(RegExp(r'[^\w.\-]+'), '_');

  final mimeType = lookupMimeType(fileName) ?? 'application/octet-stream';
  final path =
      '$sellerId/covers/${DateTime.now().millisecondsSinceEpoch}_$sanitizedFileName';

  await Supabase.instance.client.storage.from('pack-media').upload(
        path,
        file,
        fileOptions: FileOptions(contentType: mimeType, upsert: true),
      );

  return path;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
