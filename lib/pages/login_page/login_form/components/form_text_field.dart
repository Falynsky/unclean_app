import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const FormTextField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            label,
            style: GoogleFonts.comfortaa(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.comfortaa(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
