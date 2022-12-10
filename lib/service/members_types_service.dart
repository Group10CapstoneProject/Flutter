import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:dio/dio.dart';

class MembersTypesService{

  final Dio _dio = Dio();

  final  String _endpoint = '${UserToken.serverEndpoint}/members/types';

  ///http://docs.rnwxyz.codes/#/Member%20Types/get_members_types
  // Future<>
}