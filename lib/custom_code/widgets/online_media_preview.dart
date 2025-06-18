// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Code Corrigé pour OnlineMediaPreview
// Imports nécessaires pour faire fonctionner le widget avec FlutterFlow et les appels API.
// Imports nécessaires pour faire fonctionner le widget avec FlutterFlow et les appels API.
// Imports nécessaires pour Flutter et pour appeler Supabase directement.
// Imports nécessaires
// Imports nécessaires
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
    // --- ESPION N°1 ---
    print('--- WIDGET INIT ---');
    print('1. Le widget OnlineMediaPreview est créé.');
    print('2. Le storagePath reçu est: "${widget.storagePath}"');

    if (widget.storagePath != null && widget.storagePath!.isNotEmpty) {
      // --- ESPION N°2 ---
      print('3. La condition est VRAIE. Lancement de _fetchSignedUrl...');
      getSignedUrlFuture = _fetchSignedUrl();
    } else {
      // --- ESPION N°3 ---
      print(
          '3. La condition est FAUSSE. Le chemin est vide ou null. Pas d\'appel API.');
    }
  }

  Future<String?> _fetchSignedUrl() async {
    // --- ESPION N°4 ---
    print('4. Entrée dans _fetchSignedUrl. Tentative d\'appel API...');
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'getSignedUrls',
        body: {
          'filePaths': [widget.storagePath!]
        },
      );
      // --- ESPION N°5 ---
      print('5. APPEL API RÉUSSI. Réponse du serveur: ${response.data}');
      if (response.data != null) {
        final signedUrl =
            getJsonField(response.data, r'$[0].signedUrl').toString();
        print('6. URL extraite: "$signedUrl"');
        return signedUrl;
      }
      return null;
    } catch (e) {
      // --- ESPION N°6 ---
      print('7. ERREUR lors de l\'appel API: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (getSignedUrlFuture == null) {
      // ... Le code pour le carré gris reste le même
      return Container(/*...*/);
    }

    return FutureBuilder<String?>(
      future: getSignedUrlFuture,
      builder: (context, snapshot) {
        // ... Le reste du code du FutureBuilder est le même
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              /*...*/ child: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          // --- ESPION N°7 ---
          print('ERREUR DANS FUTUREBUILDER. Erreur: ${snapshot.error}');
          return Container(
              /*...*/ child:
                  Icon(Icons.error_outline, color: Colors.redAccent));
        }
        final signedUrl = snapshot.data!;
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(signedUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
