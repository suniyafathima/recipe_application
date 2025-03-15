import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/global_widget/reusable_container.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/bottom_navbar/bottom_navbar.dart';


class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

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
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Does your household have\nany dietary preferences?",
                  style: TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("You can select up to 3 preferences",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)),
              SizedBox(height: 16),
            
              Wrap(
                spacing: 2,
                runSpacing: 4,
                children:[
                ReusableContainer( ingName: "No"),
                ReusableContainer( ingName: "Pescatarian"),
                ReusableContainer( ingName: "Vegetarian"),
                ReusableContainer( ingName: "Diary free"),
                ReusableContainer( ingName: "Gluten free"),
                ReusableContainer( ingName: "Low carb"),
                ReusableContainer( ingName: "Low cal"),
                ReusableContainer( ingName: "Low fat"),
                ]
              ),
             // SizedBox(height: 250),
              Spacer(),
              ReusableButton(
                buttonPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (index)=>BottomNavbar()));
                  showDialog(context: context, 
                  builder: (context)=>AlertDialog(
                    title: Text("Welcome to taste",
                    style:TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                    content: Text("Please enjoy 10 free recipes to get you started.",
                    style: TextStyle(fontWeight: FontWeight.normal,
                    fontSize: 20,color: ColorConstants.darkGrey),
                    textAlign: TextAlign.center
                    ),
                    actions: [
                      ReusableButton(buttonPressed: (){//h..b
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (index)=>BottomNavbar()));
                      }, 
                      textname: "Let's go!",
                      backgroundColor: ColorConstants.darkblue,
                      )
                    ],
                    ));
                
              }, 
              textname:"Done",
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