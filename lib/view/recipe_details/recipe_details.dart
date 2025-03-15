import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/bottom_navbar/bottom_navbar.dart';
import 'package:recipe_application/view/home_screen/home_screen.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
bool clickedStar=false;
 static List ingredients=[
"440g pkt shelf-fresh hokkien noodles",
"1 tbsp peanut oil",
"500g Coles Australian RSPCA Approved Chicken Mince",
"1 carrot, cut into matchsticks",
"1 red capsicum, seeded, finely chopped",
"2 garlic cloves, crushed",
"1 tbsp curry powder",
"1/4 cup (60ml) Coles oyster sauce",
"2 tbsp Coles salt-reduced soy sauce",
"1/2 cup (60g) frozen baby peas",
"1 bunch choy sum, coarsely chopped",
"1/2 small wombok (Chinese cabbage),coarsely shredded",
"2 spring onions, thinly sliced",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    double screenHeight = size.height;
    return Scaffold(
      appBar:AppBar(
         leadingWidth: 100,
       leading: InkWell(
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (index)=>BottomNavbar()));
            },
         child: Row(
          children: [
           SizedBox(width: 20,), 
           Icon(Icons.arrow_back_ios,color: ColorConstants.darkblue,),
           Text("Back",style: TextStyle(fontSize: 20,color: ColorConstants.darkblue),)  
         ]),
       ),
       //title: Text("Chicken zuccini"),
       actions: [Padding(padding:EdgeInsets.all(10)),
        IconButton(
        onPressed: () { 
          
         },
        icon: Icon(Icons.favorite_border_outlined,
        color: ColorConstants.darkblue,size: 25)),
        IconButton(
        onPressed: () { 

         },
        icon: Icon(Icons.share,color: ColorConstants.darkblue,size: 25,),)
       ],
       bottom: PreferredSize(preferredSize: Size.fromHeight(-1), 
       child:Container(
        color: ColorConstants.lightGrey1,
        height: 2.0,
      )), 
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              SizedBox(height: 15,),
              SizedBox(
               // height: 60,
               child: Expanded(
                 child: Text("Chicken zuccini",
                  style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  ),
               ),
              ),
               Row(
                mainAxisAlignment:MainAxisAlignment.center,
                  children: 
                    List.generate(5, (index){
                        return Icon(
                          Icons.star_border,
                            color:Colors.amber,size: 16,
                            );
                }),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_filled,size:20,color: ColorConstants.darkGrey,),
                  SizedBox(width: 4),
                  Text("30m",
                  style: TextStyle(color: ColorConstants.darkGrey,fontSize: 20))
                 ],
          ),
          SizedBox(height: 10,),
            Container(
                height: screenHeight * 0.3, 
                width: double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), 
                image: DecorationImage(
                image: AssetImage("assets/images/chickenzuccini.jpg"), 
                fit: BoxFit.cover,
               ),
              ),
            ), 
            SizedBox(height: 20,),
            greyLine(),
            SizedBox(height: 20,),
            // for ingredient list
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Ingredients",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(ingredients.length, (index)=>
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                   // width: 300,
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline_rounded,
                        color: ColorConstants.darkGrey,),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text(ingredients[index],
                          style: TextStyle(fontSize: 25),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,),
                        ),],
                      ),
                  ),
                  greyLine()
                ],        ),
            ),
          ),
          TextButton(onPressed: (){}, 
          //add ingregients to shoplist
          child:Row(
            children: [
              Icon(Icons.add,color: ColorConstants.darkblue,size: 25,),
              SizedBox(width: 10),
              Text("Add all to shopping list",
              style: TextStyle(
              fontSize:25,
              fontWeight: FontWeight.bold,
              color:ColorConstants.darkblue),),
            ],
          ) ),
           SizedBox(height: 20,),
            greyLine(),
            SizedBox(height: 20,),
            //recipe methods
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Method",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
              greyLine(),
              Text("Step 1",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              Text("Place noodles in a heatproof bowl. Cover with boiling water. Set aside for 5 mins or until noodles separate. Drain.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal
              ),textAlign: TextAlign.justify,),
              greyLine(),
              Text("Step 2",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              Text("Meanwhile, heat oil in a wok over high heat. Add chicken and stir-fry, stirring with a wooden spoon to break up any lumps, for 3-4 mins or until lightly browned. Add the carrot, capsicum and garlic and stir-fry for 1 min.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal
              ),textAlign: TextAlign.justify,),
              greyLine(),
              Text("Step 3",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              Text("Add the curry powder and stir-fry for 1 min or until fragrant. Add the oyster sauce, soy sauce, noodles and ½ cup (125ml) water. Stir-fry for 2 mins or until well combined. Add the peas, choy sum, wombok and spring onion and stir-fry for 1-2 mins or until wombok just wilts.Divide among serving bowls.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal
              ),textAlign: TextAlign.justify, 
              ),
              greyLine(),
            SizedBox(height: 20,),
            //for add reviews
            
            Row(
              children: [
                Text("Reviews(1)",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                Spacer(),
                TextButton(onPressed: (){}, child: Text("Read all",
                style: TextStyle(color: ColorConstants.darkblue,
                fontSize:20 ),)),
              ],
            ),
            
             Row(
            children: [
                 Column(
                      children: [
                         Text("Tasty",style: TextStyle(fontSize:23 )),
                        Text("~suniya",style: TextStyle(fontSize: 18 ,color: ColorConstants.darkGrey),),
                       
                      ],),
                      Spacer(),
                 Icon(Icons.star,color: Colors.amber,),
                Text("5",style: TextStyle(fontSize:20 ))      
               ],
             ),
              SizedBox(height: 20,),
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(color: ColorConstants.lightGrey1),
                
                child: TextButton(onPressed: (){
                  //
                }, 
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select a rating", style: TextStyle(
                      color: ColorConstants.darkblue,
                      fontSize:20,),),
                      SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                         List.generate(5, (index){
                                return Icon(Icons.star_border_outlined,
                                color:Colors.amber,size: 50,
                                );
                              })
                      
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      maxLines: 4,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: "Add a review...",
                        hintStyle: TextStyle(color: ColorConstants.grey),
                        fillColor: ColorConstants.lightblue,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.grey)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.grey)
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    ReusableButton(buttonPressed:(){}, 
                    textname: "Add a review",
                    backgroundColor:ColorConstants.darkblue ),
                    
                  ],
                )),
              ),      
             ]) ]),
      )));
  }

  Widget greyLine() {
    return Container(
     color: ColorConstants.lightGrey1,
     height: 2.0,
      );
  }
}