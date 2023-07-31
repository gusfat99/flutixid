part of 'models.dart';

class RegistrationData extends Equatable {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLang;
  File? profileImage;

  RegistrationData(
      {this.name = "guest 1",
      this.email = "a@gmail.com",
      this.password = "123456",
      this.selectedGenres = const ['Horror', 'War', 'Super Hero', 'Drama'],
      this.selectedLang = "id",
      this.profileImage});

  List<Object> get props =>
      [name, email, password, selectedGenres, selectedLang];
}
