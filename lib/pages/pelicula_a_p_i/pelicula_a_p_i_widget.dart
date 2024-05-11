import '/backend/api_requests/api_calls.dart';
import '/components/big_movie_a_p_i_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pelicula_a_p_i_model.dart';
export 'pelicula_a_p_i_model.dart';

class PeliculaAPIWidget extends StatefulWidget {
  const PeliculaAPIWidget({
    super.key,
    required this.movieId,
  });

  final int? movieId;

  @override
  State<PeliculaAPIWidget> createState() => _PeliculaAPIWidgetState();
}

class _PeliculaAPIWidgetState extends State<PeliculaAPIWidget> {
  late PeliculaAPIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeliculaAPIModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: DetallePeliculaAPICall.call(
        movieId: widget.movieId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final peliculaAPIDetallePeliculaAPIResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                getJsonField(
                  peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                  r'''$.original_title''',
                ).toString(),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Sora',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: wrapWithModel(
                model: _model.bigMovieAPIModel,
                updateCallback: () => setState(() {}),
                child: BigMovieAPIWidget(
                  imagen:
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.poster_path''',
                  ).toString()}',
                  titulo: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.original_title''',
                  ).toString(),
                  year: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.release_date''',
                  ).toString(),
                  director: 'Shunji Iwai',
                  genero: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.genres[0:2]..name''',
                  ).toString(),
                  sinopsis: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.overview''',
                  ).toString(),
                  calificacion: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.vote_average''',
                  ),
                  duracion: getJsonField(
                    peliculaAPIDetallePeliculaAPIResponse.jsonBody,
                    r'''$.runtime''',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
