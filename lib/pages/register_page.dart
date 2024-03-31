import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

void register()async{
  // get auth service
   final authservice= AuthService();
   // check if password match =>create user
   if(passwordController.text==confirmPasswordController.text){
    // try creating user
    try{
      authservice.signUpWithEmailAndPassword(emailController.text, passwordController.text);
    }
    // display any errors
    catch (e){
      showDialog(context: context,
       builder: (context)=>AlertDialog(
        title: Text(e.toString()),
       ));
    }

   }

   // if password dont match => show error
   else{
    showDialog(context: context,
       builder: (context)=>const AlertDialog(
        title: Text('Password dont match '),
       ));
   }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            //message app slogan
            Text(
              'Lets Crreate An account For You ',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),
            //emailtextfield
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            //password textfield
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true),
                 const SizedBox(
              height: 10,
            ),
            //confirm Password
            MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true),
            const SizedBox(
              height: 25,
            ),
            //sign up button
            MyButton(onTap: register, text: 'Sign up'),
            const SizedBox(
              height: 25,
            ),
            //Already have an account ? Login here 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account ?',style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),),
               const  SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap:widget.onTap ,
                  child: Text('Login Now',style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

