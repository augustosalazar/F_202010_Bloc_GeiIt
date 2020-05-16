import 'dart:async';
import 'package:f_2020_bloc/architecture_example/bloc_pattern/auth_bloc.dart';
import 'package:f_2020_bloc/architecture_example/models/course.dart';
import 'package:f_2020_bloc/architecture_example/models/user.dart';
import 'package:f_2020_bloc/architecture_example/services/api.dart';

import '../locator.dart';

class CourseBloc {
  final _courseController = StreamController<List<Course>>.broadcast();
  get myModels => _courseController.stream;
  final AuthBloc authBloc = locator<AuthBloc>();
  User _user;

  void setUser(User user) {
    _user = user;
    getCourseList();
  }

  Future<User> _login() async {
    return locator<Api>().getUserProfile(email: "a@a.com", password: "123456");
  }

  getCourseList() async {
    if (_user != null) {
      locator<Api>()
          .getCourses(_user.username, _user.token)
          .then((value) => _courseController.sink.add(value));
    }
  }

  addCourse() async {
   locator<Api>()
        .addCourseService(_user.username, _user.token)
        .then((value) => getCourseList());
  }

  dispose() {
    _courseController.close();
  }
}
