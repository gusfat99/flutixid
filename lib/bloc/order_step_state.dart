part of 'order_step_bloc.dart';

@immutable
abstract class OrderStepState extends Equatable {
  const OrderStepState();
}

class OrderStepInitial extends OrderStepState {
  @override
  List<Object> get props => [];
}

class OnSeatOrder extends OrderStepState {
  final Ticket ticket;
  const OnSeatOrder(this.ticket);
  @override
  List<Object> get props => [ticket];
}

class OnCheckoutOrder extends OrderStepState {
  final Ticket ticket;
  const OnCheckoutOrder(this.ticket);
  @override
  List<Object> get props => [];
}
