import 'package:login_screen_task/core/constants/export.dart';

class LoginCubit extends Cubit<LoginState> {
  final _dataManager = DataManager.instance;

  LoginCubit() : super(LoginState());

  Future<User?> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    final user = await _dataManager.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    emit(state.copyWith(isLoading: false));
    return user;
  }

  Future<void> logout() async => await _dataManager.signOut();
}
