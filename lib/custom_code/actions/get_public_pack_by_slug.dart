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

Future<PackDataStruct?> getPublicPackBySlug(String? slug) async {
  if (slug == null || slug.isEmpty) {
    print('❌ [getPublicPackBySlug] Erreur: Le slug est manquant.');
    return null;
  }

  final supabase = Supabase.instance.client;
  print('▶️ [getPublicPackBySlug] Recherche du pack avec le slug: $slug');

  try {
    // 1. Récupérer les détails du pack via la vue.
    // .maybeSingle() est plus sûr car il retourne null au lieu de planter si rien n'est trouvé.
    final packResponse = await supabase
        .from('pack_details_view')
        .select()
        .eq('pack_slug', slug)
        .maybeSingle();

    if (packResponse == null) {
      print('❌ [getPublicPackBySlug] Aucun pack trouvé pour ce slug.');
      return null;
    }

    final packRow = packResponse as Map<String, dynamic>;
    final String packId = packRow['id'];
    print('✅ [getPublicPackBySlug] Pack trouvé (ID: $packId).');

    // 2. Récupérer les CHEMINS des médias associés.
    final mediaResponse = await supabase
        .from('media_items')
        .select('storage_path')
        .eq('pack_id', packId)
        .order('order_in_pack', ascending: true);

    final List<String> mediaPaths = (mediaResponse as List<dynamic>)
        .map((e) => (e as Map<String, dynamic>)['storage_path'] as String)
        .where((p) => p.isNotEmpty) // On ne garde que les chemins non vides
        .toList();

    // 3. Générer les URLs SIGNÉES pour les médias (si il y en a).
    List<String> signedMediaUrls = [];
    if (mediaPaths.isNotEmpty) {
      final urlResponse =
          await supabase.storage.from('pack-media').createSignedUrls(
                mediaPaths,
                60, // Les URLs sont valides 60 secondes
              );
      signedMediaUrls = urlResponse.map((e) => e.signedUrl).toList();
    }
    print(
        '✅ [getPublicPackBySlug] ${signedMediaUrls.length} URLs de médias signées.');

    // 4. Générer l'URL SIGNÉE pour l'image de couverture.
    final coverPath = packRow['dedicated_cover_path'] != null &&
            packRow['dedicated_cover_path'].isNotEmpty
        ? packRow['dedicated_cover_path']
        : packRow['cover_image_path'];

    String signedCoverUrl = '';
    if (coverPath != null && coverPath.isNotEmpty) {
      signedCoverUrl =
          await supabase.storage.from('pack-media').createSignedUrl(
                coverPath,
                60,
              );
    }
    print('✅ [getPublicPackBySlug] URL de couverture signée générée.');

    // 5. Assembler l'objet final avec les données propres et les URLs publiques.
    return PackDataStruct(
      id: packRow['id'],
      name: packRow['name'],
      description: packRow['description'],
      baseSellerPrice:
          (packRow['base_seller_price'] as num?)?.toDouble() ?? 0.0,
      // On injecte nos URLs signées ici.
      coverImagePath: signedCoverUrl,
      mediaItems: List.generate(signedMediaUrls.length, (index) {
        return MediaItemDataStruct(storagePath: signedMediaUrls[index]);
      }),
      // On initialise le reste pour éviter les erreurs.
      packSlug: packRow['pack_slug'] ?? '',
      mediaCount: (packRow['media_count'] as num?)?.toInt() ?? 0,
      clickCount: packRow['click_count'] ?? 0,
      totalSales: (packRow['total_sales'] as num?)?.toInt() ?? 0,
      totalRevenueNet:
          (packRow['total_revenue_net'] as num?)?.toDouble() ?? 0.0,
      isInShop: packRow['is_in_shop'] ?? false,
      isActiveForSale: packRow['is_active_for_sale'] ?? true,
      dedicatedCoverPath: '', // Non nécessaire ici
    );
  } catch (e) {
    print('❌ [getPublicPackBySlug] Erreur critique: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
