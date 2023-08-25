import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback? onPressed;

  const LoginButton({super.key, this.onPressed});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xff4B4B4B),
          width: 0.4,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            color: const Color(0xff000000).withOpacity(0.25),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
        onPressed: widget.onPressed,
        child: Text(
          'ZALOGUJ',
          style: GoogleFonts.comfortaa(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }
}
