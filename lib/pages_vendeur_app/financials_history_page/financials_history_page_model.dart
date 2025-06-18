import '/component_vendeur_app/item_transaction_virement/item_transaction_virement_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'financials_history_page_widget.dart' show FinancialsHistoryPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinancialsHistoryPageModel
    extends FlutterFlowModel<FinancialsHistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ItemTransactionVirement component.
  late ItemTransactionVirementModel itemTransactionVirementModel1;
  // Model for ItemTransactionVirement component.
  late ItemTransactionVirementModel itemTransactionVirementModel2;

  @override
  void initState(BuildContext context) {
    itemTransactionVirementModel1 =
        createModel(context, () => ItemTransactionVirementModel());
    itemTransactionVirementModel2 =
        createModel(context, () => ItemTransactionVirementModel());
  }

  @override
  void dispose() {
    itemTransactionVirementModel1.dispose();
    itemTransactionVirementModel2.dispose();
  }
}
