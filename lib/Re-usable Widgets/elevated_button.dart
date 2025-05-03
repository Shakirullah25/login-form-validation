import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Widget? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color sideColor;
  final Color textColor;
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.sideColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 25,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: sideColor,
            width: 1.0,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 7),
            ],
            //const SizedBox(width: 5),
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: GoogleFonts.raleway().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      // child: const Text(
      //   "Login",
      //   style: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
    );
  }
}
