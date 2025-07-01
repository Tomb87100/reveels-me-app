// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class MediaThumbnail extends StatelessWidget {
  const MediaThumbnail({
    Key? key,
    this.width,
    this.height,
    this.imageUrl,
    required this.mediaType,
    this.blurHash,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imageUrl;
  final String mediaType;
  final String? blurHash;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Affiche l'image
          if (imageUrl != null && imageUrl!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: imageUrl!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  (blurHash != null && blurHash!.isNotEmpty)
                      ? BlurHash(hash: blurHash!)
                      : Container(color: Color(0xFFE0E0E0)),
              errorWidget: (context, url, error) =>
                  Container(color: Color(0xFFE0E0E0)),
            )
          else
            // Si pas d'URL, affiche le blurhash ou un fond gris
            (blurHash != null && blurHash!.isNotEmpty)
                ? SizedBox.expand(child: BlurHash(hash: blurHash!))
                : Container(color: Color(0xFFE0E0E0)),

          // Affiche une icône de lecture si c'est une vidéo
          if (mediaType.toUpperCase() == 'VIDEO')
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
