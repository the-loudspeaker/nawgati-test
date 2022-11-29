import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nawgati test',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(54, 164, 255, 1),
        backgroundColor: const Color(0xFFFAFAFA),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA)
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> vehicleList = ["Petrol + CNG", "Diesel", "Electric"];
  int currentClicked = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          foregroundColor: const Color(0xFF616161),
          elevation: 0,
          leading:  IconButton(icon: const Icon(Icons.west), onPressed: () {}),

        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset("assets/images/user.svg", height: 128, width: 128),
                       const Positioned(
                        bottom: 12,
                        right: 12,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Color.fromRGBO(54, 164, 255, 1),
                          child: Icon(Icons.edit, color: Color(0xFFFAFAFA), size: 16,)
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text("Jiggs",
                        style: GoogleFonts.roboto(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "Level",
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF040404))
                            ),
                            Text(
                                "1",
                                style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF040404))
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:   [
                            Text(
                                "Completed Fueling profile",
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF8B8B8B))
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 128,
                              child: RoundedProgressBar(
                                height: 8,
                                style: RoundedProgressBarStyle(
                                    backgroundProgress: const Color(0xFFECECEC),
                                    borderWidth: 0,
                                    widthShadow: 0),
                                borderRadius: BorderRadius.circular(8),
                                percent: 30,),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "Level",
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF040404))
                            ),
                            Text(
                                "2",
                                style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF040404))
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      Expanded(
                        child: Column(
                          children:  [
                            Text(
                                "Coins",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF939393))
                            ),
                            SvgPicture.asset("assets/images/coin.svg", height: 42, width: 42),
                            Text(
                                "133",
                                style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF7C7C7C))
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        width: 30,
                        thickness: 1,
                        color: Color(0xFFD6D6D6),
                        indent: 4,
                        endIndent: 4,
                      ),
                      Expanded(
                        child: Column(
                          children:  [
                            Text(
                                "Time Saved",
                                style: GoogleFonts.roboto(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF939393))
                            ),
                            SvgPicture.asset("assets/images/time.svg", height: 42, width: 42),
                            Text(
                                "1h 25m",
                                style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF7C7C7C))
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      "Vehicles",
                      style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF343434))
                    )),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: _vehicleRadioButtons(vehicleList),),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: FloatingActionButton(
                              backgroundColor: const Color.fromRGBO(54, 164, 255, 1),
                              elevation: 2,
                              onPressed: () {},
                              child: const Icon(Icons.add),
                            ),
                          ),
                        )],
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: Text("Fuel", style: const TextStyle(color: Colors.white).copyWith(fontSize: 16),)
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  List <Widget>_vehicleRadioButtons(List<String> vehicleList) {
    return List<Widget>.generate(vehicleList.length, (index) {
      return GestureDetector(
        onTap: (){
            setState(() {
              currentClicked = index;
            });
          },
        child: index == currentClicked ?
        _activePhysicalShape(vehicleList[index]) : _inactivePhysicalShape(vehicleList[index]),
      );
    });
  }

   _inactivePhysicalShape (String textGiven) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      child: PhysicalShape(
        elevation: 2,
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        color: const Color(0xFFF9F9F9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textGiven,
              style: GoogleFonts.roboto(),
            ),
            SvgPicture.asset("assets/images/car.svg", height: 24, width: 24, color: const Color(0xff444444))
          ],
        ),
      ),
    );
   }

  _activePhysicalShape (String textGiven) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          child: PhysicalShape(
            elevation: 2,
            clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            color: const Color(0xFFF9F9F9),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(54, 164, 255, 1), width: 3, strokeAlign: StrokeAlign.outside),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    textGiven,
                    style: GoogleFonts.roboto(),
                  ),
                  SvgPicture.asset("assets/images/car.svg", height: 24, width: 24, color: const Color(0xff444444))
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromRGBO(54, 164, 255, 1),
              child: Icon(Icons.done, color: Color(0xFFFAFAFA), size: 15)
          ),
        ),
      ],
    );
  }
}

