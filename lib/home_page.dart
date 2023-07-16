import 'package:api_flutter/Controller/dataRepo.dart';
import 'package:api_flutter/Pojo/PostModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Post>>(
        future: DataRepo().getAllPosts(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.data!.isNotEmpty && snapshot.data! != null){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
               return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                 Text(snapshot.data![index].title!, style: TextStyle(fontSize: 15, color: Colors.blue),),
                 SizedBox(height: 5,),
                 Text(snapshot.data![index].body!, style: TextStyle(fontSize: 12, color: Colors.black),),
                 SizedBox(height: 20,),
               ],);
            },);
          } else {
           return Center(child: Text("No Data"),);
          }

        },
      ),
    );
  }
}
