import 'package:flutter/material.dart';
import 'package:recipe_application/view/search_results/tabs/collection_tab.dart';
import 'package:recipe_application/view/search_results/tabs/recipe_tab.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class SearchResults extends StatefulWidget {
  
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  
  TextEditingController searchc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
         appBar: AppBar(
          centerTitle: true,
          title: Text("Search results",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          leadingWidth: 100,
         leading:  GestureDetector(onTap: () {
           Navigator.pop(context);
         },
           child: Row(
            children: [
             SizedBox(width: 20,), 
             Icon(Icons.arrow_back_ios,
             color: ColorConstants.darkblue,),
             Text("Back",style: TextStyle(fontSize: 20,
             color: ColorConstants.darkblue),)  
           ]),
         ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               SizedBox(height: 10,),
                TextField(
                  controller: searchc,
                  cursorWidth: 2,
                  cursorColor: ColorConstants.darkblue,
      
                  decoration: InputDecoration(
                  hintText: "Recipe, ingredient or keyword",
                  hintStyle: TextStyle(color: ColorConstants.grey),
                  prefixIcon: Icon(Icons.search,size: 25, color: ColorConstants.grey),
                  fillColor: ColorConstants.lightGrey,
                  filled: true,
                  suffixIcon:Icon(Icons.cancel,color: ColorConstants.grey,),
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
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: ColorConstants.darkblue,
                  labelColor: ColorConstants.darkblue,
                  unselectedLabelColor: ColorConstants.black,
                  unselectedLabelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
                  labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  
                  tabs:[
                    Tab(text: "Recipes"),
                    Tab(text: "Collections",)
                    ] ),
                    SizedBox(height: 15,),
                  Expanded(
                      child: TabBarView(children: [
                       RecipeTab(),
                        CollectionTab()]),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
