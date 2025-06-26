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

Future<ProfileDataStruct?> fetchCurrentUserProfile() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    print('fetchCurrentUserProfile: Utilisateur non connecté.');
    return null;
  }

  try {
    final response =
        await supabase.from('profiles').select().eq('id', user.id).single();

    // Mapping sécurisé et explicite des noms de colonnes de la base de données
    // vers les champs de notre DataType FlutterFlow.
    return ProfileDataStruct(
      id: response['id'],
      email: response['email'],
      publicName:
          response['public_name'], // Correspond à la colonne public_name
      publicBio: response['public_bio'], // Correspond à la colonne public_bio
      avatarUrl: response['avatar_url'], // Correspond à la colonne avatar_url
      shopUrlSlug:
          response['shop_url_slug'], // Correspond à la colonne shop_url_slug
      stripeAccountId: response[
          'stripe_account_id'], // Correspond à la colonne stripe_account_id
      stripeKycStatus: response[
          'stripe_kyc_status'], // Correspond à la colonne stripe_kyc_status
    );
  } catch (e) {
    print('Erreur critique lors du chargement du profil utilisateur: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
