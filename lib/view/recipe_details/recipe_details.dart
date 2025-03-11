import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         leadingWidth: 100,
       leading:  GestureDetector(onTap: () {
         Navigator.pop(context);
       },
         child: Row(
          children: [
           SizedBox(width: 20,), 
           Icon(Icons.arrow_back_ios,color: ColorConstants.darkblue,),
           Text("Back",style: TextStyle(fontSize: 20,color: ColorConstants.darkblue),)  
         ]),
       ),
       bottom: PreferredSize(preferredSize: Size.fromHeight(-10), 
       child:Container(
        color: ColorConstants.lightGrey1,
        height: 2.0,
      )), 
      )
    );
  }
}