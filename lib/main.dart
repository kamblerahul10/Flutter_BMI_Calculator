import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),

      home: const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var inchController = TextEditingController();
  var feetController = TextEditingController();
  var weightController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(

        color: bgColor,

        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    label: Text('Enter Weight in Kgs'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: feetController,
                  decoration: const InputDecoration(
                    label: Text('Enter Height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text('Enter Height (in inches'),
                    prefixIcon: Icon(Icons.height_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                    onPressed: (){

                      var wt = weightController.text.toString();
                      var ft = feetController.text.toString();
                      var inch = inchController.text.toString();

                      if( wt != "" && ft!="" && inch!=""){

                        var iWt = int.parse(wt);
                        var iFeet = int.parse(ft);
                        var iInch = int.parse(inch);

                        var TolInches = (iFeet*12) + iInch;

                        var tolCms = TolInches * 2.54;

                        var tolMtrs = tolCms/100;

                        var bmi = iWt/ ( tolMtrs * tolMtrs);

                        var msg ="";


                        if(bmi>25){
                          msg = "You are OverWeight !!! ";
                          bgColor = Colors.orange;
                        }else if(bmi>=18  &&  bmi<=25) {
                          msg = "You are Healthy :)";
                          bgColor = Colors.green;
                        }else{
                          msg = "You are Under Weight :( ";
                          bgColor = Colors.yellow;
                        }

                        setState(() {
                          result = "$msg Your BMI is ${bmi.toStringAsFixed(2)} ";
                        });

                      }else{
                        setState(() {
                          result = 'Please fill all the blanks !';
                        });
                      }

                    },
                    child: Text('Calculate')
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(result,style: TextStyle(fontSize: 17),),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

