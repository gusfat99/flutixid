import 'package:bloc/bloc.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(const TicketState([])) {
    on<TicketEvent>((event, emit) async {
      if (event is BuyTicket) {
        await TicketService.saveTicket(event.userID, event.ticket);
        List<Ticket> tickets = (state as TicketState).tickets + [event.ticket];
        emit(TicketState(tickets));
      } else if (event is GetTickets) {
        List<Ticket> tickets = await TicketService.getTickets(event.userID);
       
        emit(TicketState(tickets));
      }
    });
  }
}
