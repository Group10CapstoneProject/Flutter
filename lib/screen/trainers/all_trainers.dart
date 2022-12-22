import 'package:capstone_alterra_flutter/model/trainers_model.dart';
import 'package:capstone_alterra_flutter/screen/trainers/details_trainers.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTrainers extends StatelessWidget {
  const AllTrainers({super.key, required this.trainerModel});

  final TrainerModel trainerModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailTrainerScreen(detailTrainer: trainerModel),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 129,
                child: Image.asset(
                  trainerModel.picture,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        trainerModel.name,
                        style: kSubtitle1.copyWith(color: blackColor),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryBase,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            trainerModel.rating.toString(),
                            style: kSubtitle2.copyWith(color: blackLight),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Builder(
                        builder: (context) {
                          String skill = '';
                          for (String i in trainerModel.skill) {
                            skill += '$i, ';
                          }
                          return Text(
                            skill,
                            overflow: TextOverflow.ellipsis,
                            style: kCaption.copyWith(color: blackLightest),
                          );
                        }
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        Utils.currencyFormat(trainerModel.price),
                        style: GoogleFonts.roboto(
                            color: primaryBase,
                            fontWeight: bold,
                            fontSize: 14,
                            letterSpacing: 0.25),
                      )
                    ],
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
