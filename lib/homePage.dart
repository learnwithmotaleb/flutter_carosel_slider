import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> assetsImage = [
    "assets/images/Nilphamari_picture.jpg",
    "assets/images/Lalmonirhat_picture.jpg",
    "assets/images/Gaibandha_picture.jpg",
    "assets/images/Dinajpur_picture.jpg",
    "assets/images/Kurigram_picture.jpg",
    "assets/images/Panchagarh_picture.jpg",
    "assets/images/Rangpur_picture.jpg",
    "assets/images/Thakurgaon_picture.jpg",
  ];
  List<String> assetsTitle = [
    "নীলফামারী",
    "লালমনিরহাট",
    "গাইবান্ধা",
    "দিনাজপুর",
    "কুড়িগ্রাম",
    "পাঞ্চগড়",
    "রংপুর",
    "ঠাকুরগাও"
  ];
  final color = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        centerTitle: true,
        title: Text("ImageSlider"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: assetsImage.length,
                    padEnds: false,
                    pageSnapping: false,
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    controller:
                        PageController(viewportFraction: 0.8, initialPage: 2),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(5),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            // color: color[index],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                assetsImage[index],
                                fit: BoxFit.cover,
                                height: 300,
                              ),
                              Positioned(
                                  child: Center(
                                      child: Text(
                                assetsTitle[index],
                                style: TextStyle(
                                    fontSize: 20, color: color[index]),
                              )))
                            ],
                          ));
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: assetsImage.length,
                    padEnds: false,
                    pageSnapping: false,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (value) {
                      currentIndex = value;
                      setState(() {});
                    },
                    controller: PageController(
                      viewportFraction: 0.8,
                      initialPage: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(5),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            // color: color[index],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                assetsImage[index],
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                              Positioned(
                                  child: Center(
                                      child: Text(
                                assetsTitle[index],
                                style: TextStyle(
                                    fontSize: 20, color: color[index]),
                              )))
                            ],
                          ));
                    }),
              ),
              TabPageSelector(
                selectedColor:Colors.orange,
                color:color.last,
                borderStyle: BorderStyle.none,
                controller: TabController(
                  initialIndex: currentIndex,
                  length: assetsImage.length,
                  vsync: this,
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller:
                    PageController(viewportFraction: 0.8,),
                    itemBuilder: (context, index) {
                      print(index % assetsImage.length);
                      return Container(
                          margin: EdgeInsets.all(5),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            // color: color[index],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                assetsImage[index % assetsImage.length],
                                fit: BoxFit.cover,
                                height: 400,
                              ),
                              // Positioned(
                              //     child: Center(
                              //         child: Text(
                              //           assetsTitle[index],
                              //           style: TextStyle(
                              //               fontSize: 20, color: color[index]),
                              //         )))
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
