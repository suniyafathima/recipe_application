import 'package:flutter/material.dart';
import 'package:recipe_application/dummydb.dart';
import 'package:recipe_application/model/ingredient_mode;/ingredient_model.dart'; 
import 'package:recipe_application/utils/constants/color_constants.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isCheckeditem = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: [
          Icon(Icons.ios_share_outlined, color: ColorConstants.darkblue),
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorConstants.darkblue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(  // Ensure body is scrollable
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: ColorConstants.darkblue,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add, color: ColorConstants.darkGrey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Add an item",
                        hintStyle: TextStyle(color: ColorConstants.grey),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: ColorConstants.darkblue, fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  // ExpansionTile for "My Items" 
                  Divider(thickness: 1,color: ColorConstants.lightGrey1,),
                  ExpansionTile(
                
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),//remove default lines
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Text(
                            "My Items",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                         
                        ],
                      ),
                    ),
                    
                    children: [
                      ListTile(
                       
                        leading: Transform.scale( //checbox size
                          scale: 1.5,
                          child: Checkbox( 
                            activeColor: ColorConstants.darkblue,
                            shape: CircleBorder(),
                            side: BorderSide(color: ColorConstants.grey),
                            value: isCheckeditem, 
                            onChanged: (value) {
                              setState(() {
                                isCheckeditem = value!;
                              });
                            },
                          ),
                        ),
                        title: Text("Tomato", 
                          style: TextStyle(fontSize: 18),
                        ),
                  
                      ),
                  
                    ],
                  ),

                   Divider(thickness: 1,color: ColorConstants.lightGrey1,),
                  SizedBox(height: 5),
                  // ExpansionTile for "Chicken Zuccini"
                  ExpansionTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    title: Text(
                      "Chicken Zuccini",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      // ListView.builder to show dynamic ingredients
                      ListView.builder(
                        shrinkWrap: true,  // ListView takes only required space
                        physics: NeverScrollableScrollPhysics(),  // Prevent scrolling within the ListView
                        itemCount: Dummydb.ingredients.length, 
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Transform.scale(
                              scale: 1.5,
                              child: Checkbox( 
                                activeColor: ColorConstants.darkblue,
                                shape: CircleBorder(),
                                side: BorderSide(color: ColorConstants.grey),
                                value: Dummydb.ingredients[index].isChecked, 
                                onChanged: (value) {
                                  setState(() {
                                    Dummydb.ingredients[index].isChecked = value!;
                                   
                                    var ingredient=Dummydb.ingredients.removeAt(index);
                                    Dummydb.ingredients.add(ingredient);
                                  });
                                },
                              ),
                            ),
                            title: Text(
                              Dummydb.ingredients[index].name, 
                              style: TextStyle(fontSize: 18,
                              decoration:Dummydb.ingredients[index].isChecked?
                              TextDecoration.lineThrough:TextDecoration.none ),
                              
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                   Divider(thickness: 1,color: ColorConstants.lightGrey1,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
