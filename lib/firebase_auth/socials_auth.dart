import 'package:e_commer/services/total_value_service.dart';
import 'package:e_commer/services/users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> singInGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  await createUser(email: googleUser!.email.toString());
  setTotalValue(email: googleUser.email.toString(), value: 0);
  await FirebaseAuth.instance.signInWithCredential(credential);
}
