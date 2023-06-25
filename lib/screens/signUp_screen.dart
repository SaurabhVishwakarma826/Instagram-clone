import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void loginUser() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(child: Container(), flex: 2),
              // Svg image
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(
                height: 64,
              ),
              // Avatar
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1687639079529-410d2f17ee50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                  Positioned(
                    bottom: -10,
                      left: 80,
                      child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              // Text field userName
              TextInputField(
                  textEditingController: _usernameController,
                  hintText: "Enter your username here",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24,
              ),
              // Text field input for email
              TextInputField(
                  textEditingController: _emailController,
                  hintText: "Enter your Email here",
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 24,
              ),
              TextInputField(
                  textEditingController: _passwordController,
                  hintText: "Enter your password here",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24,
              ),
              TextInputField(
                  textEditingController: _bioController,
                  hintText: "Enter your bio here",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text("Log in"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                      color: blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Flexible(child: Container(), flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't  Have an account?"),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              )
              // Text field input for password
              // login button
              // Transion to sign in
            ],
          ),
        ),
      ),
    );
  }
}
