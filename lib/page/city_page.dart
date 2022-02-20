import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {


  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late String city;
  final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         actions: [
           IconButton(onPressed: (){
             Navigator.pop(context,controller.text);

           },
               icon: Icon(Icons.done_outline_sharp))
         ],
       ),
      body: Center(child:
        Padding(
          padding: EdgeInsets.all(30),
          child:

          Column(
            children: [
              TextField(
                autofocus: true,
                controller: controller,
                // onChanged: (value){
                //   city=value;
                // },
              ),
              // TextButton(onPressed: (){
              //   // Navigator.pop(context, city);
              // }, child: Text('Ok'))
            ],
          ),
        ),),

    );
  }
}
