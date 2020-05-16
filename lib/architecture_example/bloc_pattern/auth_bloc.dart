import 'dart:async';
import 'package:f_2020_bloc/architecture_example/models/user.dart';
import 'package:f_2020_bloc/architecture_example/services/api.dart';

import '../locator.dart';

class AuthBloc {
  final _authController = StreamController<User>.broadcast();
  get myModels => _authController.stream;

  Future<bool> login() {
    locator<Api>()
        .getUserProfile(email: "a@a.com", password: "123456")
        .then((value) => {_authController.sink.add(value)});
        return Future.value(true);
  }
}
