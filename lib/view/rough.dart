import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/tastebud_screen/tastebud_screen.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
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
      body: Column(
        children: [
          
          // Gradient container at the top half of the screen
          Container(
            height: screenHeight * 0.55, // Takes up the top half of the screen
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
                    child: gradientContainer(),
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
                          child: searchQueries(texts, index),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Circular radius for the image
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/noodles.jpg", // Image path
                        fit: BoxFit.cover,
                        height: screenHeight * 0.25, // Image takes up quarter of the screen
                        width: double.infinity,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        height: screenHeight * 0.25, // Match the height of the image
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              ColorConstants.black.withAlpha(3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text("ggggggggggggggggggggggggggggggggggggggggggggg")
                  ],
                ),
              ),
            ),
          ),
          Text("ggggggggggggggggggggggggggggggggggggggggggggg"),
          Text("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddggggggggggggggggggggggggggggggggggggg")
       , Text("ggggggggggggggggggggggggggggggggggggggggggggg"),
        Text("ggggggggggggggggggggggggggggggggggggggggggggg"),
         Text("ggggggggggggggggggggggggggggggggggggggggggggg")
      
        ],
      ),
    );
  }

  // Gradient Container widget for suggestions
  Widget gradientContainer() {
    return Container(
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
        child: Text(
          "Try ''Suggestions for vegetarian meals''",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorConstants.grey,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // Search query widget
  Widget searchQueries(List<dynamic> texts, int index) {
    return Container(
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
    );
  }
}
