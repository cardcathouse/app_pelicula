import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'big_movie_firebase_model.dart';
export 'big_movie_firebase_model.dart';

class BigMovieFirebaseWidget extends StatefulWidget {
  const BigMovieFirebaseWidget({
    super.key,
    required this.imagen,
    required this.titulo,
    required this.year,
    required this.director,
    required this.genero,
    required this.sinopsis,
  });

  final String? imagen;
  final String? titulo;
  final String? year;
  final String? director;
  final String? genero;
  final String? sinopsis;

  @override
  State<BigMovieFirebaseWidget> createState() => _BigMovieFirebaseWidgetState();
}

class _BigMovieFirebaseWidgetState extends State<BigMovieFirebaseWidget> {
  late BigMovieFirebaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigMovieFirebaseModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.imagen!,
            width: double.infinity,
            height: 400.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget.titulo,
                'Pelicula',
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Sora',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Text(
            'Sinopsis',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Sora',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: AutoSizeText(
            'Hello World',
            textAlign: TextAlign.justify,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ].divide(const SizedBox(height: 15.0)),
    );
  }
}
