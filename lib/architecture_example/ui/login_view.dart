import 'package:f_2020_bloc/architecture_example/bloc_pattern/auth_bloc.dart';
import 'package:f_2020_bloc/architecture_example/models/user.dart';
import 'package:f_2020_bloc/architecture_example/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class LoginView extends StatelessWidget {
  final AuthBloc authBloc = locator<AuthBloc>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course list"),
      ),
      body: _bodyBuilder(context),
    );
  }

 Widget _bodyBuilder(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.myModels,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        return _body(context,snapshot);
      },
    );
  }

  Widget _body(BuildContext context, AsyncSnapshot<User> snapshot){
    return snapshot.hasData ?  _done(context) :
    Center(
      child: Container(
        child:FlatButton(
                        child: Text("Login"),
                        onPressed: () async {
                          authBloc.login().then((value) => Provider.of<AuthProvider>(context, listen: false).setLoggedIn());
                        })
      ),
    );
  }

  Widget _done(BuildContext context) {
    return Center(child: Text("Logged"));
  }

}