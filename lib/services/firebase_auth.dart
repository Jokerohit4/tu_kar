import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FirebaseAuthentication {

  Future<void> signUpWithPhoneNumber(String phoneNumber,
      BuildContext context) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {

      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }


  void verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification completed
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        print(e.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to OTP screen

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval time out
      },
    );
  }

  void verifyOtp(String otp,String verificationId) async {

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    // Sign in with the credential
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigate to the next screen after successful verification
    } catch (e) {
      print('Failed to verify OTP: $e');
    }
  }

  // Sign in with Phone Number
  Future<void> signInWithPhoneNumber(String verificationId,
      String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }


  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint("Error signing in: $e");
      return null;
    }
  }

  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint("Error during sign up: $e");
      return null;
    }
  }

}


