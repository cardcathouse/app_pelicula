import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'big_movie_a_p_i_model.dart';
export 'big_movie_a_p_i_model.dart';

class BigMovieAPIWidget extends StatefulWidget {
  const BigMovieAPIWidget({
    super.key,
    required this.imagen,
    required this.titulo,
    required this.year,
    required this.director,
    required this.genero,
    required this.sinopsis,
    required this.calificacion,
    required this.duracion,
  });

  final String? imagen;
  final String? titulo;
  final String? year;
  final String? director;
  final String? genero;
  final String? sinopsis;
  final double? calificacion;
  final int? duracion;

  @override
  State<BigMovieAPIWidget> createState() => _BigMovieAPIWidgetState();
}

class _BigMovieAPIWidgetState extends State<BigMovieAPIWidget> {
  late BigMovieAPIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigMovieAPIModel());
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
            Text(
              valueOrDefault<String>(
                widget.duracion?.toString(),
                '0h0m',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
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
                valueOrDefault<String>(
                  widget.year,
                  '2000',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.director,
                  'Tingus',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.genero,
                  'Ninguno',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFD905),
                  size: 24.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.calificacion?.toString(),
                    '0.0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ],
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
            valueOrDefault<String>(
              widget.sinopsis,
              'Nada',
            ),
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
