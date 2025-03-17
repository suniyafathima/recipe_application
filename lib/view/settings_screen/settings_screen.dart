import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/registration_screen/registration_screen.dart';
import 'package:recipe_application/view/type_screen/type_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         centerTitle: true, 
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: ColorConstants.darkblue,),
          onPressed: () {
            Navigator.pop(context);
          }, 
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          //ACCOUNT SECTION
          SectionHeader(title: "ACCOUNT"),
          SettingsTile(title: "Preferences",onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (index)=>TypeScreen()));
         
          },),
          Divider(),
          SettingsTile(title: "My Account", isExternal: true),
          Divider(),
         

          //ABOUT SECTION
          SectionHeader(title: "ABOUT"),
          SettingsTile(title: "Frequently asked questions", isExternal: true),
          Divider(),
          SettingsTile(title: "Feedback"),
          Divider(),
          SettingsTile(title: "Terms of service & privacy policy", isExternal: true),
          Divider(),
          SettingsTile(title: "Terms of use"),
        
          Divider(),
          SettingsTile(title: "Version", trailingText: "3.1.2"),
          Divider(),

        //LOGIN

          SizedBox(height: 20),
          ReusableButton(buttonPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (index)=>RegistrationScreen()));
          }, 
          textname: "Log In",backgroundColor: ColorConstants.darkblue,),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

//SECTION HEADER WIDGET
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[600]),
      ),
    );
  }
}

//SETTINGS TILE WIDGET
class SettingsTile extends StatelessWidget {
  final String title;
  final bool isExternal;
  final String? trailingText;
  final void Function()? onTap;

  const SettingsTile({super.key, required this.title,
   this.isExternal = false, 
   this.trailingText,
   this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: isExternal
          ? Icon(Icons.open_in_new, size: 20, color: Colors.grey)
          : trailingText != null
              ? Text(trailingText!, style: TextStyle(color: Colors.grey[700]))
              : Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}