part of 'services.dart';

class TicketService {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();

    var docs = snapshot.docs.where((element) {
      Map? data = element.data() as Map?;
      return (data!['userID'] == userId);
    });

    List<Ticket> tickets = [];

    for (var doc in docs) {
      Map? data = doc.data() as Map?;

      MovieDetail movieDetail =
          await MovieService.getDetailMovie(movieId: data!['movieID']);
      tickets.add(Ticket(
          movieDetail,
          Theater(data['theaterName']),
          data['bookingCode'],
          data['seat'].split(","),
          DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
          data['name'],
          data['price']));
    }
    return tickets;
  }

  static Future<void> saveTicket(String userId, Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movieDetail.id,
      'userID': userId,
      'theaterName': ticket.theater.name,
      'dateTime': ticket.dateTime.millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seat': ticket.seatsInString,
      'name': ticket.name,
      'price': ticket.price
    });
  }
}
