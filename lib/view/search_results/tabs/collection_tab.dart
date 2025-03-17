import 'package:flutter/material.dart';
import 'package:recipe_application/model/home_screen_models/recipeitem_model.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class CollectionTab extends StatefulWidget {
  const CollectionTab({super.key});

  @override
  State<CollectionTab> createState() => _CollectionTabState();
}

class _CollectionTabState extends State<CollectionTab> {
  List items = [
    Recipeitemmodel(imagePath: "assets/images/chickenzuccini.jpg", name: "Chicken recipes"),
    Recipeitemmodel(imagePath: "assets/images/easybourboncake.jpg", name: "Meatball recipes"),
    Recipeitemmodel(imagePath: "assets/images/noodles.jpg", name: "Chicken mince recipes", 
  )];
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "3 collections",
              style: TextStyle(
                color: ColorConstants.darkGrey,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 15),
          greyLine(),
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
                      Text("4 recipes"),
                    SizedBox(height: 4),
                  ]
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {  return Divider(
                color: ColorConstants.lightGrey1,
                thickness: 1.0,
              ); },
            ),
          ),
  
        ],
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
