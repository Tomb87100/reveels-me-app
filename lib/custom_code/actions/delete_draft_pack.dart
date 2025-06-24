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

Future<void> deleteDraftPack(
  PackDataStruct draftPack,
  String sellerId,
) async {
  final supabase = Supabase.instance.client;

  // 1. Collecter tous les chemins de fichiers à supprimer
  final List<String> pathsToDelete = [];
  for (var media in draftPack.mediaItems) {
    pathsToDelete.add(media.storagePath);
    if (media.thumbnailStoragePath != null &&
        media.thumbnailStoragePath!.isNotEmpty) {
      pathsToDelete.add(media.thumbnailStoragePath!);
    }
  }

  // 2. Supprimer tous les fichiers du Storage
  if (pathsToDelete.isNotEmpty) {
    await supabase.storage.from('pack-media').remove(pathsToDelete);
  }

  // 3. Supprimer tous les media_items "orphelins" de cet utilisateur
  await supabase
      .from('media_items')
      .delete()
      .eq('seller_id', sellerId)
      // ----- CORRECTION DÉFINITIVE APPLIQUÉE ICI -----
      // On remplace .is_('pack_id', null) par la syntaxe .filter()
      .filter('pack_id', 'is', null);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
