import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {
  final _dio=Dio();
  Future<dynamic>apiGetcall() async{
    try{
      final response =await _dio.get('https://dummyjson.com/users');
      return response;

    }
    catch(e){
      FlutterError.onError;

    }
  }
  Future<dynamic>apiPostcall({required String username , required String password}) async{
    try{
      final response = await _dio.post('https://dummyjson.com/user/login',
      data: {
        'username' : username,
          'password': password
          },
        options: Options(
          headers:{
            'Content-Type': 'application/json'
          }

        ),

      );
      return response;
    }
    catch(e){
      FlutterError.onError;

    }
  }
  Future<dynamic> getUserById({required int id}) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/users/$id',
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response> addUser({
    required String firstName,
    required String lastName,
    required int age,
  }) async {
    return await _dio.post(
      'https://dummyjson.com/users/add',
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
      },
      options: Options(
        headers: { 'Content-Type': 'application/json' },
      ),
    );
  }
}