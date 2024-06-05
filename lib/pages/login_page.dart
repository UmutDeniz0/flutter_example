import 'package:flutter/material.dart';
import 'package:flutter_example/constants/app_constants.dart';
import 'package:flutter_example/services/auth/auth_service.dart';
import 'package:flutter_example/components/my_button.dart';
import 'package:flutter_example/components/my_textfied.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  // email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
            style: GoogleFonts.dancingScript().copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo

              Text(
                "Chat In Ceviz",
                style: GoogleFonts.dancingScript().copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 32,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Image(
                image: AssetImage(AppConstant.imageString),
                height: 150,
              ),

              const SizedBox(
                height: 50,
              ),

              // welcome back message
              Text(
                "Tekrardan hoşgeldin, seni özledik :)",
                style: GoogleFonts.dancingScript().copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
                focusNode: FocusNode(),
              ),

              const SizedBox(
                height: 10,
              ),

              // pw textfield
              MyTextField(
                hintText: "Şifre",
                obscureText: true,
                controller: _pwController,
                focusNode: FocusNode(),
              ),

              const SizedBox(
                height: 25,
              ),

              // login button
              MyButton(
                text: "Giriş Yap",
                onTap: () => login(context),
              ),

              const SizedBox(
                height: 25,
              ),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Henüz üye değil misin? ",
                    style: GoogleFonts.dancingScript().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Şimdi kayıt ol !",
                      style: GoogleFonts.dancingScript().copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
