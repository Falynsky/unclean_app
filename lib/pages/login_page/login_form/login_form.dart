import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/http/services/auth/auth_service.dart';
import 'package:unclean_app/pages/login_page/login_form/components/form_text_field.dart';
import 'package:unclean_app/pages/login_page/login_form/components/login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late NavigationCubit navigationCubit;
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late AuthService configService;
  @override
  void initState() {
    super.initState();
    configService = GetIt.I<ChopperClient>().getService<AuthService>();
    navigationCubit = context.read<NavigationCubit>();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return loginFormWrapper(context);
  }

  Widget loginFormWrapper(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 35, 28, 0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            FormTextField(
              label: 'LOGIN',
              controller: loginController,
            ),
            const SizedBox(height: 20),
            FormTextField(
              label: 'HASŁO',
              controller: passwordController,
            ),
            const SizedBox(height: 17),
            // touch the text to go to the next page
            lostPasswordButton(),
            const SizedBox(height: 17),
            LoginButton(onPressed: () async {
              final Map<String, String> body = <String, String>{
                'username': loginController.text,
                'password': passwordController.text,
              };
              final Response<Map<String, dynamic>> response = await configService.login(body);
              final int statusCode = response.statusCode;
              if (statusCode == 200) {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('auth_token', response.body?['data']['token']);
                navigationCubit.navigate(NavigationScreens.home);
              }
            }),
            const SizedBox(height: 24),
            border(),
            const SizedBox(height: 24),
            socialMediaIcons()
          ],
        ),
      ),
    );
  }

  GestureDetector lostPasswordButton() {
    return GestureDetector(
      onTap: () {
        print('lipa');
      },
      child: Text(
        'NIE PAMIĘTAM HASŁA',
        style: GoogleFonts.comfortaa(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget border() {
    return Container(
      width: 226,
      height: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xffB3B3B3),
      ),
    );
  }

  Widget socialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
          ),
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blue,
            ),
          ),
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
