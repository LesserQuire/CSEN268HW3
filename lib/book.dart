import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String coverUrl;
  final String bookTitle;
  final String writer;
  final String summary;

  const Book({
    required this.coverUrl,
    required this.bookTitle,
    required this.writer,
    required this.summary,
  });

  Book copyWith({
    String? coverUrl,
    String? bookTitle,
    String? writer,
    String? summary,
  }) {
    return Book(
      coverUrl: coverUrl ?? this.coverUrl,
      bookTitle: bookTitle ?? this.bookTitle,
      writer: writer ?? this.writer,
      summary: summary ?? this.summary,
    );
  }

  @override
  List<Object?> get props => [coverUrl, bookTitle, writer, summary];
}
