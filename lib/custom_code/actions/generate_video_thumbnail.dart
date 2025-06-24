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
import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

Future<FFUploadedFile?> generateVideoThumbnail(
  LocalFileDataStruct videoFile,
) async {
  final lowerCaseName = (videoFile.name).toLowerCase();
  final isVideo = lowerCaseName.endsWith('.mp4') ||
      lowerCaseName.endsWith('.mov') ||
      lowerCaseName.endsWith('.quicktime');

  if (!isVideo) {
    return null;
  }

  try {
    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: videoFile.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 400,
      quality: 80,
    );

    if (thumbnailBytes != null) {
      // --- CORRECTION APPLIQUÉE ICI ---
      // On retire l'ancienne extension et on force le .jpg
      String originalNameWithoutExt = videoFile.name.split('.').first;
      return FFUploadedFile(
        name: 'thumbnail_${originalNameWithoutExt}.jpg',
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
