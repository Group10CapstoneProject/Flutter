import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void dialogButton(BuildContext context, void Function() onPressed) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      contentPadding: const EdgeInsets.all(20),
      backgroundColor: whiteColor,
      content: Image.asset(
        'assets/offline_page/show_dialog.png',
        width: 200,
        height: 200,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Batalkan Pesanan',
                style: kSubtitle1.copyWith(color: blackColor),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                'Kamu yakin ingin membatalkan pesanan ini ?',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: regular,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteBase,
                  side: BorderSide(color: primaryBase),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: kButton.copyWith(color: primaryBase),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBase,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  "Yes",
                  style: kButton.copyWith(color: whiteBase),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
