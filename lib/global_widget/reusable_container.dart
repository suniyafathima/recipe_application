import 'package:flutter/material.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class ReusableContainer extends StatelessWidget {
  final String? imagePath;
  final String ingName;

  const ReusableContainer({
  super.key, 
  this.imagePath, 
  required this.ingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorConstants.grey),
        
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(imagePath!= null)
          CircleAvatar(
            radius:15,
            backgroundImage:AssetImage(imagePath!),
          ),
          SizedBox(width: 10),
          Text(
            ingName,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorConstants.darkGrey )
          ),
        ],
      ),
    );
  }
}

   