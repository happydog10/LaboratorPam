import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFFF1F4F6),
      ),
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  bool isMale = true;
  double weight = 70;
  int age = 23;
  double height = 170;
  double bmi = 0;
  String bmiCategory = '';

  void calculateBMI() {
    if (height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
        if (bmi < 18.5) {
          bmiCategory = "Underweight";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiCategory = "Normal";
        } else if (bmi >= 25 && bmi <= 29.9) {
          bmiCategory = "Overweight";
        } else {
          bmiCategory = "Obese";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Welcome 😊', style: TextStyle(fontSize: 25, color: Colors.black)),
            Text('BMI Calculator', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderButton(
                  gender: "Male",
                  selected: isMale,
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                ),
                GenderButton(
                  gender: "Female",
                  selected: !isMale,
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            InputField(
              label: 'Weight',
              value: weight.toStringAsFixed(0),
              onIncrement: () {
                setState(() {
                  weight++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (weight > 0) weight--;
                });
              },
            ),
            InputField(
              label: 'Age',
              value: age.toString(),
              onIncrement: () {
                setState(() {
                  age++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (age > 0) age--;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              bmi == 0 ? 'BMI' : bmi.toStringAsFixed(1),
              style: TextStyle(fontSize: 35, color: Colors.blue),
            ),
            Text(
              bmiCategory,
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A0E21),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Lets Go', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final bool selected;
  final VoidCallback onTap;

  GenderButton({required this.gender, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: selected ? Color(0xFF0A0E21) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26),
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(gender == "Male" ? Icons.male : Icons.female, size: 80, color: selected ? Colors.white : Colors.black54),
              Text(gender, style: TextStyle(fontSize: 18, color: selected ? Colors.white : Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  InputField({required this.label, required this.value, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onDecrement,
            ),
            Text(value, style: TextStyle(fontSize: 30)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
