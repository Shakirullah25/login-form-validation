import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_form_page/view%20model/view_model.dart';
import 'package:provider/provider.dart';

Consumer<ViewModel> buildTermsAndConditions() {
  return Consumer<ViewModel>(builder: (context, viewModel, child) {
    return Row(
      children: [
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
          
            return Transform.scale(
              scale: 0.8,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: viewModel.termsAccepted,
                onChanged: viewModel.toggleTermsAccepted,
                activeColor: const Color(0xFF60983C),
              ),
            );
          },
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "Please Accept Our ",
              style: const TextStyle(
                color: Color(0xFF475367),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: "Terms And Conditions ",
                  style: TextStyle(
                    color: const Color(0xFF475367),
                    fontSize: 12,
                    fontFamily: GoogleFonts.lora().fontFamily,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(
                  text: " Before Proceeding",
                  style: TextStyle(
                    color: Color(0xFF475367),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}
