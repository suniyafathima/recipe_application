import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/utils/constants/image_constants.dart';

import 'package:recipe_application/view/type_screen/type_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: ColorConstants.lightyellow,
      appBar: AppBar(
        backgroundColor:ColorConstants.lightyellow,
      centerTitle: true,
       title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("taste",style: TextStyle(
            color: ColorConstants.darkblue1,
            fontSize: 35,
            fontWeight: FontWeight.bold
            ),
                 ),
                 CircleAvatar(radius: 10,backgroundColor:ColorConstants.mintgreen,
                 child: Text(".COM",style: TextStyle(
                  fontSize: 7,
                 fontWeight: FontWeight.bold,
                 color: ColorConstants.white,
                 ),),)
         ],
       ),iconTheme: IconThemeData(),
      actions: [
        TextButton(onPressed: (){},
          style: TextButton.styleFrom(
            foregroundColor: ColorConstants.lightyellow), 
          child: Text("skip",
        style: TextStyle(
          fontSize: 20,
          color: ColorConstants.darkblue),),)
      ],
      bottom: PreferredSize(preferredSize: Size.fromHeight(-10), 
      child: Container(
        color: ColorConstants.lightGrey1,
        height: 2.0,
      )),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          
          children: [
            Container(
              width: 300,
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(ImageConstants.wecmeImg))),
            ),
           
            Text("Recipes Picked just for you", 
                style: TextStyle(color:ColorConstants.black ,
                fontSize: 30,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
            SizedBox(height: 30),
            Text("Tell us a bit about your cooking so we can suggest recipes we think you'll enjoy.", 
                 style: TextStyle(color: ColorConstants.black,
                 fontSize: 20,
                 ),
                 textAlign: TextAlign.center,
                 ),
            SizedBox(height: 40),
            
            ReusableButton(
            backgroundColor: ColorConstants.darkblue,
            textname:"Let's get started!",
            buttonPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (index)=>TypeScreen()));
            },),
            
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: List.generate(4,(index)=> Container(
                       height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      color: Colors.grey
                      ),
                    ))
                  
                )
              
        
          ],
        ),
      ),
    );
  }
}

