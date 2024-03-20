import 'package:flutter/cupertino.dart';
import 'package:tu_kar/services/firebase_auth.dart';
import 'package:tu_kar/services/storage/firebase_storage.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';

class SignInUpViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuthentication();
  final _firebaseStore = FirebaseStorage();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  void signInEmail() => _firebaseAuth.signInWithEmailPassword(
      _emailController.text, _passwordController.text);

  void signUpEmail() {
    _firebaseAuth
        .signUpWithEmailPassword(
            _emailController.text, _passwordController.text)
        .then((user) {
      if (user != null) {
        final Map userDetails = {StringConstants.email: user.email};
        _firebaseStore.addUser(userDetails);
      } else {
        debugPrint("Sign up failed or user is null");
      }
    }).catchError((error) {
      debugPrint("An error occurred: $error");
    });
  }
}
