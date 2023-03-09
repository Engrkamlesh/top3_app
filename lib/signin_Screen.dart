// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:top3_app/login_screen.dart';
import 'package:top3_app/util/custom_divider.dart';
import 'package:top3_app/util/textfiled.dart';

class Signin_Screen extends StatefulWidget {
  const Signin_Screen({Key? key}) : super(key: key);

  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'Top3 Prediction',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25),
                Text(
                  'Create a New Account',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'NickName',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'your nickname',
                    MultiValidator([RequiredValidator(errorText: 'Requied')]),
                    false,
                    TextInputType.emailAddress),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'User Name',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'your Username',
                    MultiValidator([RequiredValidator(errorText: 'Requied')]),
                    false,
                    TextInputType.name),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'yourmail@gmail.com',
                    MultiValidator([
                      EmailValidator(errorText: 'Invalid Email'),
                      RequiredValidator(errorText: 'Requied')
                    ]),
                    false,
                    TextInputType.emailAddress),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'Password(min 6 character)',
                    MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(6, errorText: 'Atleast 6 digits'),
                      MaxLengthValidator(15, errorText: 'Atleast 15 digits'),
                      PatternValidator(r'(?=.*?[!@#$%^&*?-])',
                          errorText: 'using Special Character')
                    ]),
                    true,
                    TextInputType.visiblePassword),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OrDivider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    custom_socail_login(Colors.redAccent, 'images/google.png'),
                    custom_socail_login(Colors.blue, 'images/facebook.png'),
                    custom_socail_login(Colors.black, 'images/apple.png')
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Screen()));
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell custom_socail_login(var color, String logo) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Image.asset(
          logo,
          width: 25,
          height: 25,
          color: Colors.white,
        )),
      ),
    );
  }
}
