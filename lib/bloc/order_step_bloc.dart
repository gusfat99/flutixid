import 'package:bloc/bloc.dart';
import 'package:flutix/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'order_step_event.dart';
part 'order_step_state.dart';

class OrderStepBloc extends Bloc<OrderStepEvent, OrderStepState> {
  OrderStepBloc() : super(OrderStepInitial()) {
    on<OrderStepEvent>((event, emit) {
      if (event is GoToSeatOrder) {
        emit(OnSeatOrder(event.ticket));
      } else if (event is GoToCheckoutOrder) {
        emit(OnCheckoutOrder(event.ticket));
      } else {
        emit(OrderStepInitial());
      } 
    });
  }
}
