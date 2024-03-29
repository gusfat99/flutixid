part of 'models.dart';

class Ticket extends Equatable {
  final MovieDetail movieDetail;
  final Theater theater;
  final String bookingCode;
  final List<String> seat;
  final DateTime dateTime;
  final String name;
  final int price;

  const Ticket(
    this.movieDetail,
    this.theater,
    this.bookingCode,
    this.seat,
    this.dateTime,
    this.name,
    this.price,
  );

  Ticket copyWith(
          {MovieDetail? movieDetail,
          Theater? theater,
          String? bookingCode,
          List<String>? seat,
          DateTime? dateTime,
          String? name,
          int? price}) =>
      Ticket(
          movieDetail ?? this.movieDetail,
          theater ?? this.theater,
          bookingCode ?? this.bookingCode,
          seat ?? this.seat,
          dateTime ?? this.dateTime,
          name ?? this.name,
          price ?? this.price);

  String get seatsInString {
    return seat.join(",");
  }

  @override
  List<Object> get props => [
        movieDetail,
        theater,
        bookingCode,
        seat,
        dateTime,
        name,
        price,
      ];
}
