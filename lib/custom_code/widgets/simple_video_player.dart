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

import 'index.dart'; // Imports other custom widgets

import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  const SimpleVideoPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _SimpleVideoPlayerState createState() => _SimpleVideoPlayerState();
}

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    // On vérifie que l'URL n'est pas vide avant de lancer
    if (widget.videoUrl.isNotEmpty) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      _controller.initialize().then((_) {
        // if (mounted) est une bonne pratique pour éviter les erreurs
        if (mounted) {
          setState(() {
            _isInitialized = true;
            _controller.setLooping(true); // La vidéo tournera en boucle
            _controller.play();
          });
        }
      }).catchError((error) {
        // Si l'initialisation échoue (URL cassée, etc.)
        print("Erreur d'initialisation de la vidéo: $error");
        if (mounted) {
          setState(() {
            _hasError = true;
          });
        }
      });
    } else {
      _hasError = true;
    }
  }

  @override
  void dispose() {
    // Très important de libérer les ressources
    if (_isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Si il y a une erreur
    if (_hasError) {
      return Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 48,
        ),
      );
    }

    // Si la vidéo est initialisée, on l'affiche
    if (_isInitialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      );
    }

    // Sinon, on affiche un indicateur de chargement
    return Center(
      child: CircularProgressIndicator(
        color: FlutterFlowTheme.of(context).primary,
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
