part of 'ticket_bloc.dart';

abstract class TicketState extends Equatable {
  const TicketState();
}

class TicketList extends TicketState {
  final List<Ticket> tickets;

  const TicketList(this.tickets);

  @override
  List<Object> get props => [tickets];
}
