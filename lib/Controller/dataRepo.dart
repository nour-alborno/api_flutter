import 'dart:math';

import 'package:api_flutter/Controller/apiController.dart';
import 'package:api_flutter/Pojo/PostModel.dart';

class DataRepo{

  ApiController _apiController = ApiController();

  //here we handle the response we get from the request
 Future<List<Post>> getAllPosts(){
   return _apiController.getAllPosts().then((value) {
     List<Post> p =[];
     if(value!=null){
       value.forEach((e){
         p.add(Post.fromJson(e));
       });
     }
     return p;
    });

  }
}