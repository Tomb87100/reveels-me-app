import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'media_viewer_page_model.dart';
export 'media_viewer_page_model.dart';

class MediaViewerPageWidget extends StatefulWidget {
  const MediaViewerPageWidget({
    super.key,
    this.mediaUrl,
    this.mediaType,
  });

  final String? mediaUrl;
  final String? mediaType;

  static String routeName = 'MediaViewerPage';
  static String routePath = '/mediaViewerPage';

  @override
  State<MediaViewerPageWidget> createState() => _MediaViewerPageWidgetState();
}

class _MediaViewerPageWidgetState extends State<MediaViewerPageWidget> {
  late MediaViewerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MediaViewerPageModel());

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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ],
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          if (widget.mediaType == 'VIDEO') {
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.LightweightVideoPlayer(
                                width: double.infinity,
                                height: double.infinity,
                                videoUrl: widget.mediaUrl!,
                              ),
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${widget.mediaUrl}',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 30.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
