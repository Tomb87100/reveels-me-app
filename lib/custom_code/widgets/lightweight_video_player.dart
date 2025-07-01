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

// Importe le package video_player que nous avons déjà ajouté
import 'package:video_player/video_player.dart';

class LightweightVideoPlayer extends StatefulWidget {
  const LightweightVideoPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _LightweightVideoPlayerState createState() => _LightweightVideoPlayerState();
}

class _LightweightVideoPlayerState extends State<LightweightVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialise le contrôleur avec l'URL de la vidéo passée en paramètre
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // S'assure que la première image est affichée et lance la lecture
        setState(() {});
        _controller.setLooping(true); // Pour que la vidéo tourne en boucle
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // On vérifie si le contrôleur est bien initialisé
      child: _controller.value.isInitialized
          ? AspectRatio(
              // Affiche le lecteur vidéo avec le bon ratio
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : CircularProgressIndicator(), // Sinon, affiche un indicateur de chargement
    );
  }

  @override
  void dispose() {
    // Très important : libère les ressources quand le widget est détruit
    _controller.dispose();
    super.dispose();
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
