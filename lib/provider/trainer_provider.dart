import 'package:capstone_alterra_flutter/model/trainers_model.dart';
import 'package:flutter/material.dart';

class TrainerProvider extends ChangeNotifier {
  List<TrainerModel> listTrainer = dataTrainer;
  List<TrainerModel> get listTrainers => listTrainer;
}
