import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BmiCalcPage(),
    );
  }
}

class BmiCalcPage extends StatefulWidget {
  @override
  _BmiCalcPageState createState() => _BmiCalcPageState();
}

class _BmiCalcPageState extends State<BmiCalcPage> {
  double weight = 65;
  double height = 170;
  double bmi = 0;
  String message="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Column(
        children: [
          Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          Image.asset(
            "assets/love.jpg",
            height: 150,
          ),
          Text(
            "We care about your health",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "Height (${height.toStringAsFixed(0)} cm)",
            style: TextStyle(fontSize: 24),
          ),
          Slider(
              min: 100,
              max: 220,
              value: height,
              onChanged: (double value) {
                //change the state
                setState(() {
                  height = value;
                });
              }),
          Text(
            "Weight - (${weight.toStringAsFixed(0)} kg)",
            style: TextStyle(fontSize: 24),
          ),
          Slider(
              min: 50,
              max: 150,
              value: weight,
              onChanged: (double value) {
                setState(() {
                  weight = value;
                });
              }),
          FlatButton.icon(
            icon: Icon(Icons.favorite),
            color: Colors.redAccent,
            textColor: Colors.white,
            label: Text(
              "Calculate",
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
             var bmiCalc = weight / ((height / 100) * (height / 100));
             var messageTemp = "";

             if (bmiCalc < 18.5){
               messageTemp = "You are underweight";
             }
             else if (bmiCalc < 25){
               messageTemp = "You are normal";
             }
             else {
               messageTemp = "You are obese";
             }
             setState(() {
               bmi=bmiCalc;
               message = messageTemp;
             });
              print(bmi);
            },
          ),
          //ternary operator
          bmi > 0 ? Text("Your BMI is ${bmi.toStringAsFixed(0)}.$message"):
              Text("")
        ],
      ),
    );
  }
}
