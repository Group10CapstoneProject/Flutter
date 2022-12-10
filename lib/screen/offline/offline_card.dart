import 'package:capstone_alterra_flutter/screen/offline/offline_book.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';

class OfflineCard extends StatelessWidget {
  const OfflineCard({
    super.key,
    required this.picture,
    required this.title,
    required this.teacher,
    required this.hour,
    required this.duration,
    required this.availabeleSlot,
    required this.price,
  });

  final String picture;
  final String title;
  final String teacher;
  final String hour;
  final String duration;
  final String availabeleSlot;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          height: 163,
          child: Stack(
            children: [
              Image.asset(
                picture,
                height: 163,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                height: 163,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A4B5F).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hour,
                          style: kHeading6.copyWith(color: whiteColor),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          duration,
                          style: kSubtitle1.copyWith(color: whiteColor),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: kHeading6.copyWith(color: whiteColor),
                      ),
                      Text(
                        'With $teacher',
                        style: kSubtitle1.copyWith(color: whiteDark),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.group_add_sharp,
                            color: primaryLight,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            availabeleSlot,
                            style: kSubtitle2.copyWith(color: whiteColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Utils.currencyFormat(price),
                              style: kSubtitle1.copyWith(color: whiteColor)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        height: 32,
                        width: 70,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OfflineBook(
                                  title: title,
                                  teacher: teacher,
                                  price: price,
                                  minute: hour,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryBase,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'BOOK',
                            style: kButton.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
