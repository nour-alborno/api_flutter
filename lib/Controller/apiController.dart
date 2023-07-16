import 'dart:convert';
import 'dart:io';

import 'package:api_flutter/Controller/apiResponseMixin.dart';
import 'package:api_flutter/Controller/api_settings.dart';
import 'package:api_flutter/Pojo/ApiResponsw.dart';
import 'package:api_flutter/Pojo/UserModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiController with api_mixin{
// here we put the functions that is responsible for requests

 Future<dynamic> getAllPosts() async {

    Uri uri = Uri.parse(ApiSettings.get_all_posts);

    //this line sends the request and receives the response
  http.Response response =  await http.get(uri);

  //here we handle the status code

    if(response.statusCode == 200 || response.statusCode == 400){
      //it returns as a string because it comes as jason as string. therefore we decode it.
      return json.decode(response.body);
    }
  }

  getUserPosts( userId) async {
    var params ={

      'userId' : userId
    };
    Uri uri = Uri.https('jsonplaceholder.typicode.com','posts', params);

    http.Response response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader:'application/json'
    });

    if(response.statusCode == 200 || response.statusCode == 400){
      return json.decode(response.body);
    }
  }

 Future<ApiResponse> loginUser({email, password}) async {
   var map = {
'email':email,
 'password':password,
   };

   Uri uri = Uri.parse(ApiSettings.login);
 http.Response response = await  http.post(uri,body: map, headers: {
   HttpHeaders.contentTypeHeader:'application/json'}
 );

   if(response.statusCode == 200 || response.statusCode == 400){
     var jsonResponse=jsonDecode(response.body);
     ApiResponse resp = ApiResponse.fromJson(jsonResponse);

     if(response.statusCode == 200){

       if(resp != null){
         GetStorage().write("Token", resp.object!.token);
         GetStorage().write("Email", resp.object!.email);
         GetStorage().write("Name", resp.object!.fullName);
       }
     }
     return resp;
   }

  return ApiResponse(status: false,message: "Something worng");
  }


 Future<ApiResponse> registerUser({required User user}) async {

   Uri uri = Uri.parse(ApiSettings.register);
   http.Response response = await  http.post(uri,body: user.toJsonRegister(), headers: {
     HttpHeaders.contentTypeHeader:'application/json'}
   );

   if(response.statusCode == 201 || response.statusCode == 400){
     var jsonResponse=jsonDecode(response.body);
     ApiResponse resp = ApiResponse.fromJson(jsonResponse);

     return resp;
   }
   return ApiResponse(status: false,message: "Something worng");
 }

 Future<ApiResponse> resetPass({email,pass,repass,code}) async {

   var map ={
'password_confirmation':repass,
     'password':pass,
     'code':code,
     'email':email
   };
   Uri uri = Uri.parse(ApiSettings.resetPassword);
   http.Response response = await  http.post(uri,body: map, headers: {
     HttpHeaders.contentTypeHeader:'application/json'}
   );

   if(response.statusCode == 201 || response.statusCode == 400){
     var jsonResponse=jsonDecode(response.body);
     ApiResponse resp = ApiResponse.fromJson(jsonResponse);

     return resp;
   }
   return ApiResponse(status: false,message: "Something worng");
 }

 Future<ApiResponse> forgetPass({email}) async {

   var map ={

     'email':email
   };
   Uri uri = Uri.parse(ApiSettings.forgetPassword);
   http.Response response = await  http.post(uri,body: map, headers: {
     HttpHeaders.contentTypeHeader:'application/json'}
   );

   if(response.statusCode == 200 || response.statusCode == 400){
     var jsonResponse=jsonDecode(response.body);
     ApiResponse resp = ApiResponse.fromJson(jsonResponse);

     return resp;
   }
 return failedResponse;
 }



}