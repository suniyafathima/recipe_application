import 'package:flutter/material.dart';
import 'package:recipe_application/global_widget/reusable_button.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';
import 'package:recipe_application/view/bottom_navbar/bottom_navbar.dart';


class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
 final formKey=GlobalKey<FormState>();

TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
                 Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect( child: Container(width: 38,height: 35,color: ColorConstants.black,
                child: Icon(Icons.apple_outlined,
                size: 22,
                color: Colors.white,),
              )),
         
              ClipRRect(child:Container(width: 38,height: 35,
              decoration: BoxDecoration(color: ColorConstants.darkblue,
              borderRadius:BorderRadius.circular(2),),
              child:Image.asset("assets/images/pngegg.png"))),
              ClipRRect( child: Container(width: 38,height: 35,
              padding:EdgeInsets.all(5),
              decoration: BoxDecoration(color: ColorConstants.red,
              borderRadius:BorderRadius.circular(2)),
                child: Image.asset("assets/images/google1.png",
                   width: 25 ,height: 20,fit: BoxFit.contain, ),
              ))
                 ],
          ),
             SizedBox(height: 30),
             Text("or"),
             SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                validator: (value) {
                if(emailController.text.contains("@")){
                  return null;}
                   return "enter proper email"; 
                },
                decoration:InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
          
                     focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )
                  ),
          
                  focusedErrorBorder:OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                  ), 
                  ),),
          
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                if(passwordController.text.length>=6){
                  return null;}
                   return "enter password with minium 6 chars"; 
                },
        
                decoration:InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
          
                  focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )
                  ),
          
                  focusedErrorBorder:OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                  ), 
                  suffixIcon: Icon(Icons.visibility_off_rounded,color: Colors.grey,)
                ),
              ),
             SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot your password?")),
          
               SizedBox(height: 30),
             
            //  savedemail=emailController.text;
                //  savedpassword=passwordController.text;
                //  if(savedemail.isNotEmpty&&savedpassword.isNotEmpty){
                //    print("Registration Successful"); 
                //    Navigator.pop(context);
                //  }
                //  print("registration failed");
             
               ReusableButton(buttonPressed: ()  {
            
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (index)=>BottomNavbar()));
              }, 
              textname: "Log In",
              backgroundColor: ColorConstants.darkblue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}