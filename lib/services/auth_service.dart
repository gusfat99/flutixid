part of 'services.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {

      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = User(
          id: result.user!.uid,
          email: email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(
          success: true,
          message: 'Success',
          user: user
      );
    } on auth.FirebaseAuthException catch (e) {
      var msg = '';

      if (e.code == 'weak-password') {
        msg = ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        msg = ('The account already exists for that email.');
      }

      return SignInSignUpResult(
          user: User(id: "", email: ''), message: msg, success: false);
    } catch (e) {
      print(e.toString());
      return SignInSignUpResult(
          user: User(id: "", email: ''),
          message: "Successfull",
          success: false);
    }
  }

  static Future<SignInSignUpResult> signIn(String email, String password) async {
    try{
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = await UserServices.getUser(result.user!.uid);
      return SignInSignUpResult(
          user: user,
          message: "Success",
          success: true);
    } catch(e) {
      return SignInSignUpResult(
          user: User(id: "", email: ''),
          message: 'User not found, the password or username is wrong!',
          success: false);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User?> get userStream => _auth.authStateChanges();

}

class SignInSignUpResult {
  final User user;
  final bool success;
  final String message;

  SignInSignUpResult(
      {required this.user, required this.success, this.message = ''});
}
