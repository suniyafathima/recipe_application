import 'package:flutter/material.dart';
import 'package:recipe_application/model/home_screen_models/recipeitem_model.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class RecipeTab extends StatefulWidget {
  const RecipeTab({super.key});

  @override
  State<RecipeTab> createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
 List items = [
    Recipeitemmodel(imagePath: "assets/images/chickenzuccini.jpg", name: "Chicken zuccini", rating: 4.5, time: "25m"),
    Recipeitemmodel(imagePath: "assets/images/easybourboncake.jpg", name: "Easy bourbon cake", rating: 4, time: "20m"),
    Recipeitemmodel(imagePath: "assets/images/noodles.jpg", name: "Chilly Egg noodles", rating: 3.5, time: "30m"),
    Recipeitemmodel(imagePath: "assets/images/Potatofry.jpg", name: "Crispy Potato fry", rating: 5, time: "25m"),
    Recipeitemmodel(imagePath: "assets/images/Sourcreamfried.jpg", name: "Sourcream fried chicken", rating: 5, time: "32m"),
    Recipeitemmodel(imagePath: "assets/images/vegopesto.jpg", name: "Sego pesto pasta", rating: 1, time: "15m"),
    Recipeitemmodel(imagePath: "assets/images/butterchicken.jpg", name: "Butter chicken", rating: 4.9, time: "20m", isLiked: false)
  ];
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "3 recipes",
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
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < items[index].rating.floor()
                                ? Icons.star
                                : (starIndex < items[index].rating)
                                    ? Icons.star_half
                                    : Icons.star_border,
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
                  trailing: InkWell(
                      onTap:() {
                          setState(() {
                          items[index].isLiked = !items[index].isLiked;
                           });
                         },
                    child: CircleAvatar(
                        radius: 16,
                        backgroundColor: ColorConstants.lightGrey,
                        child: Icon(items[index].isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                        color: items[index].isLiked ? Colors.red : Colors.grey,
                        size:16,
                          ),
                        ),
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
    );
  }

  Container greyLine() {
    return Container(
      color: ColorConstants.lightGrey1,
      height: 1.0,
    );
  }
}
