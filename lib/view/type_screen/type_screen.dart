import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/global_widget/reusable_container.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/ingredient_screen/ingredient_screen.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({super.key});

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
           Icon(Icons.arrow_back_ios_new,color: ColorConstants.darkblue,),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("What type of recipes are\nyou intrested in?",
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("You can select up to 5 recipe types",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)),
              SizedBox(height: 16),
             Wrap(
                spacing: 2,
                runSpacing: 4,
                children:[
                ReusableContainer( ingName: "Healthy"),
                ReusableContainer( ingName: "5 ingrediants"),
                ReusableContainer( ingName: "Quick(under 30 mins)"),
                ReusableContainer( ingName: "Breakfast"),
                ReusableContainer( ingName: "Lunch"),
                ReusableContainer( ingName: "Dinner"),
                ReusableContainer( ingName: "Drink and cocktails"),
            ]),
        //SizedBox(height: 220),
        Spacer(),
        ReusableButton(buttonPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (index)=>IngredientScreen()));
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