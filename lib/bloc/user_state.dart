part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;

  const UserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserHasTopup extends UserState {
  final int amount;
  const UserHasTopup(this.amount);

  @override
  List<Object> get props => [amount];
}
