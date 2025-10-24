part of 'book_cubit.dart';

enum SortBy { author, title }

enum BookStatus { initial, loading, success, details }

class BookState extends Equatable {
  const BookState({
    this.status = BookStatus.initial,
    this.books = const [],
    this.sortBy = SortBy.title,
    this.selectedBook,
  });

  final BookStatus status;
  final List<Book> books;
  final SortBy sortBy;
  final Book? selectedBook;

  BookState copyWith({
    BookStatus? status,
    List<Book>? books,
    SortBy? sortBy,
    Book? selectedBook,
  }) {
    return BookState(
      status: status ?? this.status,
      books: books ?? this.books,
      sortBy: sortBy ?? this.sortBy,
      selectedBook: selectedBook ?? this.selectedBook,
    );
  }

  @override
  List<Object?> get props => [status, books, sortBy, selectedBook];
}
