import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_task/core/constants/export.dart';
import 'firebase_options.dart';

void main() async {
  await _init();
  runApp(const SizeAdapter(
      designSize: Size(375.0, 812.0),
      designStatusBarHeight: 48.0,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: RegisterAllProvider.appAllProvider,
      child: MaterialApp.router(
        title: StringsResource.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dartThemeData,
        routerConfig: router,
      ),
    );
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
