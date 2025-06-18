// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mime/mime.dart'; // <-- AJOUT DE L'IMPORT

Future<MediaItemDataStruct> uploadFilesAndCreateRecord(
  FFUploadedFile originalFile,
  FFUploadedFile? thumbnailFile,
  String sellerId,
) async {
  final String originalFileName = originalFile.name ?? 'fichier_inconnu';
  final String mediaType = (thumbnailFile != null) ? 'video' : 'image';
  final int fileSize = originalFile.bytes?.length ?? 0;
  String originalStoragePath = '';
  String? thumbnailStoragePath;

  // 1. Upload du fichier original
  if (originalFile.bytes != null) {
    // --- MODIFICATION ICI ---
    // On détecte le type MIME du fichier original
    final mimeType =
        lookupMimeType(originalFileName) ?? 'application/octet-stream';
    final path =
        '$sellerId/${DateTime.now().millisecondsSinceEpoch}_$originalFileName';

    await Supabase.instance.client.storage.from('pack-media').uploadBinary(
          path,
          originalFile.bytes!,
          // On ajoute les options de fichier avec le type de contenu
          fileOptions: FileOptions(contentType: mimeType, upsert: true),
        );
    originalStoragePath = path;
  }

  // 2. Upload de la miniature si elle existe
  if (thumbnailFile != null && thumbnailFile.bytes != null) {
    // La miniature est toujours un JPEG, donc on peut forcer le type.
    final thumbMimeType = 'image/jpeg';
    final path =
        '$sellerId/${DateTime.now().millisecondsSinceEpoch}_${thumbnailFile.name}';

    await Supabase.instance.client.storage.from('pack-media').uploadBinary(
          path,
          thumbnailFile.bytes!,
          // On ajoute aussi les options ici
          fileOptions: FileOptions(contentType: thumbMimeType, upsert: true),
        );
    thumbnailStoragePath = path;
  }

  // 3. Création de l'enregistrement dans la base de données
  final response = await Supabase.instance.client
      .from('media_items')
      .insert({
        'seller_id': sellerId,
        'media_type': mediaType,
        'storage_path': originalStoragePath,
        'thumbnail_storage_path': thumbnailStoragePath,
        'pack_id': null,
        'file_name_original': originalFileName,
        'file_size_bytes': fileSize,
      })
      .select('id, created_at')
      .single();

  // On construit la structure de retour manuellement
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
