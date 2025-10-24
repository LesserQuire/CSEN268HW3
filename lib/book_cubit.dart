import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'book.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(const BookState());

  List<Book> _allBooks = [];
  SortBy _lastSortBy = SortBy.author;

  void init() {
    emit(state.copyWith(status: BookStatus.loading));
    _allBooks = _getBooks();
    sortBooks(_lastSortBy, initialSort: true);
  }

  void sortBooks(SortBy sortBy, {bool initialSort = false}) {
    _lastSortBy = sortBy;

    List<Book> sortedList = List.from(_allBooks);

    if (sortBy == SortBy.author) {
      sortedList.sort((a, b) => a.writer.compareTo(b.writer));
    } else {
      sortedList.sort((a, b) => a.bookTitle.compareTo(b.bookTitle));
    }

    emit(
      state.copyWith(
        status: BookStatus.success,
        books: sortedList,
        sortBy: sortBy,
      ),
    );
  }

  void showBookDetails(Book book) {
    emit(
      state.copyWith(
        status: BookStatus.details,
        selectedBook: book,
      ),
    );
  }

  void showBookList() {
    sortBooks(_lastSortBy);
  }

  List<Book> _getBooks() {
    return [
      Book(
        bookTitle: "The Left Hand of Darkness",
        writer: "Ursula K. Le Guin",
        coverUrl:
            "https://upload.wikimedia.org/wikipedia/en/8/88/TheLeftHandOfDarkness1stEd.jpg",
        summary:
            "The novel follows the story of Genly Ai, a human native of Terra, who is sent to the planet of Gethen as an envoy of the Ekumen, a loose confederation of planets. Ai's mission is to persuade the nations of Gethen to join the Ekumen, but he is stymied by a limited understanding of their culture. Individuals on Gethen are ambisexual, with no fixed sex; this situation has a strong influence on the planet's culture, and it creates a barrier of understanding for Ai.",
      ),
      Book(
        bookTitle: "The Wind-Up Bird Chronicle",
        writer: "Haruki Murakami",
        coverUrl:
            "https://upload.wikimedia.org/wikipedia/en/9/9f/Wind-up_Bird_Chronicle.jpg",
        summary:
            "The Wind-Up Bird Chronicle (ねじまき鳥クロニクル, Nejimakidori Kuronikuru) is a novel published in 1994–1995 by Japanese author Haruki Murakami. The American translation and its British adaptation, dubbed the \"only official translations\" (English), are by Jay Rubin and were first published in 1997. For this novel, Murakami received the Yomiuri Literary Award, which was awarded to him by one of his harshest former critics, Kenzaburō Ōe.",
      ),
      Book(
        bookTitle: "Amerika",
        writer: "Franz Kafka",
        coverUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Kafka_Amerika_1927.jpg/500px-Kafka_Amerika_1927.jpg",
        summary:
            "Amerika, also known as The Man Who Disappeared (Amerika), Amerika: The Missing Person and Lost in America, is the incomplete first novel by Franz Kafka (1883–1924), written between 1911 and 1914 and published posthumously in 1927. The novel originally began as a short story titled \"The Stoker\". The novel incorporates many details of the experiences of Kafka's relatives who had emigrated to the United States. The commonly used title Amerika is from the edition of the text put together by Kafka's close friend, Max Brod, after Kafka's death in 1924.",
      ),
      Book(
        bookTitle: "Orlando: A Biography",
        writer: "Virginia Woolf",
        coverUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Portadaorlando.jpg/500px-Portadaorlando.jpg",
        summary:
            "Orlando: A Biography is a novel by Virginia Woolf, first published on 11 October 1928, inspired by the tumultuous family history of the aristocratic poet and novelist Vita Sackville-West, Woolf's lover and close friend. It is a history of English literature in satiric form. The book describes the adventures of a poet who changes from man to woman and lives for centuries, meeting the key figures of English literary history. Considered a feminist classic, the book has been written about extensively by scholars of women's writing and gender and transgender studies.",
      ),
      Book(
        bookTitle: "A Room with a View",
        writer: "E. M. Forster",
        coverUrl:
        "https://upload.wikimedia.org/wikipedia/en/8/8e/A_Room_with_a_View.jpg",
        summary:
        "A Room with a View is a 1908 novel by English writer E. M. Forster, about a young woman in the restrained culture of Edwardian-era England. Set in Italy and England, the story is both a romance and a humorous critique of English society at the beginning of the 20th century. Merchant Ivory produced an award-winning film adaptation in 1985. ",
      )
    ];
  }
}
