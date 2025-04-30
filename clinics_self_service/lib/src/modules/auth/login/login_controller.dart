import 'package:asyncstate/asyncstate.dart';
import 'package:signals_flutter/signals_core.dart';
import 'package:clinics_core/clinics_core.dart';
import 'package:clinics_self_service/src/services/user_login_service.dart';

class LoginController with MessageStateMixin {
  LoginController({required UserLoginService userLoginService})
    : _userLoginService = userLoginService;

  final UserLoginService _userLoginService;

  final _logged = Signal(false);
  final _obscurePassword = Signal(true);

  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult =
        await _userLoginService.execute(email, password).asyncLoader();

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;
    }
  }
}
