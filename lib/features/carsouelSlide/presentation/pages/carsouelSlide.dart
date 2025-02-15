import 'package:elfa_main_dashboard/features/carsouelSlide/presentation/widgets/logInButton.dart';
import 'package:elfa_main_dashboard/features/carsouelSlide/presentation/widgets/signupform.dart';
import 'package:flutter/material.dart';
import '../widgets/carsouelBody.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/dotChanger.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgets/loginForm.dart';

class CarsouelSlide extends StatelessWidget {
  static const routeName = '/CarsouelSlideScreen';
  const CarsouelSlide({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> carsouelData = [
      {
        "text1": "Find Best workspaces\nNear you",
        "text2":
            "Search for exactly what you want and we will find the best places nearby.",
        "image": "assets/splashAssets/carsouelAssets/slide1.png"
      },
      {
        "text1": "Top Schools\nNear you",
        "text2":
            "Discover the educational gems that lie just around the corner – top-notch schools and tuition centers that empower young minds to shine.",
        "image": "assets/splashAssets/carsouelAssets/slide2.png"
      },
      {
        "text1": "Top Local Food \nNear you",
        "text2":
            "Explore the tasty secrets right around the corner – find local food shops serving delicious treats nearby!",
        "image": "assets/splashAssets/carsouelAssets/slide3.png"
      },
      {
        "text1": "Top Gyms Near you",
        "text2":
            "Stay in shape effortlessly by finding nearby gyms and fitness centers with convenience!",
        "image": "assets/splashAssets/carsouelAssets/slide4.png"
      },
      {
        "text1": "Top Salons Near you",
        "text2":
            "Easily discover nearby salons and beauty parlors for all your grooming needs!",
        "image": "assets/splashAssets/carsouelAssets/slide5.png"
      },
      {
        "text1": "Top Marriage Halls \nNear you",
        "text2":
            "Find the perfect marriage hall for your special day with ease!",
        "image": "assets/splashAssets/carsouelAssets/slide6.png"
      },
      {
        "text1": "Top Influencers \nNear you",
        "text2":
            "Discover the top influencers who can help elevate your brand!",
        "image": "assets/splashAssets/carsouelAssets/slide7.png"
      },
    ];
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 500.h,
              child: PageView.builder(
                itemCount: carsouelData.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  Provider.of<DotChanger>(context, listen: false)
                      .setindex(value);
                },
                itemBuilder: (context, index) {
                  return CarsouelBody(
                    text1: carsouelData[index]["text1"] as String,
                    text2: carsouelData[index]["text2"] as String,
                    image: carsouelData[index]["image"] as String,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  carsouelData.length,
                  (index) => Consumer<DotChanger>(
                        builder: (context, value, child) {
                          return dot(index, value.currentindex);
                        },
                      )),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 20.w,
              endIndent: 20.w,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginInButton(
                  heightt: 60,
                  widthh: 150,
                  text: 'Log in',
                  // color: const Color(0xffB409CE),
                  ontap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const logInForm();
                        });
                  },
                ),
                LoginInButton(
                  heightt: 60,
                  widthh: 150,
                  text: 'Sign Up',
                  color: Colors.grey,
                  ontap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r))),
                        context: context,
                        builder: (BuildContext context) {
                          return const SignUpForm();
                        });
                  },
                )
              ],
            ),
            SizedBox(height: 8.h),
            Text('Are you a service provider?',
                style: headingTheme.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xff000000).withOpacity(0.5))),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Admin login',
                    style: headingTheme.copyWith(
                        fontSize: 12.sp, color: ksupportColor)),
                Text('  |  ',
                    style: headingTheme.copyWith(
                        fontSize: 12.sp,
                        color: kprimayTextColor,
                        fontWeight: FontWeight.bold)),
                Text('Admin SignUp',
                    style: headingTheme.copyWith(
                        fontSize: 12.sp, color: ksupportColor))
              ],
            )
          ]),
        ));
  }
}
