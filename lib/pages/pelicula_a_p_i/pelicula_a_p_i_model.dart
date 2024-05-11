import '/components/big_movie_a_p_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pelicula_a_p_i_widget.dart' show PeliculaAPIWidget;
import 'package:flutter/material.dart';

class PeliculaAPIModel extends FlutterFlowModel<PeliculaAPIWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bigMovieAPI component.
  late BigMovieAPIModel bigMovieAPIModel;

  @override
  void initState(BuildContext context) {
    bigMovieAPIModel = createModel(context, () => BigMovieAPIModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bigMovieAPIModel.dispose();
  }
}
