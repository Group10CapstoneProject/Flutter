import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/members_types_model.dart';
import 'package:capstone_alterra_flutter/service/members_types_service.dart';
import 'package:flutter/material.dart';

class AllMembershipProvider with ChangeNotifier{

  bool isLoading = false;
  List<MembersTypesModel> listMembers = [];

  Future<void> getAllMemberType() async{
    isLoading = true;
    notifyListeners();
    MembersTypesService membersTypesService = MembersTypesService();
    JSONModel<List<MembersTypesModel>?> json = await membersTypesService.getAllMemberType();

    if(json.statusCode == 200){
      listMembers.addAll(json.data!);
    }
    isLoading = false;
    notifyListeners();
  }

  void removeAllMemberType(){
    listMembers.clear();
    notifyListeners();
  }
}