import 'package:flutter/material.dart';
import 'package:test2/common/widget/custom_textfield.dart';
import '../../../common/widget/custom_button.dart';
import '../../../common/widget/custom_radio.dart';
import '../service/auth_services.dart';
//import '../../../common/widget/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Auth1 _groupValue = Auth1.signin;

  ValueChanged _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 239, 213),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomRadio(
              value: Auth1.signup,
              groupValue: _groupValue,
              onChanged: _valueChangedHandler(),
              text: 'Create Account ',
              color1: _groupValue == Auth1.signup
                  ? const Color.fromARGB(31, 142, 129, 129)
                  : Colors.white10,
            ),
            
            if (_groupValue == Auth1.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 218, 221, 226),
                
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          hintText: 'name', controller: _nameController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'email', controller: _emailController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'password',
                          controller: _passwordController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                             signUpUser();
                            //print('object');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (_groupValue == Auth1.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 218, 221, 226),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          hintText: 'email', controller: _emailController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'password',
                          controller: _passwordController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                             //signUpUser();
                            //print('object');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            CustomRadio(
              value: Auth1.signin,
              groupValue: _groupValue,
              onChanged: _valueChangedHandler(),
              text: 'SignIn',
              color1: _groupValue == Auth1.signin
                  ? const Color.fromARGB(31, 142, 129, 129)
                  : Colors.white10,
            ),
          ]),
        ),
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             // ignore: prefer_const_constructors
//             children: const [
//               Text(
//                 'welcome',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//               ),

//               // ListTile(

//               //   title: const Text(
//               //     'Create Account ',
//               //     style: TextStyle(fontWeight: FontWeight.bold),
//               //   ),
//               //   leading: Radio(
//               //     activeColor: GlobalVariables.secondaryColor,
//               //     value: Auth.signup,
//               //     groupValue: _auth,
//               //     onChanged: (Auth? val) {
//               //       setState(() {
//               //         _auth = val!;
//               //       });
//               //     },
//               //   ),
//               // ),
//               //  ListTile(

//               //   title: const Text(
//               //     'Sign up',
//               //     style: TextStyle(fontWeight: FontWeight.bold),
//               //   ),
//               //   leading: Radio(
//               //     activeColor: GlobalVariables.secondaryColor,
//               //     value: Auth.signin,
//               //     groupValue: _auth,
//               //     onChanged: (Auth? val) {
//               //       setState(() {
//               //         _auth = val!;
//               //       });
//               //     },
//               //   ),
//               // ),

//               MyWidget<String>(
//                 value: '1',
//                 groupValue: _groupValue,
//                 onChanged: _valueChangedHandler(),
//                 label: '1',
//                 text: 'Phone Gap',
//               ),
//               MyWidget<String>(
//                 value: '2',
//                 groupValue: _groupValue,
//                 onChanged: _valueChangedHandler(),
//                 label: '2',
//                 text: 'Appcelerator',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
