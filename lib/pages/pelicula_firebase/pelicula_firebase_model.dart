import '/components/big_movie_firebase_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pelicula_firebase_widget.dart' show PeliculaFirebaseWidget;
import 'package:flutter/material.dart';

class PeliculaFirebaseModel extends FlutterFlowModel<PeliculaFirebaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bigMovieFirebase component.
  late BigMovieFirebaseModel bigMovieFirebaseModel;

  @override
  void initState(BuildContext context) {
    bigMovieFirebaseModel = createModel(context, () => BigMovieFirebaseModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bigMovieFirebaseModel.dispose();
  }
}
