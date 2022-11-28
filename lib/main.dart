import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          foregroundColor: const Color(0xFF616161),
          elevation: 0,
          leading:  IconButton(icon: const Icon(Icons.west), onPressed: (){},),

        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    children: [
                      SvgPicture.asset("assets/images/user.svg", height: 128, width: 128),
                       const Positioned(
                        bottom: 12,
                        right: 12,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.edit, color: Color(0xFFFAFAFA), size: 16,)
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Jiggs"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Level"),
                          Text("1")
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:   [
                          const Text("Completed Fueling profile"),
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 104,
                            lineHeight: 8,
                            percent: 0.47,
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(height: 8,)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Level"),
                          Text("2")
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:   [
                        Column(
                          children:  [
                            const Text("Coins"),
                            SvgPicture.asset("assets/images/coin.svg", height: 42, width: 42),
                            const Text("133"),
                          ],
                        ),
                        const VerticalDivider(
                          width: 30,
                          thickness: 1,
                          color: Color(0xFFD6D6D6),
                          indent: 4,
                          endIndent: 4,
                        ),
                        Column(
                          children:  [
                            const Text("Time Saved"),
                            SvgPicture.asset("assets/images/time.svg", height: 42, width: 42),
                            const Text("1h 25m"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: const [
                      Text("vehicles"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(children: _vehicleRadioButtons(vehicleList),),
                      const SizedBox(
                        width: 100,
                        child: Center(
                        child: FloatingActionButton(
                          elevation: 2,
                          onPressed: null,
                          child: Icon(Icons.add),
                        ),
                    ),
                      )],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List <Widget>_vehicleRadioButtons(List<String> vehicleList) {
    return List<Widget>.generate(vehicleList.length, (index) {
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
                vehicleList[index],
                // style: const TextStyle(
                //   color: Colors.black,
                //   fontSize: 20.0,
                // ),
              ),
              SvgPicture.asset("assets/images/car.svg", height: 24, width: 24,)
            ],
          ),
        ),
      );
    });
  }
}
