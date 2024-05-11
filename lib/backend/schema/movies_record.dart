import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoviesRecord extends FirestoreRecord {
  MoviesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "director" field.
  String? _director;
  String get director => _director ?? '';
  bool hasDirector() => _director != null;

  // "plotSummary" field.
  String? _plotSummary;
  String get plotSummary => _plotSummary ?? '';
  bool hasPlotSummary() => _plotSummary != null;

  // "movieId" field.
  int? _movieId;
  int get movieId => _movieId ?? 0;
  bool hasMovieId() => _movieId != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "moviePoster" field.
  String? _moviePoster;
  String get moviePoster => _moviePoster ?? '';
  bool hasMoviePoster() => _moviePoster != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _year = castToType<int>(snapshotData['year']);
    _director = snapshotData['director'] as String?;
    _plotSummary = snapshotData['plotSummary'] as String?;
    _movieId = castToType<int>(snapshotData['movieId']);
    _genre = snapshotData['genre'] as String?;
    _moviePoster = snapshotData['moviePoster'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movies');

  static Stream<MoviesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoviesRecord.fromSnapshot(s));

  static Future<MoviesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoviesRecord.fromSnapshot(s));

  static MoviesRecord fromSnapshot(DocumentSnapshot snapshot) => MoviesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoviesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoviesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoviesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoviesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoviesRecordData({
  String? title,
  int? year,
  String? director,
  String? plotSummary,
  int? movieId,
  String? genre,
  String? moviePoster,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'year': year,
      'director': director,
      'plotSummary': plotSummary,
      'movieId': movieId,
      'genre': genre,
      'moviePoster': moviePoster,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoviesRecordDocumentEquality implements Equality<MoviesRecord> {
  const MoviesRecordDocumentEquality();

  @override
  bool equals(MoviesRecord? e1, MoviesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.year == e2?.year &&
        e1?.director == e2?.director &&
        e1?.plotSummary == e2?.plotSummary &&
        e1?.movieId == e2?.movieId &&
        e1?.genre == e2?.genre &&
        e1?.moviePoster == e2?.moviePoster;
  }

  @override
  int hash(MoviesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.year,
        e?.director,
        e?.plotSummary,
        e?.movieId,
        e?.genre,
        e?.moviePoster
      ]);

  @override
  bool isValidKey(Object? o) => o is MoviesRecord;
}
