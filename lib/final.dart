import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;

import 'models/json_modeldemo.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  profile ? arena;
  @override
  void initState(){
    loadArena();
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }
  Future<String>_loadArenaAsset()async{
    return await rootBundle.loadString('assets/arena.json');
  }
  Future loadArena()async{
    String jsonString= await _loadArenaAsset();
    final jsonResponse= json.decode(jsonString);
    profile Arena = profile.fromJson(jsonResponse);
    setState(() {
      arena=Arena;
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 600,
              flexibleSpace: FlexibleSpaceBar(background: Image.network("${arena?.profilePic}",fit: BoxFit.fill),
                collapseMode: CollapseMode.none,
                //                   ,),
            )),
            SliverToBoxAdapter(
              child:Column(
                children: [

                Row(
                                    children: [

                                      Text("${arena?.firstName} ${arena?.lastName}",style: Theme.of(context).textTheme.headline6,),
                                    ],
                                  ),
                                  Row(children:[
                                  Text("${arena?.region} ,${arena?.country}"),
                                    SizedBox(width: 200,),
                                    FloatingActionButton(
                                      onPressed:(){},child: Icon(Icons.add),backgroundColor: Colors.orange,),

                                  ]),
                                  SizedBox(height: 20,width: 10,),
                                  Text("${arena?.bio}"),
                  SizedBox(height: 200,)
                                ],

                              ),

              ),

    ]),
      ),
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor:Colors.white70,
          items: [
            BottomNavigationBarItem(
              label: "${arena?.post}",
              icon: Text("Posts"),
            ),
            BottomNavigationBarItem(
              label: "${arena?.followers} ",
              icon: Text("Followers"),
            ),
            BottomNavigationBarItem(
              label: "${arena?.following} ",
              icon: Text("Following"),
            ),


          ],
        )
    );
  }
}
