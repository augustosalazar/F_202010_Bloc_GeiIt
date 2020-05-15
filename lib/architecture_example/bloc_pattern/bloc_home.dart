import 'package:f_2020_bloc/architecture_example/models/course.dart';
import 'package:flutter/material.dart';

import 'my_model_bloc.dart';

class BlocHome extends StatelessWidget {
  final MyModelBloc todoBloc = MyModelBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: getTodosWidget(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget getTodosWidget() {
    return StreamBuilder(
      stream: todoBloc.myModels,
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
    todoBloc.addCourse();
  }

  dispose() {
    todoBloc.dispose();
  }
}
