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
  // Here I'm going to declare a varibale for our custom radio button
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //First we will create a simple app bar
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
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
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pink, 1),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // and here I'm going to declare a function to change the index value on button pressed
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  //Now I will create a new custom widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        // I will add some margins to the container
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: MaterialButton(
          // Now I want the color of my button change in function of it's selected or not
          // this line means if the current index is equalt to the button index then put the color
          // the main color that we will define otherwise make it grey
            color: currentindex == index ? color : Colors.grey[200],
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
              color: currentindex == index ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }
}
