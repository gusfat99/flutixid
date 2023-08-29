import 'package:bloc/bloc.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(const TicketList([])) {
    on<TicketEvent>((event, emit) async {
      if (event is BuyTicket) {
        print("event.ticket");
        print(event.ticket);
        await TicketService.saveTicket(event.userID, event.ticket);
        List<Ticket> tickets = (state as TicketList).tickets + [event.ticket];
        emit(TicketList(tickets));
      } else if (event is GetTickets) {
        List<Ticket> tickets = await TicketService.getTickets(event.userID);
        emit(TicketList(tickets));
      }
    });
  }
}
