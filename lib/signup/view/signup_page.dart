import 'package:ecommerce1/login/view/login_page.dart';
import 'package:flutter/material.dart';
import '../repository/signup_repo.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 70,),
              Text('Register',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue.shade300),),
              Text('Please enter details to register',style: TextStyle(color: Colors.grey),),
              Container(child:
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please enter your Name";
                      }
                    },
                    
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ))),
                    Container(child:
                  TextFormField(
                    validator: (value) {
                      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)){
                        return "Please enter your Email";
                      }
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                    ))),
                    Container(child:
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please enter your Phone number";
                      }
                    },
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ))),
                    Container(child:
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please enter your Password";
                      }
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ))),
                    Container(child:
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please confirm your Password";
                      }
                    },
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ))),
                    SizedBox(height: 20,),
                    SizedBox( height: 40,
                  width: double.infinity,
                child: ElevatedButton(onPressed: () async{
                  await SignupRepo().createUser(_nameController.text, _emailController.text, context,_phoneNumberController.text,_passwordController.text);
                }, child: Text('Register')),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue.shade600),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}