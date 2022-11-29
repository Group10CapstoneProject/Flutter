import 'package:flutter/material.dart';

class OfflineCard extends StatelessWidget {
  const OfflineCard({
    super.key,
    required this.picture,
    required this.title,
    required this.teacher,
    required this.date,
    required this.duration,
    required this.availabeleSlot,
    required this.payment,
  });

  final String picture;
  final String title;
  final String teacher;
  final String date;
  final String duration;
  final String availabeleSlot;
  final int payment;

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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 0.15),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.15,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0.15,
                        ),
                      ),
                      Text(
                        teacher,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.group_add_sharp,
                            color: Color(0xff7DC8C4),
                            size: 24,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            availabeleSlot,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0.1,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'RP $payment',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16, left: 50),
                        height: 32,
                        width: 75,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF52A1A4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'BOOK',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.25,
                            ),
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
