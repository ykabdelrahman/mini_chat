import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/core/utils/di.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MyApp());
}
