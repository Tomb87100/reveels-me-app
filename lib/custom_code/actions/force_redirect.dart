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

// Import pour le web
import 'dart:js' as js;

Future<void> forceRedirect(String url) async {
  // Cette action utilise directement le Javascript du navigateur pour changer la page.
  // C'est souvent plus fiable que le "Launch URL" standard sur les navigateurs mobiles.
  js.context.callMethod('open', [url, '_self']);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
