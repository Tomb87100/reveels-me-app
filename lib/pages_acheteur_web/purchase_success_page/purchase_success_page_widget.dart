import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'purchase_success_page_model.dart';
export 'purchase_success_page_model.dart';

class PurchaseSuccessPageWidget extends StatefulWidget {
  const PurchaseSuccessPageWidget({
    super.key,
    this.sessionId,
  });

  final String? sessionId;

  static String routeName = 'PurchaseSuccessPage';
  static String routePath = '/purchaseSuccessPage';

  @override
  State<PurchaseSuccessPageWidget> createState() =>
      _PurchaseSuccessPageWidgetState();
}

class _PurchaseSuccessPageWidgetState extends State<PurchaseSuccessPageWidget> {
  late PurchaseSuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PurchaseSuccessPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.sessionIdFromUrl = await actions.getUrlParameter(
        'session_id',
      );
      _model.mediaResponse = await GetPurchasedPackMediaCall.call(
        sessionId: _model.sessionIdFromUrl,
      );
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'Nombres de medias${GetPurchasedPackMediaCall.mediacount(
                      (_model.mediaResponse?.jsonBody ?? ''),
                    )?.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final mediaItem = getJsonField(
                        (_model.mediaResponse?.jsonBody ?? ''),
                        r'''$.media''',
                      ).toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.8,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: mediaItem.length,
                        itemBuilder: (context, mediaItemIndex) {
                          final mediaItemItem = mediaItem[mediaItemIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                MediaViewerPageWidget.routeName,
                                queryParameters: {
                                  'mediaUrl': serializeParam(
                                    getJsonField(
                                      mediaItemItem,
                                      r'''$.signedUrl''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'mediaType': serializeParam(
                                    getJsonField(
                                      mediaItemItem,
                                      r'''$.media_type''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: 200.0,
                              height: 300.0,
                              child: custom_widgets.MediaThumbnail(
                                width: 200.0,
                                height: 300.0,
                                imageUrl: getJsonField(
                                  mediaItemItem,
                                  r'''$.signedUrl''',
                                ).toString(),
                                mediaType: getJsonField(
                                  mediaItemItem,
                                  r'''$.media_type''',
                                ).toString(),
                                blurHash: getJsonField(
                                  mediaItemItem,
                                  r'''$.blur_hash''',
                                ).toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Boutique du créateur',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ].divide(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
