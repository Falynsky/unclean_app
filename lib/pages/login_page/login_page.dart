import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unclean_app/pages/login_page/login_form/login_form.dart';

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD9D9D9),
      child: loginFormWrapper(context),
    );
  }

  Widget loginFormWrapper(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  bottom: 16,
                ),
                child: Text(
                  'ZALOGUJ SIĘ',
                  style: GoogleFonts.comfortaa(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                        color: const Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 382,
                width: 322,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: const LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
