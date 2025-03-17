import 'package:flutter/material.dart';
import 'package:recipe_application/model/home_screen_models/recipeitem_model.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/bottom_navbar/bottom_navbar.dart';
import 'package:recipe_application/view/registration_screen/registration_screen.dart';
import 'package:recipe_application/view/search_screen/search_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List items = [
    Recipeitemmodel(imagePath: "assets/images/chickenzuccini.jpg", name: "Chicken zuccini", rating: 4.5, time: "25m"),
    Recipeitemmodel(imagePath: "assets/images/easybourboncake.jpg", name: "Easy bourbon cake", rating: 4, time: "20m"),
    Recipeitemmodel(imagePath: "assets/images/noodles.jpg", name: "Chilly Egg noodles", rating: 3.5, time: "30m"),
    Recipeitemmodel(imagePath: "assets/images/Potatofry.jpg", name: "Crispy Potato fry", rating: 5, time: "25m"),
    Recipeitemmodel(imagePath: "assets/images/Sourcreamfried.jpg", name: "Sourcream fried chicken", rating: 5, time: "32m"),
    Recipeitemmodel(imagePath: "assets/images/vegopesto.jpg", name: "Sego pesto pasta", rating: 1, time: "15m"),
    Recipeitemmodel(imagePath: "assets/images/butterchicken.jpg", name: "Butter chicken", rating: 4.9, time: "20m", isLiked: false)
  ];
  bool showalert=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
          centerTitle: true,
          title: Text("My favourites",
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
          actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));
            },
            child: Text(
              "Edit",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorConstants.darkblue),
            ),
          ),]
        ),
        body: items.isEmpty? 
       Expanded(
         child: Column(
           children: [
             // Conditional Alert
             if (showalert)
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Container(
                   height: 230,
                   width: double.infinity,
                  padding: EdgeInsets.all(10),
                   color: ColorConstants.lightGrey,
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Icon(Icons.warning_rounded, 
                           color: ColorConstants.darkGrey),
                           SizedBox(width: 10),
                           Expanded(
                             child: Text("Want to sync your saved recipes?",
                             style: TextStyle(color: ColorConstants.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 20),),
                           ),
                           IconButton(
                             onPressed: () {
                               setState(() {
                                 showalert = false;
                               });
                             },
                             icon: Icon(Icons.cancel, color: ColorConstants.darkGrey),
                           ),
                          
                           
                         ],
                       ),
                       Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 280,
                            child: Text("Create a free state account to save and sync your favourie recipes across all devices.",
                            maxLines:3 ,style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.visible,),
                          ),
                          SizedBox(height: 16),
                           TextButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                           }, child: Text("Sign up for a free account",
                              style: TextStyle(color: ColorConstants.darkblue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),))
                        ],
                       )
                     ],
                   ),
                  
                 ),
               ),
             
          
            
             SizedBox(height: 80),
             
           
             Image.asset(
               "assets/images/favourite.png",
               width: 200,
               height: 100,
             ),
             Text(
               "No favourites yet",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Text("Save your first recipe by tapping a Like button"),
             
             SizedBox(height: 20), 
             
         
             Container(
               height: 50,
               width: 180,
               decoration: BoxDecoration(
                 color: ColorConstants.darkblue,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: TextButton(
                 onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));///
                 },
                 child: Text(
                   "Search Recipes",
                   style: TextStyle(color: Colors.white,
                   fontSize: 20 ),
                 ),
               ),
             ),
           ],
         ),
       )

        :Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               SizedBox(height: 10,),
                TextField(
                 // controller: searchc,
                  cursorWidth: 2,
                  cursorColor: ColorConstants.darkblue,
      
                  decoration: InputDecoration(
                  hintText: "Search this collection",
                  hintStyle: TextStyle(color: ColorConstants.grey),
                  prefixIcon: Icon(Icons.search,size: 25, color: ColorConstants.darkblue),
                  fillColor: Colors.transparent,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.lightGrey1,width: 1),
                  borderRadius: BorderRadius.circular(30),
                  ),
          
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.lightGrey1,width: 1),
                  borderRadius: BorderRadius.circular(30),
                  ),
                
                 ), ),
                 
                 Expanded(
                 child: Column(
                  children: [
                    SizedBox(height: 10,),
                   Align(
                    alignment: Alignment.topLeft,
                     child: Text(
                        "6 recipes",
                          style: TextStyle(
                          color: ColorConstants.grey,
                          fontSize: 20,
                        ),
                     ),
                    ),
                   SizedBox(height: 15),
                  
                   Expanded(
                   child: ListView.separated(
             
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical:2,horizontal:2),
                  leading: Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(items[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(Icons.star,
                            // starIndex < items[index].rating.floor()
                            //     ? Icons.star
                            //     : (starIndex < items[index].rating)
                            //         ? Icons.star_half
                            //         : Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          );
                        }),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            size: 16,
                            color: ColorConstants.darkGrey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            items[index].time,
                            style: TextStyle(color: ColorConstants.darkGrey),
                          ),
                          greyLine()
                        ],
                      ),
                     
                    ],
                  ),
                 
                );
              }, separatorBuilder: (
                BuildContext context, int index) { 
                  return Divider(
                color: ColorConstants.lightGrey1,
                thickness: 1.0,
              ); },
            ),
          ),
          
        ],
      ),
            )])));
  }

  Container greyLine() {
    return Container(
      color: ColorConstants.lightGrey1,
      height: 1.0,
    );
  }
}

  