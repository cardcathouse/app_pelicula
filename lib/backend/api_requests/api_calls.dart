import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NuevasPeliculasCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'NuevasPeliculas',
      apiUrl:
          'https://api.themoviedb.org/3/movie/now_playing?api_key=c5f91272e8db79e3deb27701f18d2894&language=en-US&page=1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? recientesResultados(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class DetallePeliculaAPICall {
  static Future<ApiCallResponse> call({
    int? movieId = 19995,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DetallePeliculaAPI',
      apiUrl:
          'https://api.themoviedb.org/3/movie/$movieId?api_key=c5f91272e8db79e3deb27701f18d2894&language=en-US',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? genres(dynamic response) => (getJsonField(
        response,
        r'''$.genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.original_title''',
      ));
  static String? sinopsis(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.overview''',
      ));
  static int? runtime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.runtime''',
      ));
  static double? vote(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.vote_average''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.release_date''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
