// packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:elfa_main_dashboard/features/splash_screen/domain/utilities/utils.dart';
import '../../../news_feed/news/news_screen.dart';
import '../presentation/provider/circleIndicatorProvider.dart';

class authenticationMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> SignIn({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    Provider.of<CircleIndicatorProvider>(ctx, listen: false)
        .switchCircleIndicator();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils().showMsg('Signed In Successfully');
      Navigator.pushReplacementNamed(ctx, NewsScreen.routeName);
      Provider.of<CircleIndicatorProvider>(ctx, listen: false)
          .switchCircleIndicator();
    }).onError((error, stackTrace) {
      Utils().showMsg(error.toString());
      Provider.of<CircleIndicatorProvider>(ctx, listen: false)
          .switchCircleIndicator();
    });
  }

  Future<void> signUP({
    required String email,
    required String password,
    required BuildContext ctx,
    required String phone,
  }) async {
    _auth
        .createUserWithEmailAndPassword(
            email: email.toString(), password: password.toString())
        .then((value) {
      Utils().showMsg('Account Created');
      Navigator.pop(ctx);
    });
  }

  Future<void> signInWithGoogle(BuildContext ctx) async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential).then((value) {
      Utils().showMsg('Signed In Successfully');
      Navigator.pushReplacementNamed(ctx, NewsScreen.routeName);
      Provider.of<CircleIndicatorProvider>(ctx, listen: false)
          .switchCircleIndicator();
    }).onError((error, stackTrace) {
      Utils().showMsg(error.toString());
      Provider.of<CircleIndicatorProvider>(ctx, listen: false)
          .switchCircleIndicator();
    });;
  }
}
