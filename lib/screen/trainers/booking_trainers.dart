import 'package:capstone_alterra_flutter/screen/trainers/details_transaction.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BookingTrainers extends StatefulWidget {
  const BookingTrainers({super.key});

  @override
  State<BookingTrainers> createState() => _BookingTrainersState();
}

TextEditingController inputDate = TextEditingController();
TextEditingController inputRegion = TextEditingController(text: '+62');
TextEditingController inputNumber = TextEditingController();
TextEditingController inputNote = TextEditingController();
DateTime selectedDate = DateTime.now();

class _BookingTrainersState extends State<BookingTrainers> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Pemesanan',
          style: kHeading6.copyWith(color: blackLight),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masukan Detail Pemesanan',
                      style: kSubtitle1,
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.event_outlined,
                          color: primaryBase,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Tanggal Sesi',
                          style: kBody2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 14),
                      child: TextFormField(
                        readOnly: true,
                        controller: inputDate,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Pilih Tanggal',
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (DateTime dateTime) {
                                    setState(() {
                                      inputDate.text = DateFormat('d MMMM y')
                                          .format(dateTime)
                                          .toString();
                                    });
                                  },
                                );
                              });
                          // final selectDate = await showDatePicker(
                          //     context: context,
                          //     initialDate: selectedDate,
                          //     firstDate: DateTime(2020),
                          //     lastDate: DateTime(selectedDate.year + 5));

                          // if (selectDate != null) {
                          //   setState(
                          //     () {
                          //       selectedDate = selectDate;

                          //       inputDate.text =
                          //           DateFormat('dd-MM-yyyy').format(selectDate);
                          //     },
                          //   );
                          // }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 24,
                          color: primaryBase,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Jam Sesi',
                          style: kBody2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Wrap(
                        spacing: 20,
                        children: [
                          _chip(isChoosen: true, title: '09:00', onTap: () {}),
                          _chip(isChoosen: false, title: '11:00', onTap: () {}),
                          _chip(isChoosen: false, title: '14:00', onTap: () {}),
                          _chip(isChoosen: false, title: '16:00', onTap: () {}),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/trainer/telpon.svg'),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Nomor Telepon',
                          style: kBody2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 14),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 78,
                            child: TextFormField(
                              readOnly: true,
                              controller: inputRegion,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: inputNumber,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                hintText: '8xxxxxxx',
                              ),
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return 'Please enter mobile number';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/trainer/note.svg',
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Masukan Catatan',
                          style: kBody2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextFormField(
                        controller: inputNote,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          hintText: 'Tulis disini',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: whiteColor,
        height: 102,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailTranscation(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBase,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('LANJUTKAN KE PEMBAYARAN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _chip(
    {required bool isChoosen,
    required String title,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Chip(
      label: Text(
        title,
        style:
            kSubtitle1.copyWith(color: (isChoosen) ? Colors.white : blackLight),
      ),
      backgroundColor: (isChoosen) ? primaryBase : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryBase),
      ),
    ),
  );
}
