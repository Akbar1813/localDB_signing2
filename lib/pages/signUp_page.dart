import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdb_signing2/pages/signIn_page.dart';
import 'package:localdb_signing2/services/db_service.dart';

import '../models/account_model.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id = 'signUp_page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  Future<void> _doLogin() async{
    String email = emailController.text.trim();
    String number = numberController.text.trim();
    String address = addressController.text.trim();
    var account = Account(email: email,number: number,address: address);
    HiveDB().storeAccount(account);

    var account1 = HiveDB().loadAccount();

    print("Username: ${account1.email}");
    print("Password: ${account1.number}");
    print("Password: ${account1.address}");
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
                      SizedBox(height: 60,),
                      SizedBox(height: 10,),
                      Text("Welcome",style: TextStyle(color: Colors.teal.shade200,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
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
                            Text('Number',style: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.bold),),
                            TextField(
                              controller: numberController,
                              decoration: InputDecoration(
                                hintText: 'Enter phone number',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Text('Address',style: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.bold),),
                            TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: 'Enter your address',
                                hintStyle: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
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
                                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?",style: TextStyle(color: Colors.grey.shade300),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, SignInPage.id);
                                  },
                                  child: Text('SignIn'),
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
