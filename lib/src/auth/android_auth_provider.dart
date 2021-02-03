import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: 'チャットアプリ',
      options: FirebaseOptions(
          apiKey: "AIzaSyAdpOpIbFHxh8spOCMQm_-Dk48wFgbb4bA",
          authDomain: "new-chat-app-23a04.firebaseapp.com",
          projectId: "new-chat-app-23a04",
          storageBucket: "new-chat-app-23a04.appspot.com",
          messagingSenderId: "202344204799",
          appId: "1:202344204799:android:dbdc7143641ce377783fca",
          measurementId: "G-D5GDM6J3V2"),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider{

}
