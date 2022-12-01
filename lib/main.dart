import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser(String link) async {
  final response = await http
      .get(Uri.parse(link));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

class User {
  final Map<String, dynamic> user;

  const User({
    required this.user,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      user: json["user"],
    );
  }
}

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
  int currentClicked = 0;
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser('https://mocki.io/v1/68f14a12-9f6a-4b91-941e-3372d736a98e');
    futureUser.then((value) => {
      debugPrint(value.user["image_url"]),
      for (var element in value.user["vehicles"]) {
        if (element.containsKey("default")){
          setState(() {
            currentClicked = value.user["vehicles"].indexOf(element);
          })
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          foregroundColor: const Color(0xFF616161),
          elevation: 0,
          leading:  IconButton(icon: const Icon(Icons.west), onPressed: () {}),

        ),
        body: Center(
          child: FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                print(snapshot.data!.user);
                return Padding(
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
                              ClipOval(child: Image.network(snapshot.data!.user["image_url"], height: 90, width: 90, fit: BoxFit.scaleDown)),
                              const Positioned(
                                bottom: 0,
                                right: 0,
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
                            child: Text(snapshot.data!.user['name'],
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
                                        snapshot.data!.user["level"]["points"].toString().split(".")[0],
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
                                        snapshot.data!.user["level"]["message"],
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: const Color(0xFF8B8B8B))
                                    ),
                                    LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      width: MediaQuery.of(context).size.width - 128,
                                      lineHeight: 8.0,
                                      percent: double.parse("0.${snapshot.data!.user["level"]["points"].toString().split(".")[1]}"),
                                      progressColor: const Color.fromRGBO(54, 164, 255, 1),
                                      backgroundColor: const Color(0xFFECECEC),
                                      barRadius: const Radius.circular(8),
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
                                        (int.parse(snapshot.data!.user["level"]["points"].toString().split(".")[0])+1).toString(),
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
                                        snapshot.data!.user["coins_earned"].toString(),
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
                                        "${Duration(seconds: snapshot.data!.user["time_saved"]).inHours}h ${Duration(seconds: snapshot.data!.user["time_saved"]).inMinutes - 60*Duration(seconds: snapshot.data!.user["time_saved"]).inHours}m",
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
                                Row(children: _vehicleRadioButtons( snapshot.data!.user["vehicles"])),
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
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
        ),
      ),
    );
  }

  List <Widget>_vehicleRadioButtons(List vehicleList) {
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

   _inactivePhysicalShape (Map<String, dynamic> vehicleGiven) {
    String? fuelType;
    vehicleGiven["fuel_types"].forEach((dynamic fuel) => fuelType == null? fuelType = capitalize(fuel): fuelType = "$fuelType + ${capitalize(fuel)}");
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
              fuelType!,
              style: GoogleFonts.roboto(),
            ),
            SvgPicture.asset("assets/images/car.svg", height: 24, width: 24, color: const Color(0xff444444))
          ],
        ),
      ),
    );
   }

  _activePhysicalShape (Map<String, dynamic> vehicleGiven) {
    String? fuelType;
    vehicleGiven["fuel_types"].forEach((dynamic fuel) => fuelType == null? fuelType = capitalize(fuel): fuelType = "$fuelType + ${capitalize(fuel)}");
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
                    fuelType!,
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

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

