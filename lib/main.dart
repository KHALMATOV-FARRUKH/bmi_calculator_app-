import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

//Let's start by creating a new Stateful widget

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  // Here I'm going to declare a variable for our custom radio button
  int currentIndex = 0;
  String result ="0";
  double height = 0;
  double weight = 0;
  // Let's declare the inputController to get the inputs value
  TextEditingController heightController  = TextEditingController();
  TextEditingController weightController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //First we will create a simple app bar
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xfffafafa),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      //Now let's start by creating the body of the app
      // We will wrap all the body inside a SingleScrollChild widget
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Woman", Colors.pink, 1),
                ],
              ),
              const SizedBox(height: 10.0,
              ),
              // Now let's create our input form
              const Text("Your Height in Cm:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in Cm",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0,
              ),
              // For the weight I'm going to do the same thing
              // so just copy & paste the previous code
              const Text("Your Weight in Kg:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your weight in Kg",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15.0,
              ),
              // Now let's add the calculate button
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                    });
                    calculateBmi(height, weight);
                  },
                  color: Colors.blue,
                  child: const Text("Calculate", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              const SizedBox(height: 15.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                // width: 400,
                height: 210,
                child: Image.asset("assets/images/bmi.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight){
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  // and here I'm going to declare a function to change the index value on button pressed
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //Now I will create a new custom widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        // I will add some margins to the container
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        // Let's add some height to the button
        height: 80.0,
        child: MaterialButton(
          // Now I want the color of my button change in function of it's selected or not
          // this line means if the current index is equal to the button index then put the color
          // the main color that we will define otherwise make it grey
            color: currentIndex == index ? color : Colors.grey[200],
            // let's add some round border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          onPressed: () {
            // when we click the button the current index will have the value of the button's index
            changeIndex(index);
          },
          //i'll apply some modification to the button text color
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
