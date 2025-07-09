import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';

void checkIfLoggedInUser() {
  if (FirebaseAuth.instance.currentUser != null) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
