import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdb_signing2/pages/signUp_page.dart';
import 'package:localdb_signing2/services/db_service.dart';

import '../models/user_model.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static final String id = 'signIn_page';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> _doLogin() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    var user = User(email: email,password: password);
    HiveDB().storeUser(user);

    var user1 = HiveDB().loadUser();

    print("Username: ${user1.email}");
    print("Password: ${user1.password}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.teal.shade500
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              // Title
              Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage('assets/images/user'
                                  '.jpg'),
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Welcome",style: TextStyle(color: Colors.teal.shade200,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    ],
                  )
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 60,),
                            // Email, Password
                            Text('Email',style: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.bold),),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'email',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Text('Password',style: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.bold),),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Enter password',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Center(child: Text('Forget password?',style: TextStyle(color: Colors.grey.shade300,fontSize: 18),)),
                            SizedBox(height: 40,),
                            // SignUp Button
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal: 70),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal.shade500,
                              ),
                              child: TextButton(
                                child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20),),
                                onPressed: _doLogin,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Center(
                                child: Text('---------------------------  OR  ---------------------------',
                              style: TextStyle(color: Colors.grey.shade300,fontSize: 18),)),
                            SizedBox(height: 30,),
                            // Facebook, Telegram, Instagram
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.facebook,color: Colors.blue,),
                                    onPressed: (){},
                                  ),
                                  SizedBox(width: 20,),
                                  IconButton(
                                    icon: Icon(CupertinoIcons.paperplane_fill,color: Colors.blueAccent,),
                                    onPressed: (){},
                                  ),
                                  SizedBox(width: 20,),
                                  IconButton(
                                    icon: Icon(CupertinoIcons.camera_fill,color: Colors.black,),
                                    onPressed: (){},
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?",style: TextStyle(color: Colors.grey.shade300),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, SignUpPage.id);
                                  },
                                  child: Text('SignUp'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                  )
              ),
            ],
          )
      ),
    );
  }
}
