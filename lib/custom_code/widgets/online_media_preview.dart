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

// Code Corrigé pour OnlineMediaPreview
// Imports nécessaires pour faire fonctionner le widget avec FlutterFlow et les appels API.
// Imports nécessaires pour faire fonctionner le widget avec FlutterFlow et les appels API.
// Imports nécessaires pour Flutter et pour appeler Supabase directement.
// Imports nécessaires
// Imports nécessaires
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnlineMediaPreview extends StatefulWidget {
  const OnlineMediaPreview({
    Key? key,
    this.storagePath,
    this.width,
    this.height,
  }) : super(key: key);

  final String? storagePath;
  final double? width;
  final double? height;

  @override
  _OnlineMediaPreviewState createState() => _OnlineMediaPreviewState();
}

class _OnlineMediaPreviewState extends State<OnlineMediaPreview> {
  Future<String?>? getSignedUrlFuture;

  @override
  void initState() {
    super.initState();
    if (widget.storagePath != null && widget.storagePath!.isNotEmpty) {
      getSignedUrlFuture = _fetchSignedUrl();
    }
  }

  @override
  void didUpdateWidget(OnlineMediaPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.storagePath != oldWidget.storagePath) {
      if (widget.storagePath != null && widget.storagePath!.isNotEmpty) {
        setState(() {
          getSignedUrlFuture = _fetchSignedUrl();
        });
      }
    }
  }

  Future<String?> _fetchSignedUrl() async {
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'getSignedUrls',
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
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (getSignedUrlFuture == null) {
      return Container(
        width: widget.width ?? 150,
        height: widget.height ?? 150,
        decoration: BoxDecoration(
          color: Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    return FutureBuilder<String?>(
      future: getSignedUrlFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: widget.width ?? 150,
            height: widget.height ?? 150,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            width: widget.width ?? 150,
            height: widget.height ?? 150,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.error_outline, color: Colors.redAccent),
          );
        }

        final signedUrl = snapshot.data!;
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            signedUrl,
            width: widget.width ?? 150,
            height: widget.height ?? 150,
            fit: BoxFit.cover,
          ),
        );
        // La ligne manquante était ici. Le compilateur n'était pas certain
        // que tous les chemins possibles retournaient un widget.
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
