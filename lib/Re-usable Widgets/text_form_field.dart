import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.inputFormatters,
    //this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    const outLineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xFFD0D5DD),
        width: 1.0,
      ),
    );

    const errorStyle = TextStyle(
      color: Color(0xFFFF59A2),
      fontSize: 13,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF475467),
              fontSize: 14,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.only(
              top: 10,
              right: 14,
              bottom: 10,
              left: 14,
            ),
            suffixIcon: suffixIcon,
            enabledBorder: outLineInputBorder,
            focusedBorder: outLineInputBorder,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFFF59A2),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: outLineInputBorder,
            errorStyle: errorStyle,
          ),
        ),
      ],
    );
  }
}
