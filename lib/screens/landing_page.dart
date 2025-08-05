import 'package:flutter/material.dart';
import 'package:louajet_web/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/triangle_painter.dart';


class LandingPage extends StatelessWidget{
  void _downloadApk() async {
    final apkUrl = Uri.parse('louajet.apk'); // Relative to your web root
    if (!await launchUrl(apkUrl)) {
      throw Exception('Could not launch $apkUrl');
    }
  }
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool mobile = isMobile(context);

    return Scaffold(
      backgroundColor: ConstantColors.louageRed,
      body: Stack(
        children: [
          Visibility(
            visible: !mobile,
            child: Positioned(
              bottom: screenHeight*0.13,
                left: screenWidth*0.13,
                child: Image.asset("assets/arrow.png",color: Colors.white,height: screenWidth*0.3,)),
          ),
          Positioned(
            bottom: -screenHeight*0.12,
            left: -screenHeight*0.12,
            child: Container(
              height :mobile?screenHeight*0.3: screenHeight*0.5,
              width: mobile?screenHeight*0.3:screenHeight*0.5,
              decoration: BoxDecoration(
                color: Color.alphaBlend(ConstantColors.louageRed.withOpacity(0.5), Colors.white),

                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: screenHeight*0.15,
            right: screenWidth*0.12,
            child: Transform.rotate(
              angle: 45 * 3.1415927 / 180, // Convert 45 degrees to radians

              child: Container(
                height: mobile? screenHeight *0.11:screenHeight*0.2,
                width: mobile? screenHeight *0.11:screenHeight*0.2,
                decoration: BoxDecoration(
                  color: Color.alphaBlend(ConstantColors.louageRed.withOpacity(0.5), Colors.white),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: mobile?screenHeight*0.22:screenHeight*0.2,
            right: mobile?screenHeight*0.1:screenHeight*0.4,
            child: Transform.rotate(
              angle: 25 * 3.1415927 / 180, // Convert 45 degrees to radians

              child: Container(
                height: screenHeight*0.1,
                width: screenWidth*0.1,
                decoration: BoxDecoration(
                  color: Color.alphaBlend(ConstantColors.louageRed.withOpacity(0.5), Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: mobile?-55:-120,
            left: mobile?-90:-200,
            child: Transform.rotate(
              angle: -45 * 3.1415927 / 180, // Convert 45 degrees to radians

              child: CustomPaint(
                size: mobile?Size(180, 180):Size(300, 300), // Size of the triangle's bounding box
                painter: TrianglePainter(
                  color: Color.alphaBlend(ConstantColors.louageRed.withOpacity(0.5), Colors.white),
                ),
              ),
            ),
          ),
          Visibility(
            child: Positioned(
              bottom: mobile?-screenHeight*0.08:-screenHeight*0.15,
              right: -90,
              child: Transform.rotate(
                angle: -105 * 3.1415927 / 180, // Convert 45 degrees to radians

                child: CustomPaint(
                  size: mobile?Size(180, 180):Size(300, 300), // Size of the triangle's bounding box
                  painter: TrianglePainter(
                    color: Color.alphaBlend(ConstantColors.louageRed.withOpacity(0.5), Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset("assets/logo.png",width: mobile?screenWidth*0.3:screenWidth*0.12,),
                      ),
                    )
                ),
                SizedBox(height: screenHeight*0.02,),

                Visibility(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(" ،الـسـفـر بالـلـواج",style: TextStyle(fontFamily: "NotoArabicBlack",color: Colors.white,fontSize: 40),),
                      Text("! أصـبـح أسـهـل",textAlign: TextAlign.center,style: TextStyle(fontFamily: "NotoArabicBlack",color: Colors.white,fontSize: 40),),
                      SizedBox(height: 55,),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 25,
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        icon: Icon(Icons.download,color: ConstantColors.louageRed,size: 35,),
                          onPressed: (){
                          _downloadApk();
                          }, label: Text("حمل التطبيق",style: TextStyle(fontFamily: "NotoArabicSemiBold",color: ConstantColors.louageRed,fontSize: 20),))
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      )
    );
  }

}

