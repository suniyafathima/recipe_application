import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_container.dart';
import 'package:recipe_application/global_widget/reusable_containerc.dart';
import 'package:recipe_application/view/search_results/search_results.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class SearchScreen extends StatefulWidget {
  
   const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 28),),
              SizedBox(height: 10,),
            TextField(
              controller: searchc,
              cursorWidth: 2,
              cursorColor: ColorConstants.darkblue,
              decoration: InputDecoration(
              hintText: "Recipe, ingredient or keyword",
              hintStyle: TextStyle(color: ColorConstants.grey),
              prefixIcon: Icon(Icons.search,size: 25, color: ColorConstants.darkblue),
              fillColor: ColorConstants.white,
              //filled: true,
              
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.lightGrey,width: 1),
              borderRadius: BorderRadius.circular(30),
              ),

              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.lightGrey,width: 1),
              borderRadius: BorderRadius.circular(30),
              ),
              
             ),            
        
            ),
            SizedBox(height: 16),
            Text("Meal",style: TextStyle(fontWeight: FontWeight.bold, 
              fontSize: 20),),
              SizedBox(height: 16),
             
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children:[
                
                InkWell(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (index)=>
                    SearchResults()));
                  },
                  child: ReusableContainerc( imagePathc: "assets/images/breakfast.png", ingNamec: "Breakfast")),
                ReusableContainerc( imagePathc: "assets/images/lunch.png",ingNamec: "Lunch"),
                ReusableContainerc( imagePathc: "assets/images/dinner.png",ingNamec: "Dinner"),
                ReusableContainerc( imagePathc: "assets/images/supper.png",ingNamec: "Supper"),
               
                ]
              ),
              SizedBox(height: 30),
              greyLine(),
              SizedBox(height: 30),
              Text("Ingredients",style: TextStyle(fontWeight: FontWeight.bold, 
              fontSize: 20),),
             SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }

  Container greyLine() {
    return Container(
             color: ColorConstants.lightGrey1,
              height: 1.0,
             );
  }
}