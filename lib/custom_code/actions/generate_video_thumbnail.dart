// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Code mis à jour pour generateVideoThumbnail
import 'dart:io';
import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

Future<FFUploadedFile?> generateVideoThumbnail(FFUploadedFile videoFile) async {
  // CORRECTION: On gère le cas où le nom est null avec `?? ''`
  final lowerCaseName = (videoFile.name ?? '').toLowerCase();
  final isVideo = lowerCaseName.endsWith('.mp4') ||
      lowerCaseName.endsWith('.mov') ||
      lowerCaseName.endsWith('.quicktime');

  if (!isVideo || videoFile.bytes == null) {
    return null;
  }

  try {
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${videoFile.name}';
    await File(tempPath).writeAsBytes(videoFile.bytes!);

    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: tempPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 400,
      quality: 80,
    );

    await File(tempPath).delete();

    if (thumbnailBytes != null) {
      return FFUploadedFile(
        name: 'thumbnail_${videoFile.name}.jpg',
        bytes: thumbnailBytes,
      );
    }
  } catch (e) {
    print('Erreur de génération de miniature: $e');
    return null;
  }

  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
