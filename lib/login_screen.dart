// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:top3_app/signin_Screen.dart';
import 'package:top3_app/util/textfiled.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
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
                  'Login to your Account',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                custom_socail_login(Colors.redAccent, "Login with Google",'images/google.png'),
                SizedBox(height: 15),
                custom_socail_login(Colors.blue, "Login with Facebook",'images/facebook.png'),
                SizedBox(height: 15),
                custom_socail_login(Colors.black, "Login with Apple",'images/apple.png'),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 30),
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
                     Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 16,color: Colors.grey),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45)),
                    child: 
                        Center(
                          child: Text(
                            'Login with Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'or',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {          
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signin_Screen()));
                      },
                      child: Text(
                        ' Sign in',
                        style: TextStyle(
                          fontSize: 15,
                            color: Colors.black, fontWeight: FontWeight.bold),
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

  InkWell custom_socail_login(var color, String title,String logo) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(logo,width: 25,height: 25,color: Colors.white,),
            SizedBox(width:20),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
