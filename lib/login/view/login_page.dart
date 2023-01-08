import 'dart:ui';
import 'package:ecommerce1/homepage/view/home_Page.dart';
import 'package:ecommerce1/signup/view/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
 LoginPage({super.key});
 TextEditingController _emailController = TextEditingController();
 TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade300),
                  )
                ],
              ),
            ),
            Text(
              'Please login to your account',
              style: TextStyle(color: Colors.grey),
            ),
            // SizedBox(height: 10,),
            Column(
              children: [
                Container(child:
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                ),
              ],
            ),
            // SizedBox(height: 10,),
            Container(child:
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: TextButton(onPressed: () {
                  
                }, child: Text('Forgot Password?'),)
              ),
            ),
            ),
             SizedBox(height: 10,),
          
            // SizedBox(height: 5,),
            SizedBox( height: 40,
                width: double.infinity,
              child: ElevatedButton(onPressed: () async{
                try {
                  final _auth = FirebaseAuth.instance;
                  final userRef =await _auth.signInWithEmailAndPassword(
                    email: _emailController.text, password: _passwordController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Invalid Email or Password')));
                }
                
              }, child: Text('Login')),
            ),
            SizedBox(height: 10),
            Text('_______________________OR________________________',style: TextStyle(color: Colors.grey),),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: () {
                  
                },child: Icon(Icons.facebook,color: Colors.blue,),mini: true, backgroundColor: Colors.white,),
                SizedBox(width: 20,),
                FloatingActionButton(onPressed: () {
                  
                },child: Icon(Icons.message,color: Colors.blue,),mini: true,backgroundColor: Colors.white,)
              ],
            ),
            // SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do not have an account?'),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                }, child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue.shade600),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
