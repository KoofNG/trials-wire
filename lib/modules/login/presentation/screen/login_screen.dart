import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/service_locator/services_locator.dart';
import 'package:wirepay/core/widgets/base_widget.dart';
import 'package:wirepay/modules/login/presentation/view_model/login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: BaseWidget<LoginScreenViewModel>(
        model: LoginScreenViewModel(
          loginRepository: di(),
          storageService: di(),
        ),
        builder: (context, model, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: model.emailController,
                        validator: (email) {
                          if (email.isEmpty) return 'Email is required';
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: model.passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) return 'Password is required';
                          if (value.length < 8)
                            return 'Password length must be up to 8 characters';
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      model.busy
                          ? CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.blue[200],
                            )
                          : SizedBox.shrink(),
                      ElevatedButton(
                        onPressed: !model.busy
                            ? () async => await model.loginWithPassword()
                            : () {},
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
