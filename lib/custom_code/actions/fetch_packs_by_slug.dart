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

Future<List<PackDataStruct>> fetchPacksBySlug(String? slug) async {
  // Sécurité : si aucun slug n'est fourni, on ne retourne rien.
  if (slug == null || slug.isEmpty) {
    return [];
  }

  final supabase = Supabase.instance.client;

  try {
    // On interroge la vue complète pour avoir toutes les infos.
    final response = await supabase
        .from('pack_details_view')
        .select()
        .eq('shop_url_slug', slug) // On filtre par le slug de la boutique
        .eq('is_in_shop', true) // Le pack doit être dans la boutique
        .eq('is_active_for_sale', true) // Le pack doit être actif à la vente
        .order('created_at', ascending: false);

    // On convertit la réponse en une liste de maps pour la sécurité des types.
    final data = List<Map<String, dynamic>>.from(response as List);

    if (data.isEmpty) {
      return [];
    }

    // Mapping manuel pour convertir les données brutes en notre DataType PackData.
    // C'est la méthode la plus fiable que nous avons validée.
    return data.map<PackDataStruct>((p) {
      // On "nettoie" les chemins pour éviter le bug de la chaîne de caractères "null".
      final cleanDedicatedPath = (p['dedicated_cover_path'] != null &&
              p['dedicated_cover_path'].toString().toLowerCase() != 'null')
          ? p['dedicated_cover_path'] as String
          : '';

      final cleanCoverPath = (p['cover_image_path'] != null &&
              p['cover_image_path'].toString().toLowerCase() != 'null')
          ? p['cover_image_path'] as String
          : '';

      return PackDataStruct(
        id: p['id'],
        name: p['name'] ?? '',
        description: p['description'] ?? '',
        baseSellerPrice: (p['base_seller_price'] as num?)?.toDouble() ?? 0.0,
        coverImagePath: cleanCoverPath,
        clickCount: p['click_count'] ?? 0,
        totalSales: (p['total_sales'] as num?)?.toInt() ?? 0,
        totalRevenueNet: (p['total_revenue_net'] as num?)?.toDouble() ?? 0.0,
        mediaItems: [],
        isInShop: p['is_in_shop'] ?? false,
        packSlug: p['pack_slug'] ?? '',
        dedicatedCoverPath: cleanDedicatedPath,
        mediaCount: (p['media_count'] as num?)?.toInt() ?? 0,
        // Assurez-vous que tous les champs de votre DataType sont listés ici.
        isActiveForSale: p['is_active_for_sale'] ?? true,
      );
    }).toList();
  } catch (e) {
    print('Erreur dans fetchPacksBySlug: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
