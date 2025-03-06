import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/global_widget/reusable_container.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/preference_screen/preference_screen.dart';

class IngredientScreen extends StatelessWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(height: 50,),
             Text("Which of these staple ingredients do you cook\nwith most often?",
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("You can select up to 5 ingredients.",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)),
              SizedBox(height: 16),
              Wrap(spacing: 2,
              runSpacing: 4,
                children:[
              ReusableContainer(imagePath: "assets/images/chicken.jpg", ingName: "Chicken"),
              ReusableContainer(imagePath: "assets/images/beef.jpg", ingName: "Beef"),
              ReusableContainer(imagePath: "assets/images/lamb.jpg", ingName: "Lamb"),
              ReusableContainer(imagePath: "assets/images/pork.jpg", ingName: "Pork"),
              ReusableContainer(imagePath: "assets/images/seafood.jpg", ingName: "Seafood"),
              ReusableContainer(imagePath: "assets/images/tofu.jpg", ingName: "Tofu"),
        ]),
      //SizedBox(height: 250),
        Spacer(),
        ReusableButton(buttonPressed: (){ 
          Navigator.push(context, MaterialPageRoute(builder: (index)=>PreferenceScreen()));
        }, 
        textname:"Next",
        backgroundColor: ColorConstants.lightGrey,
        textColor: ColorConstants.grey),
         SizedBox(height: 22),
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