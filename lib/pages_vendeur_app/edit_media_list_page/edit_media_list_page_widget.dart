import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_media_list_page_model.dart';
export 'edit_media_list_page_model.dart';

class EditMediaListPageWidget extends StatefulWidget {
  const EditMediaListPageWidget({super.key});

  static String routeName = 'EditMediaListPage';
  static String routePath = '/editMediaListPage';

  @override
  State<EditMediaListPageWidget> createState() =>
      _EditMediaListPageWidgetState();
}

class _EditMediaListPageWidgetState extends State<EditMediaListPageWidget> {
  late EditMediaListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMediaListPageModel());

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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      'Votres liste de medias',
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final mediaItemFromGrid =
                        FFAppState().packDraft.mediaItems.toList();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: mediaItemFromGrid.length,
                      itemBuilder: (context, mediaItemFromGridIndex) {
                        final mediaItemFromGridItem =
                            mediaItemFromGrid[mediaItemFromGridIndex];
                        return Stack(
                          children: [
                            Container(
                              width: 200.0,
                              height: 250.0,
                              child: custom_widgets.OnlineMediaPreview(
                                width: 200.0,
                                height: 250.0,
                                storagePath: mediaItemFromGridItem
                                                .thumbnailStoragePath !=
                                            ''
                                    ? mediaItemFromGridItem.thumbnailStoragePath
                                    : mediaItemFromGridItem.storagePath,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, -0.9),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 32.0,
                                fillColor: Color(0x32003E45),
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 17.0,
                                ),
                                onPressed: () async {
                                  await actions.deleteMediaItem(
                                    mediaItemFromGridItem,
                                  );
                                  FFAppState().updatePackDraftStruct(
                                    (e) => e
                                      ..updateMediaItems(
                                        (e) => e.remove(mediaItemFromGridItem),
                                      ),
                                  );
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ],
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
                text: 'Ajouter d\'autres medias',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
    );
  }
}
