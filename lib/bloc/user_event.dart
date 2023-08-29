part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String id;

  const LoadUser({required this.id});

  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

class UserTopup extends UserEvent {
  final int amount;
  const UserTopup(this.amount);

  @override
  List<Object> get props => [amount];
}

class UserPurcash extends UserEvent {
  final int amount;
  const UserPurcash(this.amount);

  @override
  List<Object> get props => [amount];
}
