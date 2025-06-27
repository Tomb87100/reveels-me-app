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

import 'index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnlineMediaPreview extends StatefulWidget {
  const OnlineMediaPreview({
    Key? key,
    this.storagePath,
    this.publicUrl, // NOUVEAU : Pour les URLs déjà signées
    this.width,
    this.height,
  }) : super(key: key);

  final String? storagePath;
  final String? publicUrl; // NOUVEAU PARAMÈTRE
  final double? width;
  final double? height;

  @override
  _OnlineMediaPreviewState createState() => _OnlineMediaPreviewState();
}

class _OnlineMediaPreviewState extends State<OnlineMediaPreview> {
  Future<String?>? getDisplayUrlFuture;

  @override
  void initState() {
    super.initState();
    _initializeUrl();
  }

  @override
  void didUpdateWidget(OnlineMediaPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    // On met à jour si publicUrl ou storagePath changent.
    if (widget.publicUrl != oldWidget.publicUrl ||
        widget.storagePath != oldWidget.storagePath) {
      setState(() {
        _initializeUrl();
      });
    }
  }

  void _initializeUrl() {
    // Logique améliorée :
    // 1. Priorité à l'URL publique déjà signée.
    if (widget.publicUrl != null && widget.publicUrl!.isNotEmpty) {
      getDisplayUrlFuture = Future.value(widget.publicUrl);
    }
    // 2. Sinon, on utilise l'ancienne méthode pour l'appli connectée.
    else if (widget.storagePath != null && widget.storagePath!.isNotEmpty) {
      getDisplayUrlFuture = _fetchSignedUrlFromEdgeFunction();
    }
    // 3. Sinon, on n'a rien à afficher.
    else {
      getDisplayUrlFuture = null;
    }
  }

  // Cette fonction est l'ancienne logique, elle ne sera utilisée que pour l'appli connectée.
  Future<String?> _fetchSignedUrlFromEdgeFunction() async {
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'getSignedUrls', // Votre fonction existante
        body: {
          'filePaths': [widget.storagePath!]
        },
      );
      if (response.data != null) {
        final signedUrl =
            getJsonField(response.data, r'$[0].signedUrl').toString();
        if (signedUrl.startsWith('http')) {
          return signedUrl;
        }
      }
      return null;
    } catch (e) {
      print('Erreur dans _fetchSignedUrlFromEdgeFunction: $e');
      return null;
    }
  }

  // Widget pour afficher un placeholder en cas de chargement ou d'erreur.
  Widget _buildPlaceholder({Widget? child}) {
    return Container(
      width: widget.width ?? 150,
      height: widget.height ?? 150,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (getDisplayUrlFuture == null) {
      return _buildPlaceholder();
    }

    return FutureBuilder<String?>(
      future: getDisplayUrlFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildPlaceholder(
              child: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildPlaceholder(
              child: Icon(Icons.error_outline, color: Colors.redAccent));
        }

        final url = snapshot.data!;
        // On affiche toujours une image, comme vous l'avez demandé.
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            url,
            width: widget.width ?? 150,
            height: widget.height ?? 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Affiche une icône d'erreur différente si le chargement de l'URL échoue.
              return _buildPlaceholder(
                  child: Icon(Icons.broken_image_outlined, color: Colors.grey));
            },
          ),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
