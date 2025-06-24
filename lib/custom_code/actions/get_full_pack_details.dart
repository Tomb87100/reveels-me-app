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

Future<PackDataStruct?> getFullPackDetails(String? packId) async {
  if (packId == null || packId.isEmpty) {
    return null;
  }
  final supabase = Supabase.instance.client;

  try {
    // Étape 1 : Récupérer les détails du pack depuis notre vue complète
    final packResponse = await supabase
        .from('pack_details_view')
        .select()
        .eq('id', packId)
        .single();

    if (packResponse == null) {
      return null; // Le pack n'a pas été trouvé
    }

    // Étape 2 : Récupérer les médias associés à ce pack
    final mediaResponse = await supabase
        .from('media_items')
        .select()
        .eq('pack_id', packId)
        .order('order_in_pack', ascending: true);

    final List<Map<String, dynamic>> mediaData =
        List<Map<String, dynamic>>.from(mediaResponse);

    // --- CORRECTION APPLIQUÉE ICI ---
    // Étape 3 : Mapper les médias MANUELLEMENT en notre DataType MediaItemData
    final List<MediaItemDataStruct> mediaItemsList =
        mediaData.map<MediaItemDataStruct>((p) {
      return MediaItemDataStruct(
        id: p['id'],
        mediaType: p['media_type'],
        storagePath: p['storage_path'],
        thumbnailStoragePath: p['thumbnail_storage_path'],
        orderInPack: p['order_in_pack'] ?? 0,
        isBlurred: p['is_blurred'] ?? true,
      );
    }).toList();

    // Étape 4 : Construire l'objet PackData final manuellement, avec les données nettoyées.
    final rawDedicated = packResponse['dedicated_cover_path'];
    final cleanDedicatedPath = (rawDedicated != null &&
            rawDedicated.toString().isNotEmpty &&
            rawDedicated.toString().toLowerCase() != 'null')
        ? rawDedicated.toString()
        : '';

    final rawCover = packResponse['cover_image_path'];
    final cleanCoverPath = (rawCover != null &&
            rawCover.toString().isNotEmpty &&
            rawCover.toString().toLowerCase() != 'null')
        ? rawCover.toString()
        : '';

    return PackDataStruct(
      id: packResponse['id'],
      name: packResponse['name'],
      description: packResponse['description'],
      baseSellerPrice:
          (packResponse['base_seller_price'] as num?)?.toDouble() ?? 0.0,
      coverImagePath: cleanCoverPath,
      dedicatedCoverPath: cleanDedicatedPath,
      packSlug: packResponse['pack_slug'],
      isInShop: packResponse['is_in_shop'] ?? false,
      isActiveForSale: packResponse['is_active_for_sale'] ?? true,
      clickCount: packResponse['click_count'] ?? 0,
      totalSales: (packResponse['total_sales'] as num?)?.toInt() ?? 0,
      totalRevenueNet:
          (packResponse['total_revenue_net'] as num?)?.toDouble() ?? 0.0,
      mediaCount: (packResponse['media_count'] as num?)?.toInt() ?? 0,
      // On injecte notre liste de médias propre, que l'on vient de créer
      mediaItems: mediaItemsList,
    );
  } catch (e) {
    print('Erreur dans getFullPackDetails: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
