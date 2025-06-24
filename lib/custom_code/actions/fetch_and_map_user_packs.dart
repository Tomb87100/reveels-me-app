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

Future<List<PackDataStruct>> fetchAndMapUserPacks() async {
  // Récupération du client Supabase et de l'ID de l'utilisateur
  final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) {
    // Pas d'utilisateur connecté
    return [];
  }

  try {
    // On interroge la vue pack_details_view (inclut dedicated_cover_path)
    final response = await supabase
        .from('pack_details_view')
        .select()
        .eq('seller_id', userId)
        .order('created_at', ascending: false);

    // Conversion du résultat en liste de maps
    final data = List<Map<String, dynamic>>.from(response as List);

    return data.map<PackDataStruct>((p) {
      // On nettoie dedicated_cover_path pour éviter la chaîne "null"
      final rawDedicated = p['dedicated_cover_path'] as String?;
      final dedicated = (rawDedicated != null &&
              rawDedicated.toLowerCase() != 'null' &&
              rawDedicated.isNotEmpty)
          ? rawDedicated
          : '';

      return PackDataStruct(
        id: p['id'] as String,
        name: p['name'] as String? ?? '',
        description: p['description'] as String? ?? '',
        baseSellerPrice: (p['base_seller_price'] as num?)?.toDouble() ?? 0.0,
        coverImagePath: p['cover_image_path'] as String? ?? '',
        clickCount: p['click_count'] as int? ?? 0,
        totalSales: (p['total_sales'] as num?)?.toInt() ?? 0,
        totalRevenueNet: (p['total_revenue_net'] as num?)?.toDouble() ?? 0.0,
        // On ne charge pas les mediaItems ici (page détail s'en chargera)
        mediaItems: <MediaItemDataStruct>[],
        isInShop: p['is_in_shop'] as bool? ?? false,
        packSlug: p['pack_slug'] as String? ?? '',
        dedicatedCoverPath: dedicated,
        mediaCount: (p['media_count'] as num?)?.toInt() ?? 0,
      );
    }).toList();
  } catch (e) {
    print('Erreur dans fetchAndMapUserPacks: $e');
    return [];
  }
}
// ...
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
