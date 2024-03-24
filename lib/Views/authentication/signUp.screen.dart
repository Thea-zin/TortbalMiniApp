import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TBSignupNumberphone extends StatelessWidget {
  const TBSignupNumberphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Sign Up",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:Column(
        children: [
           Container(
            margin:const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: TBColor.inputBackground,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child:Container(
                padding: const EdgeInsets.all(2),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width:300.0 ,
                                    height: 68,
                                    // Adjust the width according to your requirement
                                    child: IntlPhoneField(
                                      decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "12 345 678",
                                        suffix: SizedBox(width: 50), 
                                      ),
                                  
                            
                                    ),
                                  ),
                             
                              ],
                            ),
              ),
              
            
            ),
    
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: 358,
            child: const Text(
                        "Please note that by signing up your user account, you are accepting our Terms of Use and Privacy Policy.",  
                        style: TextStyle(
                          fontSize:12,
                        ),           
          ),
          ),
          Container(
             padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Divider(
              
              color:TBColor.label,
              thickness: 1,
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 358,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    label: const TBText(
                      "Continue with facebook",
                      fontWeight: FontWeight.w600,
                      
                    ),
                    icon:const Icon(Icons.message),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TBColor.inputBackground,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Container(
                  width: 358,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    label: const TBText(
                      "Continue with facebook",
                      fontWeight: FontWeight.w600,
                      
                    ),
                    icon:const Icon(Icons.message),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: TBColor.inputBackground,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TBText(
                    "Already Having Account ?",
                    textSize:14,
                  ),
                  TBText(
                    "Login",
                    textSize:14,
                    textColor: TBColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ],
            ),
          ),
          Container(
                  padding:const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 358,
                  height: 75,
                  child: TBButton(
                    onTap: () {},
                    backgroundColor: TBColor.primary,
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TBText(
                            "Sign Up",
                            fontWeight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white,
                          )
                        ],
                    ) ,)
                )
        ],
      ),
    );
  }
}