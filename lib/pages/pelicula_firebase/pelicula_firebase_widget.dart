import '/backend/backend.dart';
import '/components/big_movie_firebase_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pelicula_firebase_model.dart';
export 'pelicula_firebase_model.dart';

class PeliculaFirebaseWidget extends StatefulWidget {
  const PeliculaFirebaseWidget({
    super.key,
    int? movieId,
    this.movieID,
  }) : movieId = movieId ?? 1;

  final int movieId;
  final DocumentReference? movieID;

  @override
  State<PeliculaFirebaseWidget> createState() => _PeliculaFirebaseWidgetState();
}

class _PeliculaFirebaseWidgetState extends State<PeliculaFirebaseWidget> {
  late PeliculaFirebaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeliculaFirebaseModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: const Icon(
                Icons.delete_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<MoviesRecord>(
            stream: MoviesRecord.getDocument(widget.movieID!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final bigMovieFirebaseMoviesRecord = snapshot.data!;
              return wrapWithModel(
                model: _model.bigMovieFirebaseModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: BigMovieFirebaseWidget(
                  imagen: bigMovieFirebaseMoviesRecord.moviePoster,
                  titulo: bigMovieFirebaseMoviesRecord.title,
                  year: bigMovieFirebaseMoviesRecord.year.toString(),
                  director: bigMovieFirebaseMoviesRecord.director,
                  genero: bigMovieFirebaseMoviesRecord.genre,
                  sinopsis: bigMovieFirebaseMoviesRecord.plotSummary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
