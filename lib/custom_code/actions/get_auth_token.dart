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

Future<String?> getAuthToken() async {
  // Cette ligne récupère la session utilisateur actuelle de Supabase.
  final session = Supabase.instance.client.auth.currentSession;

  // Si l'utilisateur n'est pas connecté, on ne retourne rien.
  if (session == null) {
    return null;
  }

  // On retourne le jeton d'accès en format "Bearer token", ce qui est le standard.
  return session.accessToken;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
