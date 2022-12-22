import 'package:capstone_alterra_flutter/screen/transaction/code_unik.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';

class PaymentOfflineSucces extends StatelessWidget {
  const PaymentOfflineSucces({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 132, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/offline_page/succes.png',
                height: 250,
                width: 272,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                'Pembayaran Berhasil!',
                style: kHeading6,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Yay kelas kamu berhasil di booking',
                style: kBody2,
              ),
              const SizedBox(
                height: 80.0,
              ),
              SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBase,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KodeUnik(id: id)),
                    );
                  },
                  child: Text(
                    'DETAIL',
                    style: kButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
