import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class ReusableContainerc extends StatelessWidget {
  final String? imagePathc;
  final String ingNamec;

  const ReusableContainerc({
  super.key, 
  this.imagePathc, 
  required this.ingNamec});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorConstants.grey),
        
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(imagePathc!= null)
          Image.asset(imagePathc!,
          height: 50,
          width: 50,
          fit: BoxFit.cover,),
          SizedBox(width: 10),
          Text(
            ingNamec,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorConstants.darkGrey )
          ),
        ],
      ),
    
    );
  }
}
