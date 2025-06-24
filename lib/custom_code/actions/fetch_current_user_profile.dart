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
  // On récupère l'utilisateur actuellement connecté
  final user = supabase.auth.currentUser;

  // S'il n'y a personne de connecté, on ne fait rien.
  if (user == null) {
    return null;
  }

  try {
    // On interroge la table 'profiles' pour la ligne qui correspond à notre utilisateur
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single(); // On s'attend à une seule ligne en retour

    if (response == null) {
      return null; // Profil non trouvé
    }

    // On convertit manuellement la réponse en notre DataType pour être sûr
    return ProfileDataStruct(
      id: response['id'],
      email: response['email'],
      publicName: response['public_name'],
      publicBio: response['public_bio'],
      avatarUrl: response['avatar_url'],
      shopUrlSlug: response['shop_url_slug'],
      stripeAccountId: response['stripe_account_id'],
      stripeKycStatus: response['stripe_kyc_status'],
    );
  } catch (e) {
    print('Erreur lors du chargement du profil utilisateur: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
