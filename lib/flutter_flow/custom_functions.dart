import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String calculateSellerEarnings(double? packPrice) {
  if (packPrice == null || packPrice <= 0) {
    return 'Vous recevrez 0,00 €';
  }
  // Commission de 10% sur le prix de base du vendeur
  double earnings = packPrice * 0.90;

  // Formatte le résultat en une chaîne de caractères monétaire pour la France
  final format = NumberFormat.currency(locale: 'fr_FR', symbol: '€');
  return 'Vous recevrez ${format.format(earnings)}';
}
