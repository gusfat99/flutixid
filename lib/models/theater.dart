part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("BTM 21"),
  Theater("AEON MALL SENTUL CITIY XXI"),
  Theater("BOGOR SQUARE XXI"),
  Theater("BOTANI SQUARE XXI"),
  Theater("CIBINONG CITY XXI"),
];
