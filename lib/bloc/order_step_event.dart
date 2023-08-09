part of 'order_step_bloc.dart';

@immutable
abstract class OrderStepEvent extends Equatable {
  const OrderStepEvent();
}

class GoToScheduleOrder extends OrderStepEvent {
  @override
  List<Object> get props => [];
}

class GoToSeatOrder extends OrderStepEvent {
  final Ticket ticket;
  const GoToSeatOrder(this.ticket);
  @override
  List<Object> get props => [ticket];
}

class GoToCheckoutOrder extends OrderStepEvent {
  final Ticket ticket;
  const GoToCheckoutOrder(this.ticket);
  @override
  List<Object> get props => [];
}
