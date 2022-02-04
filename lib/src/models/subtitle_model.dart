import 'package:collection/collection.dart';

class Subtitles {
  Subtitles(this.subtitle);

  final List<Subtitle> subtitle;

  bool get isEmpty => subtitle.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Subtitle? getByPosition(Duration position) {
    final found = subtitle.firstWhereOrNull(
        (item) => position >= item.start && position <= item.end);

    return found;
  }
}

class Subtitle {
  Subtitle({
    required this.index,
    required this.start,
    required this.end,
    required this.text,
  });

  Subtitle copyWith({
    int? index,
    Duration? start,
    Duration? end,
    String? text,
  }) {
    return Subtitle(
      index: index ?? this.index,
      start: start ?? this.start,
      end: end ?? this.end,
      text: text ?? this.text,
    );
  }

  final int index;
  final Duration start;
  final Duration end;
  final String text;

  @override
  String toString() {
    return 'Subtitle(index: $index, start: $start, end: $end, text: $text)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Subtitle && o.start == start && o.end == end && o.text == text;
  }

  @override
  int get hashCode {
    return index.hashCode ^ start.hashCode ^ end.hashCode ^ text.hashCode;
  }
}
