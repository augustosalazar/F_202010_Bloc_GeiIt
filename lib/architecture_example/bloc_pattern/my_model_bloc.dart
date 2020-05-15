import 'dart:async';

import 'package:f_2020_bloc/architecture_example/models/course.dart';
import 'package:f_2020_bloc/architecture_example/models/user.dart';
import 'package:f_2020_bloc/architecture_example/services/api.dart';
import 'package:f_2020_bloc/architecture_example/services/authentication_service.dart';

import '../locator.dart';
import 'my_model.dart';

class MyModelBloc {
  final _courseController = StreamController<List<Course>>.broadcast();
  get myModels => _courseController.stream;
  User user;
  MyModelBloc() {
    _login().then((value) =>  getCourseList());
  }

  Future<User>_login() async{
    return locator<Api>().getUserProfile(email: "a@a.com", password: "123456");
  }

  getCourseList() async {
    _login().then((value) =>  locator<Api>().getCourses(value.username,value.token).then((value) =>  _courseController.sink.add(value)));
  }

  addCourse() async {
    _login().then((value) =>  locator<Api>().addCourseService(value.username,value.token).then((value) => getCourseList()));
    //await locator<Api>().addCourseService(user.username,user.token);
  }

  dispose() {
    _courseController.close();
  }
}

