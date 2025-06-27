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

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<ProfileDataStruct?> fetchCurrentUserProfile() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    print('❌ [PROFIL] Echec: Utilisateur non connecté.');
    return null;
  }

  // --- Mécanisme de Réessai ---
  const maxRetries = 3;
  const delayBetweenRetries =
      Duration(milliseconds: 500); // On augmente un peu le délai

  for (int i = 0; i < maxRetries; i++) {
    try {
      print('▶️ [PROFIL] Tentative ${i + 1}/$maxRetries de chargement...');

      // LA MODIFICATION CLÉ : On n'utilise plus .single()
      // On fait une requête simple qui ne plantera pas si elle ne trouve rien.
      final response =
          await supabase.from('profiles').select().eq('id', user.id);

      // On vérifie manuellement si la réponse contient des données.
      if (response.isNotEmpty) {
        // La réponse est une liste, on prend le premier élément.
        final profileData = response.first;
        print('✅ [PROFIL] Profil trouvé ! Données brutes : $profileData');

        final profile = ProfileDataStruct(
          id: profileData['id'] ?? '',
          email: profileData['email'] ?? '',
          publicName: profileData['public_name'] ?? '',
          publicBio: profileData['public_bio'] ?? '',
          avatarUrl: profileData['avatar_url'] ?? '',
          shopUrlSlug: profileData['shop_url_slug'] ?? '',
          stripeAccountId: profileData['stripe_account_id'] ?? '',
          stripeKycStatus: profileData['stripe_kyc_status'] ?? '',
        );

        print(
            '✅ [PROFIL] Profil converti avec succès. shopUrlSlug: ${profile.shopUrlSlug}');
        // Si tout a réussi, on retourne le profil et on arrête la fonction ici.
        return profile;
      } else {
        // Si la réponse est vide, on le signale et on passe à la tentative suivante.
        throw 'Profil non trouvé (0 lignes retournées).';
      }
    } catch (e) {
      print('⚠️ [PROFIL] Tentative ${i + 1} échouée. Erreur: $e');
      if (i < maxRetries - 1) {
        await Future.delayed(delayBetweenRetries);
      } else {
        print('❌ [PROFIL] Echec final après $maxRetries tentatives.');
        return null;
      }
    }
  }
  return null;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
