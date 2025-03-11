import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_application/model/home_screen_models/recipeitem_model.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/tastebud_screen/tastebud_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bool isLiked=false;
   List items=[
      Recipeitemmodel(imagePath: "assets/images/chickenzuccini.jpg", name: "Chicken zuccini",rating: 4.5, time: "25m",),
      Recipeitemmodel(imagePath: "assets/images/easybourboncake.jpg", name: "Easy bourbon \ncake",rating: 4, time: "20m",),
      Recipeitemmodel(imagePath: "assets/images/noodles.jpg", name: "Chilly Egg noodles",rating: 3.5, time: "30m",),
      Recipeitemmodel(imagePath: "assets/images/Potatofry.jpg", name: "Crispy Potato fry",rating: 5, time: "25m",),
      Recipeitemmodel(imagePath: "assets/images/Sourcreamfried.jpg", name: "Sourcream fried chicken",rating: 5, time: "32m",),
      Recipeitemmodel(imagePath: "assets/images/vegopesto.jpg", name: "Sego pesto pasta",rating: 1, time: "15m",),
      Recipeitemmodel(imagePath: "assets/images/butterchicken.jpg", name: "Butter chicken", rating: 4.9, time: "20m",isLiked: false)   
    ];
  List gitems=[
    Recipeitemmodel(imagePath: "assets/images/Budgetchrismas.jpg", name: "Budget chrismas", ),
     Recipeitemmodel(imagePath: "assets/images/Chrismashamrecipes.jpg", name: "Chrismas ham recipes", ),
     Recipeitemmodel(imagePath:"assets/images/Christmassides.jpg", name: "Christmas sides"),
     Recipeitemmodel(imagePath: "assets/images/Easycakes.jpg", name: "Easy cakes"),
     Recipeitemmodel(imagePath: "assets/images/Partypunchideas.jpg", name: "Party punch ideas"),
     Recipeitemmodel(imagePath: "assets/images/Summersalads.jpg", name: "Summer salads")
  ];
  @override
  Widget build(BuildContext context) {
    List texts = [
      "Recipes for \nchocolate brownies",
      "Suggest a recipe\nfor vegetarian",
      "I need a quick \ndinner recipe",
      "How to make \nhomemade granola",
      "Gluten free \nbaking ideas",
      "Top rated \nbaking recipes",
    ];
   
    
    var size = MediaQuery.sizeOf(context);
    double screenHeight = size.height;
    double screenWidth = size.width;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "taste",
              style: TextStyle(
                color: ColorConstants.darkblue1,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: ColorConstants.mintgreen,
              child: Text(
                ".COM",
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.white,
                ),
              ),
            ),
          ],
        ),
        actions: [Icon(Icons.account_circle)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          // Gradient container at the top half of the screen
            gradientContainerhalfscreen(screenHeight, screenWidth, context, texts),
            setRecipes(screenHeight),
           // SizedBox(height: 5,),
            horizontalListarecipes(items),
            greyLine(),
            pickedForYou(),
            greyLine(),
            whatsCooking(),
            greyLine(),
            popularRecipes(),
            greyLine(),
            setRecipesTwo(screenHeight),
             //SizedBox(height: 5,),
             horizantalListTwo()

          //

          
           ],),
      ),
    );
  }

  SingleChildScrollView horizantalListTwo() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                 spacing: 20,
                 children:List.generate(
                  items.length, (index)=>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 14,
                    children: [
                      Stack(
                        children: [
                        Container(
                          height: 100,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:AssetImage(items[index].imagePath),
                              fit:BoxFit.cover 
                              )
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                             setState(() {
                                items[index].isLiked = !items[index].isLiked;
                              });
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorConstants.white,
                              child: Icon(items[index].isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                              color: items[index].isLiked ? Colors.red : Colors.grey,
                              size:16,
                              ),
                              ),
                          ),
                        )
                    ]),
                    SizedBox(
                      height: 40,
                      width: 140,
                      child: Text(
                        items[index].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                             maxLines: 2,
                             overflow: TextOverflow.visible,
                             softWrap: true,
                        ),
                    ),
                     Row(
                        children: 
                          List.generate(5, (index){
                            return Icon(
                           index < items[index].rating.floor()?
                           Icons.star
                           :(index<items[index].rating) 
                           ?Icons.star_half
                           :Icons.star_border,
                            color:Colors.amber,size: 16,
                            );
                          })
                        ,
                      ),
                     Row(
                        children: [
                         Icon(Icons.access_time_filled,size:16,color: ColorConstants.darkGrey,),
                         SizedBox(width: 4),
                         Text(
                          items[index].time,
                         style: TextStyle(color: ColorConstants.darkGrey),)
                       
                        ])
                    ],
                  )),   
              ),
            ),
          );
  }

  Padding setRecipesTwo(double screenHeight) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), 
          child: Column(
            children: [
              Stack(
                children: [
                 Container(
                    height: screenHeight * 0.25, 
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), 
                        image: DecorationImage(
                         image: AssetImage("assets/images/noodles.jpg"), 
                            fit: BoxFit.cover,
           
                          ),
                        ),
                    ),
                    //black gradient overlay
           Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 80, 
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withAlpha(250),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      // Text Over Image
            Positioned(
              bottom: 20, 
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Text(
                      "17 Ramadan and Iftar food and recipe ideas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                   Text(
                    "17 Recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ],
    ),
  ),
);
  }

  SingleChildScrollView popularRecipes() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Popular recipes", 
                  style: TextStyle(
                      color: ColorConstants.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Row(
                   spacing: 20,
                   children:List.generate(
                    items.length, (index)=>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 14,
                      children: [
                        Stack(
                          children: [
                          Container(
                            height: 180,
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:AssetImage(items[index].imagePath),
                                fit:BoxFit.cover 
                                )
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                               setState(() {
                                  items[index].isLiked = !items[index].isLiked;
                                });
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: ColorConstants.white,
                                child: Icon(items[index].isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                                color: items[index].isLiked ? Colors.red : Colors.grey,
                                size:16,
                                ),
                                ),
                            ),
                          )
                      ]),
                      SizedBox(
                        height:40,
                        width: 230, //container width
                        child: Text(
                          items[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                               maxLines: 2,
                               overflow: TextOverflow.visible,
                               
                          ),
                      ),
                       Row(
                          children: 
                            List.generate(5, (index){
                              return Icon(
                             index < items[index].rating.floor()?
                             Icons.star
                             :(index<items[index].rating) 
                             ?Icons.star_half
                             :Icons.star_border,
                              color:Colors.amber,size: 16,
                              );
                            })
                          ,
                        ),
                       Row(
                          children: [
                           Icon(Icons.access_time_filled,size:16,color: ColorConstants.darkGrey,),
                           SizedBox(width: 4),
                           Text(
                            items[index].time,
                           style: TextStyle(color: ColorConstants.darkGrey),)
                         
                          ])
                      ],
                    )),   
                ),
              ],
            ),
          ),
        );
  }

  SingleChildScrollView whatsCooking() {
    return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
      
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
                 // SizedBox(height:5),
                  GridView.builder(
                    shrinkWrap: true, 
                    itemCount: gitems.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30
                      ), 
                   
                    itemBuilder:(context,index)=>
                    Column(
                      children: [
                        Container(
                           height:120,
                           //width: 200,
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(gitems[index].imagePath),
                              fit: BoxFit.cover
                              )),
                          
                          ),
                        SizedBox(
                        height:40,
                       // width: 200, //container width
                        child: Text(
                          items[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                               maxLines: 2,
                               overflow: TextOverflow.visible,
                               
                          ),
                      ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          );
  }

  SingleChildScrollView pickedForYou() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Picked for you", 
                    style: TextStyle(
                        color: ColorConstants.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Row(
                     spacing: 20,
                     children:List.generate(
                      items.length, (index)=>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 14,
                        children: [
                          Stack(
                            children: [
                            Container(
                              height: 180,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:AssetImage(items[index].imagePath),
                                  fit:BoxFit.cover 
                                  )
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                 setState(() {
                                    items[index].isLiked = !items[index].isLiked;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: ColorConstants.white,
                                  child: Icon(items[index].isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                                  color: items[index].isLiked ? Colors.red : Colors.grey,
                                  size:16,
                                  ),
                                  ),
                              ),
                            )
                        ]),
                        SizedBox(
                          height:40,
                          width: 230, //container width
                          child: Text(
                            items[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              ),
                                 maxLines: 2,
                                 overflow: TextOverflow.visible,
                                 
                            ),
                        ),
                         Row(
                            children: 
                              List.generate(5, (index){
                                return Icon(
                               index < items[index].rating.floor()?
                               Icons.star
                               :(index<items[index].rating) 
                               ?Icons.star_half
                               :Icons.star_border,
                                color:Colors.amber,size: 16,
                                );
                              })
                            ,
                          ),
                         Row(
                            children: [
                             Icon(Icons.access_time_filled,size:16,color: ColorConstants.darkGrey,),
                             SizedBox(width: 4),
                             Text(
                              items[index].time,
                             style: TextStyle(color: ColorConstants.darkGrey),)
                           
                            ])
                        ],
                      )),   
                  ),
                ],
              ),
            ),
          );
  }

  PreferredSize greyLine() {
    return PreferredSize(preferredSize: Size.fromHeight(-10), 
     child:Container(
      color: ColorConstants.lightGrey1,
      height: 2.0,
    ));
  }

  SingleChildScrollView horizontalListarecipes(List<dynamic> items) {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                   spacing: 20,
                   children:List.generate(
                    items.length, (index)=>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 14,
                      children: [
                        Stack(
                          children: [
                          Container(
                            height: 100,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:AssetImage(items[index].imagePath),
                                fit:BoxFit.cover 
                                )
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                               setState(() {
                                  items[index].isLiked = !items[index].isLiked;
                                });
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: ColorConstants.white,
                                child: Icon(items[index].isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                                color: items[index].isLiked ? Colors.red : Colors.grey,
                                size:16,
                                ),
                                ),
                            ),
                          )
                      ]),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: Text(
                          items[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                               maxLines: 2,
                               overflow: TextOverflow.visible,
                               softWrap: true,
                          ),
                      ),
                       Row(
                          children: 
                            List.generate(5, (index){
                              return Icon(
                             index < items[index].rating.floor()?
                             Icons.star
                             :(index<items[index].rating) 
                             ?Icons.star_half
                             :Icons.star_border,
                              color:Colors.amber,size: 16,
                              );
                            })
                          ,
                        ),
                       Row(
                          children: [
                           Icon(Icons.access_time_filled,size:16,color: ColorConstants.darkGrey,),
                           SizedBox(width: 4),
                           Text(
                            items[index].time,
                           style: TextStyle(color: ColorConstants.darkGrey),)
                         
                          ])
                      ],
                    )),   
                ),
              ),
            );
  }

  Padding setRecipes(double screenHeight) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), 
            child: Column(
              children: [
                Stack(
                  children: [
                   Container(
                      height: screenHeight * 0.25, 
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), 
                          image: DecorationImage(
                           image: AssetImage("assets/images/noodles.jpg"), 
                              fit: BoxFit.cover,
             
                            ),
                          ),
                      ),
                      //black gradient overlay
             Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 80, 
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withAlpha(250),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        // Text Over Image
              Positioned(
                bottom: 20, 
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Noodles Recipes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      "10 Recipes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ],
      ),
    ),
  );
  }

  Container gradientContainerhalfscreen(double screenHeight, double screenWidth, BuildContext context, List<dynamic> texts) {
    return Container(
          height: screenHeight * 0.55, 
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffdeebf7),
                Color(0xffffffff),
                Color(0xfffed99b),
              ],
            ),
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 100),
                Lottie.asset(
                  "assets/images/carrotj.json",
                  height: 90,
                  width: 90,
                ),
                SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.darkblue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      "BETA",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Hi! I'm TasteBud, your \nnew recipe finder",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TastebudScreen()),
                    );
                  },
                  
          //gradient container textfield        
           child: Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                 gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.amber, Colors.pink],
                 ),
                 borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
               ),
               child: Text("Try ''Suggestions for vegetarian meals''",
                 style: GoogleFonts.nunitoSans(
                 textStyle: TextStyle(
                 fontWeight: FontWeight.w400,
                 color: ColorConstants.grey,
                fontSize: 18,
                  ),
                ),
               ),
             ),
            ),
          ),
           SizedBox(height: 15),
                // Horizontal Scroll for Search Queries
           SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      texts.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TastebudScreen()),
                          );
                        },
                        //search queries sugestion
                        child: Container(
                         height: 50,
                         width: 250,
                         padding: EdgeInsets.only(left: 10),
                         margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                             mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.auto_awesome),
                                SizedBox(width: 15),
                                Text(
                                  texts[index],
                                  style: GoogleFonts.nunitoSans(
                                   textStyle: TextStyle(fontSize: 18),
                                  ),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                ),
                              ],
                           ),
                         ),
                       ),
                     ),
                   ),
                ),],
            ),
          ),
        );
  }

}