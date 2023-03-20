import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text('BMI calculator', style: TextStyle(color: Colors.white),),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter your weight (in Kilogram)'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your height  (in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter your height (in Inches)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != '' && ft != '' && inch != '') {
                        // BMI calculator
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt*12) + iInch;
                        var tCm = tInch*2.54;
                        var tM = tCm/100;
                        var bmi = iWt/(tM*tM);
                        var msg = "";

                        if (bmi> 25){
                          msg = "You are OverWeight";
                          bgColor = Colors.orange.shade200;
                        }else if (bmi<18){
                          msg = "You are UnderWeight";
                          bgColor = Colors.red.shade200;
                        }
                        else{   msg = "You are Healthy";
                        bgColor = Colors.green.shade200;}
                        setState(() {
                          result = "$msg \n Your BMI is:${bmi.toStringAsFixed(2)}";
                        });


                      } else {
                        setState(() {
                          result = "Please fill all the required blanks!!";
                        });
                      }
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
