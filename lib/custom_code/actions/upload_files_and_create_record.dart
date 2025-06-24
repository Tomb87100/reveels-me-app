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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';

Future<MediaItemDataStruct> uploadFilesAndCreateRecord(
  LocalFileDataStruct originalFile, // <-- ARGUMENT MODIFIÉ
  FFUploadedFile? thumbnailFile,
  String sellerId,
) async {
  final sanitizedFileName =
      (originalFile.name).replaceAll(RegExp(r'[^\w.\-]+'), '_');

  // On crée l'objet File à partir du chemin stocké dans notre structure
  final fileToUpload = File(originalFile.path);

  final String mediaType = (thumbnailFile != null) ? 'video' : 'image';
  final int fileSize = await fileToUpload.length();
  String originalStoragePath = '';
  String? thumbnailStoragePath;

  // On utilise upload() avec un objet File, au lieu de uploadBinary() avec des bytes
  final mimeType =
      lookupMimeType(sanitizedFileName) ?? 'application/octet-stream';
  final path =
      '$sellerId/${DateTime.now().millisecondsSinceEpoch}_$sanitizedFileName';

  await Supabase.instance.client.storage.from('pack-media').upload(
        path,
        fileToUpload, // On passe l'objet File directement
        fileOptions: FileOptions(contentType: mimeType, upsert: true),
      );
  originalStoragePath = path;

  // Le reste de la fonction (upload de miniature, insert, return) est inchangé...
  if (thumbnailFile != null && thumbnailFile.bytes != null) {
    final thumbMimeType = 'image/jpeg';
    final sanitizedThumbName = (thumbnailFile.name ?? 'thumbnail.jpg')
        .replaceAll(RegExp(r'[^\w.\-]+'), '_');
    final thumbPath =
        '$sellerId/${DateTime.now().millisecondsSinceEpoch}_$sanitizedThumbName';
    await Supabase.instance.client.storage.from('pack-media').uploadBinary(
          thumbPath,
          thumbnailFile.bytes!,
          fileOptions: FileOptions(contentType: thumbMimeType, upsert: true),
        );
    thumbnailStoragePath = thumbPath;
  }

  final response = await Supabase.instance.client
      .from('media_items')
      .insert({
        'seller_id': sellerId,
        'media_type': mediaType,
        'storage_path': originalStoragePath,
        'thumbnail_storage_path': thumbnailStoragePath,
        'pack_id': null,
        'file_name_original': originalFile.name,
        'file_size_bytes': fileSize,
        // ... dans l'objet .insert()
        'is_blurred':
            true, // On sauvegarde le média comme étant flouté par défaut
// ...
      })
      .select('id, created_at')
      .single();

  return MediaItemDataStruct(
    id: response['id'],
    mediaType: mediaType,
    storagePath: originalStoragePath,
    thumbnailStoragePath: thumbnailStoragePath,
    orderInPack: 0,
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
