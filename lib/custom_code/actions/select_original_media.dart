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

// Ce code est une version modifiée de votre Code 1.
// Imports nécessaires
import 'dart:io';
import 'package:file_picker/file_picker.dart';
// Importez vos structures pour que la fonction connaisse LocalFileData

Future<List<LocalFileDataStruct>> selectOriginalMedia() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.media,
    withData: false, // On ne charge toujours pas les bytes en mémoire
  );

  if (result == null) {
    return [];
  }

  // On convertit les fichiers sélectionnés en notre nouvelle structure
  return result.files
      .where((file) =>
          file.path !=
          null) // Sécurité : on ne garde que les fichiers avec un chemin
      .map((file) => LocalFileDataStruct(
            name: file.name,
            path: file.path!, // On stocke le nom et le chemin
          ))
      .toList();
}
