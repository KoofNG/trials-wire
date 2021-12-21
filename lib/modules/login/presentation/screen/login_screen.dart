import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/app_endpoints.dart';
import 'package:wirepay/modules/login/data/login_data.dart';
import 'package:wirepay/modules/login/data_sources/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  String password = '';

  final _formKey = GlobalKey<FormState>();

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
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
                    obscureText: true,
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
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
                  ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();

                      LoginDataDto loginDataDto = LoginDataDto(
                        email: email,
                        password: password,
                      );

                      Uri _uri = Uri.https(
                        AppEndpoint.baseUrl,
                        AppEndpoint.apiVersion + AppEndpoint.loginEndpoint,
                      );

                      var response = await NetworkService.postMethod(
                        data: loginDataDto.toJson(),
                        uri: _uri,
                      );

                      if (response.statusCode < 202) {
                        var _data = jsonDecode(response.body);
                        final snackBar = SnackBar(
                          backgroundColor: Colors.green[400],
                          content: Text(
                            _data['message'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(response.body);
                      } else {
                        var _data = jsonDecode(response.body);
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red[400],
                          content: Text(
                            _data['message'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(response.body);
                        print('error');
                      }
                    },
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
      ),
    );
  }
}
