import 'package:login_screen_task/core/constants/export.dart';

void main() => runApp(const SizeAdapter(
    designSize: Size(375.0, 812.0),
    designStatusBarHeight: 48.0,
    child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: RegisterAllProvider.appAllProvider,
        // child:
        MaterialApp.router(
      title: StringsResource.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dartThemeData,
      routerConfig: router,
      // ),
    );
  }
}
