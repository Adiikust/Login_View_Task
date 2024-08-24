
import 'package:login_screen_task/core/constants/export.dart';

class RegisterAllProvider {
  static get appAllProvider => [
        BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
      ];
}
