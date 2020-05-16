import 'package:f_2020_bloc/architecture_example/bloc_pattern/auth_bloc.dart';
import 'package:f_2020_bloc/architecture_example/bloc_pattern/course_bloc.dart';
import 'package:f_2020_bloc/architecture_example/models/course.dart';
import 'package:f_2020_bloc/architecture_example/models/user.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class CourseListView extends StatelessWidget {
  final CourseBloc courseBloc = locator<CourseBloc>();
  final AuthBloc authBloc = locator<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course list"),
      ),
      body: _bodyA(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _bodyA() {
    return StreamBuilder(
      stream: authBloc.myModels,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        return getTodoCardWidgetA(snapshot);
      },
    );
  }

  Widget getTodoCardWidgetA(AsyncSnapshot<User> snapshot) {
    if (snapshot.hasData) {
      User user = snapshot.data;
      return _body(user);
    } else {
      return Text('loading');
    }
  }

  Widget _body(User user) {
    courseBloc.setUser(user);
    return StreamBuilder(
      stream: courseBloc.myModels,
      builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
        return getTodoCardWidget(snapshot);
      },
    );
  }

  Widget getTodoCardWidget(AsyncSnapshot<List<Course>> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data.length != 0) {
        return Text('${snapshot.data.length}');
      } else {
        return Text('no data');
      }
    } else {
      return Text('loading');
    }
  }

  _addTodo() async {
    courseBloc.addCourse();
  }

  dispose() {
    courseBloc.dispose();
  }
}
