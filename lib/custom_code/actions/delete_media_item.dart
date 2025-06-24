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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> deleteMediaItem(MediaItemDataStruct mediaItem) async {
  final supabase = Supabase.instance.client;

  // 1. Préparer la liste des fichiers à supprimer du Storage
  final List<String> pathsToDelete = [];
  pathsToDelete.add(mediaItem.storagePath);

  // Ajoute la miniature à la liste de suppression si elle existe
  if (mediaItem.thumbnailStoragePath != null &&
      mediaItem.thumbnailStoragePath!.isNotEmpty) {
    pathsToDelete.add(mediaItem.thumbnailStoragePath!);
  }

  // 2. Supprimer les fichiers du Storage
  if (pathsToDelete.isNotEmpty) {
    await supabase.storage.from('pack-media').remove(pathsToDelete);
  }

  // 3. Supprimer l'enregistrement de la base de données
  await supabase.from('media_items').delete().eq('id', mediaItem.id);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
