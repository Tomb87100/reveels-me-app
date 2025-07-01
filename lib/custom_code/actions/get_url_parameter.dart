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

import 'index.dart'; // Imports other custom actions

// Importe la librairie web de Dart pour accéder à l'URL
import 'dart:html' as html;

Future<String?> getUrlParameter(String paramName) async {
  // Cette fonction lit l'URL actuelle du navigateur
  // en utilisant la méthode correcte "Uri.parse"
  // et retourne la valeur du paramètre demandé.
  final uri = Uri.parse(html.window.location.href);
  return uri.queryParameters[paramName];
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
