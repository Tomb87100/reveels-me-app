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

Future<void> deletePack(String? packId) async {
  if (packId == null || packId.isEmpty) {
    return;
  }
  final supabase = Supabase.instance.client;

  // On ne supprime que la ligne du pack.
  // La base de données (grâce à ON DELETE CASCADE) se chargera de supprimer
  // les media_items et sale_items associés.
  // La suppression des fichiers du Storage est une optimisation avancée (orphanage)
  // que l'on peut gérer plus tard avec des fonctions serveur périodiques.
  // Pour l'instant, on se concentre sur la suppression logique.

  await supabase.from('packs').delete().eq('id', packId);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
