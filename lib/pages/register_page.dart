import 'package:flutter/material.dart';
import 'package:flutter_example/constants/app_constants.dart';
import 'package:flutter_example/services/auth/auth_service.dart';
import 'package:flutter_example/components/my_button.dart';
import 'package:flutter_example/components/my_textfied.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  // email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final auth = AuthService();

    // passwords match -> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
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
    // passwords don't match -> tell user to fix

    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Şifreler eşleşmiyor!",
            style: GoogleFonts.dancingScript().copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              // logo
              const Image(
                image: AssetImage(AppConstant.imageString),
                height: 150,
              ),

              const SizedBox(
                height: 50,
              ),

              // welcome back message
              Text(
                "Hadi senin için bir hesap oluşturalım",
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
                height: 10,
              ),

              // confirm pw textfield
              MyTextField(
                hintText: "Şifreyi Onayla",
                obscureText: true,
                controller: _confirmPwController,
                focusNode: FocusNode(),
              ),

              const SizedBox(
                height: 25,
              ),

              // login button
              MyButton(
                text: "Kayıt Ol",
                onTap: () => register(context),
              ),

              const SizedBox(
                height: 25,
              ),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Zaten bir hesabın var? ",
                    style: GoogleFonts.dancingScript().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Şimdi giriş yap",
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
