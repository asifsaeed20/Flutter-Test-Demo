import 'package:covid_tracker/screen_2.dart';
import 'package:covid_tracker/utils/routes_names.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
 dynamic data;
   HomeScreen({super.key,required this.data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Routes')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          InkWell(
            onTap: (){
        Navigator.pushNamed(context, Routename.screentwo,
        arguments: {
          'Node' : 'JS Module',
        });

            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text('Screen 1'),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
