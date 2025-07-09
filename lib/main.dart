import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/core/utils/di.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/data/prefs.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/check_logged_user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Bloc.observer = SimpleBlocObserver();
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkIfLoggedInUser();
  setupGetIt();
  runApp(const MyApp());
}
