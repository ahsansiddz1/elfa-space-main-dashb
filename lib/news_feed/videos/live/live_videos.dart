import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/../../constants/constants.dart';

class LiveVideos extends StatelessWidget {
  const LiveVideos();
  final postInfo = const [
    {
      'name': 'Jemma Rey',
      'post': MyImages.baseImage,
      'audience': '5.6k',
      'user_image': MyImages.jemmaRey,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: size.height * 1 / size.width * 0.28,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (ctx, index) => Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset(
                      MyImages.baseImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF4B4B),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color:
                                  Colors.black.withOpacity(0.30000001192092896),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Live',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 40,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.10000000149011612),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color:
                                  Colors.white.withOpacity(0.30000001192092896),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people_outlined,
                              color: Colors.white,
                              size: 17,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '5.6k',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyImages.claire),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Claire Dongais',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.41,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
