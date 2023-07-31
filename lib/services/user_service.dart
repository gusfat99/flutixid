part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {

    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    Map data = snapshot.data() as Map;

    return User(
        id: id,
        email: data['email'],
        profilePicture: data['profilePicture'],
        selectedGenres: (data['selectedGenres'] as List).map((e) => e.toString()).toList() ,
        name: data['name'],
        balance: data['balance'],
        selectedLanguage: data['selectedLanguage']
    );
  }
}
