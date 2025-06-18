import '/component_vendeur_app/promo_code_item_component/promo_code_item_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'promo_code_manager_component_widget.dart'
    show PromoCodeManagerComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PromoCodeManagerComponentModel
    extends FlutterFlowModel<PromoCodeManagerComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for PromoCodeItemComponent component.
  late PromoCodeItemComponentModel promoCodeItemComponentModel1;
  // Model for PromoCodeItemComponent component.
  late PromoCodeItemComponentModel promoCodeItemComponentModel2;

  @override
  void initState(BuildContext context) {
    promoCodeItemComponentModel1 =
        createModel(context, () => PromoCodeItemComponentModel());
    promoCodeItemComponentModel2 =
        createModel(context, () => PromoCodeItemComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    promoCodeItemComponentModel1.dispose();
    promoCodeItemComponentModel2.dispose();
  }
}
