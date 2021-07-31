import 'package:bike_mart/DialogBox/errorDialog.dart';
import 'package:bike_mart/HomeScreen.dart';
import 'package:bike_mart/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneConfirmController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name;
  String email;
  String password;
  String number;
  String image;
  String confirmPassword;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'images/register.png',
                  height: 270.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        hintText: '    Enter your name',
                      ),
                      controller: _nameController,
                      onChanged: (value) {
                        this.name = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Colors.blue,
                        ),
                        hintText: '    Enter your number',
                      ),
                      controller: _phoneConfirmController,
                      onChanged: (value) {
                        this.number = value;
                      },
                    ),
                  ),

                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: '    Enter your email',
                      ),
                      controller: _emailController,
                      onChanged: (value) {
                        this.email = value;
                      },
                    ),
                  ),
                  // CustomTextField(
                  //   data: Icons.email,
                  //   controller: _emailController,
                  //   hintText: 'Email',
                  //   isObsecure: false,
                  //   value: _emailController.text,
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      // ignore: missing_return
                      validator: (value) {},
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blue,
                        ),
                        hintText: '    Upload your image',
                      ),
                    ),
                  ),
                  // CustomTextField(
                  //   data: Icons.camera_alt_outlined,
                  //   controller: _imageController,
                  //   hintText: 'Image url',
                  //   isObsecure: false,
                  //   value: _imageController.text,
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      obscureText: true,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        hintText: '    Enter your password',
                      ),
                      controller: _passwordController,
                      onChanged: (value) {
                        this.password = value;
                      },
                    ),
                  ),
                  // CustomTextField(
                  //     data: Icons.lock,
                  //     controller: _passwordController,
                  //     hintText: 'Password',
                  //     isObsecure: true,
                  //     value: _passwordController.text),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 365,
                    child: TextFormField(
                      obscureText: true,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        hintText: '   Confirm your password',
                      ),
                      controller: _passwordConfirmController,
                      onChanged: (value) {
                        this.confirmPassword = value;
                      },
                    ),
                  ),
                  // CustomTextField(
                  //     data: Icons.lock,
                  //     controller: _passwordConfirmController,
                  //     hintText: 'Confirm password',
                  //     isObsecure: true,
                  //     value: _passwordConfirmController.text),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  _register();
                  setState(() {
                    if (formKey.currentState.validate()) {}
                  });
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void saveUserData() {
    Map<String, dynamic> userData = {
      'userNames': _nameController.text.trim(),
      'uId': userId,
      'userNumber': _phoneConfirmController.text.trim(),
      'imgPro': _imageController.text.trim(),
      'time': DateTime.now(),
    };
    FirebaseFirestore.instance.collection('userss').doc(userId).set(userData);
  }

  void _register() async {
    if (name.isNotEmpty && email.isNotEmpty ||
        number.isNotEmpty ||
        image.isNotEmpty ||
        password.isNotEmpty ||
        confirmPassword.isNotEmpty) {
      User currentUser;

      await _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((auth) {
        currentUser = auth.user;
        userId = currentUser.uid;
        userEmail = currentUser.email;
        userNames = _nameController.text.trim();

        saveUserData();
      }).catchError((error) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (con) {
              return ErrorAlertDialog(
                message: error.message.toString(),
              );
            });
      });

      if (currentUser != null) {
        Route newRoute = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, newRoute);
      }
    }
  }
}
