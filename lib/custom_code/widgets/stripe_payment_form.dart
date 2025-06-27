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

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

class StripePaymentForm extends StatefulWidget {
  const StripePaymentForm({
    Key? key,
    this.width,
    this.height,
    required this.clientSecret,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String clientSecret;

  @override
  _StripePaymentFormState createState() => _StripePaymentFormState();
}

class _StripePaymentFormState extends State<StripePaymentForm> {
  // Flag pour s'assurer que Stripe n'est initialisé qu'une seule fois.
  static bool _stripeInitialized = false;

  final controller = CardEditController();
  bool _isLoading = false;
  bool _isInitializing = true; // Nouvel état pour gérer l'initialisation

  @override
  void initState() {
    super.initState();
    _initializeStripe();
  }

  Future<void> _initializeStripe() async {
    // Si ce n'est pas déjà fait, on initialise Stripe.
    if (!_stripeInitialized) {
      try {
        // !! IMPORTANT !! Remplacez par votre clé PUBLISHABLE de test
        Stripe.publishableKey =
            'pk_test_51ReAjgPD7CtFOTws2zGCyYYBWcjK6uGcHuDvda7ksQN9DEy4CMvcGtEpZuk2Hf4Vup7HdZFRIYhqKfprgW2ZKa8K00QanymteB';
        Stripe.merchantIdentifier = 'merchant.com.your.app';
        await Stripe.instance.applySettings();
        _stripeInitialized =
            true; // On met le flag à true pour ne pas le refaire
      } catch (e) {
        print('Failed to initialize Stripe: $e');
        // Gérer l'erreur si nécessaire
      }
    }
    // Une fois l'initialisation terminée (ou si elle était déjà faite), on affiche le formulaire
    setState(() {
      _isInitializing = false;
    });
    controller.addListener(update);
  }

  void update() => setState(() {});

  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();
    super.dispose();
  }

  Future<void> _handlePayPress() async {
    // ... (le reste de la fonction ne change pas)
    if (!controller.complete) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Veuillez remplir tous les champs de la carte.')),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final paymentIntent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: widget.clientSecret,
        data: PaymentMethodParams.card(
          paymentMethodData:
              PaymentMethodData(billingDetails: BillingDetails()),
        ),
      );
      setState(() {
        _isLoading = false;
      });
      context.pushNamed(
        'PurchaseSuccessPage',
        queryParameters: {
          'paymentIntentId': serializeParam(paymentIntent.id, ParamType.String),
        }.withoutNulls,
      );
    } on Exception catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de paiement: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tant que Stripe s'initialise, on affiche un loader.
    if (_isInitializing) {
      return Center(child: CircularProgressIndicator());
    }

    // Le reste du widget est identique
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardField(
          controller: controller,
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(16),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _handlePayPress,
          child: _isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text('Payer en toute sécurité'),
          style: ElevatedButton.styleFrom(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
