import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vieddle/utils/messages/errors.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final onGenerateErrorMsg = GenerateMessageCode();

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  FirebaseUser _firebaseUser;
  String _verificationId;

  Future<Map<String, dynamic>> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      return await _firebaseAuth
          .signInWithCredential(credential)
          .then((result) => result.additionalUserInfo.profile);
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> signInWithCredentials(String email, String password) async {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> onVerifyCode(String phoneNumber) async {
    print('phone : $phoneNumber');

    try {
      return await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (credential) async {
          await _firebaseAuth
              .signInWithCredential(credential)
              .catchError((AuthException error) => throw error.message);
        },
        verificationFailed: (error) => throw error.message,
        codeSent: (verificationId, [token]) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) =>
            _verificationId = verificationId,
      );
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> signInWithPhoneNumber(String smsCode) async {
    final phoneCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: smsCode);

    try {
      return await _firebaseAuth.signInWithCredential(phoneCredential);
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> signUp({String email, String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> sendEmail() async {
    try {
      return (await this.getUser()).sendEmailVerification();
    } on PlatformException catch (e) {
      throw Exception(await onGenerateErrorMsg.errorCode(e.code));
    }
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  Future<bool> isSignIn() async {
    return await _firebaseAuth.currentUser() != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<void> editEmail(String newEmail) async {
    return (await _firebaseAuth.currentUser()).updateEmail(newEmail);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> editPassword(String password) async {
    return (await _firebaseAuth.currentUser()).updatePassword(password);
  }

  Future<void> updateNumberPhone(String phoneNumber, String smsCode) async {
    final currentUser = await _firebaseAuth.currentUser();

    return await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 30),
        verificationCompleted: (credential) {
          if (currentUser.phoneNumber == null) {
            currentUser.updatePhoneNumberCredential(credential);
          }
          return null;
        },
        verificationFailed: (e) {
          print(e.message);
        },
        codeSent: null,
        codeAutoRetrievalTimeout: (retrivalTimeOut) =>
            print(' $retrivalTimeOut'));
  }

  Future<void> updateUserProfile(String newName, String newPhoto) async {
    final currentUser = (await _firebaseAuth.currentUser());
    final userInfo = UserUpdateInfo();
    userInfo.displayName = newName;
    userInfo.photoUrl = newPhoto;

    return currentUser.updateProfile(userInfo);
  }

  Future<void> deleteUser() async {
    return (await _firebaseAuth.currentUser()).delete();
  }

  List<String> mapUserData() {
    return _firebaseUser.providerData.map((e) => e.email).toList();
  }
}
