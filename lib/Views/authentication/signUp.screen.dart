import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';
import 'package:thortbal/Helpers/Widgets/utils/tb_global_funs.dart';
import 'package:thortbal/Views/authentication/login.screen.dart';

class TBSignupNumberphone extends StatelessWidget {
  const TBSignupNumberphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColor.background,
        surfaceTintColor: TBColor.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Sign Up",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TBColor.inputBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              child: TBTextFeild(
                keyboardType: TextInputType.phone,
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                maxWidthPrefix: 100,
                prefix: Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 12),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    width: double.infinity,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          TBIcons.tbCambodia,
                          width: 18,
                          height: 18,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: VerticalDivider(
                            width: 1,
                            color: Colors.black87,
                          ),
                        ),
                        TBText(
                          "+855",
                          textSize: TBTextSize.large - 2,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black87,
                        )
                      ],
                    ),
                  ),
                ),
                hinText: "086 000 000",
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.0,
                    height: 68,
                    // Adjust the width according to your requirement
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "12 345 678",
                        suffix: SizedBox(width: 50),
                      ),
                    ),
                    
                  ),
                ],
              ),
              */
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TBText(
              "Please note that by signing up your user account, you are accepting our Terms of Use and Privacy Policy.",
              maxLines: 2,
              textSize: TBTextSize.medium,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Divider(),
          ),
          _signUpWithButton(
            imagePath: TBIcons.tbFacebook,
            title: "Continue with Facebook",
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _signUpWithButton(
            imagePath: TBIcons.tbGoogle,
            title: "Continue with Google",
            onTap: () {},
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TBText(
                  "Already Having Account? ",
                  textSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () => showTBBottomSheet(
                    context: context,
                    child: const TBLoginScreen(),
                  ),
                  child: TBText(
                    "Login",
                    textSize: 14,
                    textColor: TBColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + 10,
              top: 16,
            ),
            child: TBButton(
              onTap: () => Navigator.popAndPushNamed(context, "/main"),
              backgroundColor: TBColor.primary,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TBText(
                    "Sign Up",
                    fontWeight: FontWeight.w600,
                    textSize: 16,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpWithButton({
    required String imagePath,
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
          border: Border.all(width: 1, color: TBColor.label),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(width: 20),
            TBText(
              title,
              textSize: TBTextSize.medium + 2, // 14
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
