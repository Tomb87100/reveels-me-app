import '/backend/schema/structs/index.dart';
import '/component_vendeur_app/nav_barre/nav_barre_widget.dart';
import '/component_vendeur_app/pack_list_item_component/pack_list_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_packs_page_model.dart';
export 'my_packs_page_model.dart';

class MyPacksPageWidget extends StatefulWidget {
  const MyPacksPageWidget({super.key});

  static String routeName = 'MyPacksPage';
  static String routePath = '/myPacksPage';

  @override
  State<MyPacksPageWidget> createState() => _MyPacksPageWidgetState();
}

class _MyPacksPageWidgetState extends State<MyPacksPageWidget> {
  late MyPacksPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPacksPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.myPacksList = await actions.fetchAndMapUserPacks();
      FFAppState().allMyPacks =
          _model.myPacksList!.toList().cast<PackDataStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Text(
                          'Mes Packs',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final packItemFromState =
                                FFAppState().allMyPacks.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: packItemFromState.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, packItemFromStateIndex) {
                                final packItemFromStateItem =
                                    packItemFromState[packItemFromStateIndex];
                                return wrapWithModel(
                                  model: _model.packListItemComponentModels
                                      .getModel(
                                    packItemFromStateItem.id,
                                    packItemFromStateIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: PackListItemComponentWidget(
                                    key: Key(
                                      'Keykm9_${packItemFromStateItem.id}',
                                    ),
                                    titre: packItemFromStateItem.name,
                                    price:
                                        packItemFromStateItem.baseSellerPrice,
                                    totalvente: packItemFromStateItem.totalSales
                                        .toDouble(),
                                    stats:
                                        '${packItemFromStateItem.mediaCount.toString()} / ${packItemFromStateItem.clickCount.toString()}',
                                    storagePath: packItemFromStateItem
                                                    .dedicatedCoverPath !=
                                                ''
                                        ? packItemFromStateItem
                                            .dedicatedCoverPath
                                        : packItemFromStateItem.coverImagePath,
                                    onTap: () async {
                                      context.pushNamed(
                                        PackManagementPageWidget.routeName,
                                        queryParameters: {
                                          'packId': serializeParam(
                                            packItemFromStateItem.id,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarreModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarreWidget(
                    number: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
