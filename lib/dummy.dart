import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.sizeOf(context);
   double screenHeight = size.height;
   //double screenWidth = size.width;
    return Scaffold(
     body: Column(
        children: [
          
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text("What's cooking?", 
       style: TextStyle(
           color: ColorConstants.black,
           fontSize: 28,
           fontWeight: FontWeight.bold,
         ),),
     ),
     Expanded(
       child: GridView.builder(
         shrinkWrap: true, 
         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
         itemBuilder:(context,index)=>
         Container(
            height: screenHeight * 0.4,
           color: Colors.red,)
          ),
     )  
      ])
      );
  }
}