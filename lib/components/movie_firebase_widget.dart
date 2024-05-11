import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_firebase_model.dart';
export 'movie_firebase_model.dart';

class MovieFirebaseWidget extends StatefulWidget {
  const MovieFirebaseWidget({
    super.key,
    required this.poster,
    required this.title,
  });

  final String? poster;
  final String? title;

  @override
  State<MovieFirebaseWidget> createState() => _MovieFirebaseWidgetState();
}

class _MovieFirebaseWidgetState extends State<MovieFirebaseWidget> {
  late MovieFirebaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieFirebaseModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://picsum.photos/seed/525/600',
            width: 100.0,
            height: 149.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Título',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Sora',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ].divide(const SizedBox(width: 10.0)),
    );
  }
}
