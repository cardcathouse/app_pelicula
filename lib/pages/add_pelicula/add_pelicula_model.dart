import '/components/add_pelicula_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_pelicula_widget.dart' show AddPeliculaWidget;
import 'package:flutter/material.dart';

class AddPeliculaModel extends FlutterFlowModel<AddPeliculaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AddPeliculaWidget component.
  late AddPeliculaWidgetModel addPeliculaWidgetModel;

  @override
  void initState(BuildContext context) {
    addPeliculaWidgetModel =
        createModel(context, () => AddPeliculaWidgetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addPeliculaWidgetModel.dispose();
  }
}
