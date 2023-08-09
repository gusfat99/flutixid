part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  //constructor
  const User(
      {required this.id,
        this.email = '',
        this.name = 'No Name',
        this.profilePicture = '',
        this.balance = 50000,
        this.selectedGenres = const [],
        this.selectedLanguage = 'id'});
  
  
  User copyWith({String? name, String? profilePicture, int? balance}) => User(
      id: id,
      email: email,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      balance: balance ?? this.balance,
      selectedGenres: selectedGenres,
      selectedLanguage: selectedLanguage);

  @override
  List<Object> get props => [
    id,
    email,
    name,
    profilePicture,
    selectedGenres,
    selectedLanguage,
    balance
  ];
}
