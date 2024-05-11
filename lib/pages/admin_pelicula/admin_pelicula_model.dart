import '/flutter_flow/flutter_flow_util.dart';
import 'admin_pelicula_widget.dart' show AdminPeliculaWidget;
import 'package:flutter/material.dart';

class AdminPeliculaModel extends FlutterFlowModel<AdminPeliculaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
