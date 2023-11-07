import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

enum Gender { pria, wanita }

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  Gender? selectedGender;
  double bmi = 0;
  double bmr = 0;
  double carbRequirement = 0;
  double fatRequirement = 0;
  double proteinRequirement = 0;

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    int age = int.parse(ageController.text);

    setState(() {
      double heightInMeter = height / 100;
      bmi = weight / (heightInMeter * heightInMeter);
      if (selectedGender == Gender.pria) {
        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }
      carbRequirement = 0.5 * bmr;
      fatRequirement = 0.25 * bmr;
      proteinRequirement = 0.25 * bmr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI & Kebutuhan Nutrisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: Gender.pria,
                  groupValue: selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                Text('Pria'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: Gender.wanita,
                  groupValue: selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                Text('Wanita'),
              ],
            ),
            TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat Badan (Kg)'),
            ),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi Badan (Cm)'),
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Usia'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Lihat Hasil'),
            ),
            SizedBox(height: 20),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Hasil perhitungan BMR:'),
                    subtitle: Text('${bmr.toStringAsFixed(2)} Kkal'),
                  ),
                  ListTile(
                    title: Text('Kebutuhan Karbohidrat sebanyak'),
                    subtitle: Text('${carbRequirement.toStringAsFixed(2)} gram'),
                  ),
                  ListTile(
                    title: Text('Kebutuhan Lemak sebanyak'),
                    subtitle: Text('${fatRequirement.toStringAsFixed(2)} gram'),
                  ),
                  ListTile(
                    title: Text('Kebutuhan Protein sebanyak'),
                    subtitle:
                        Text('${proteinRequirement.toStringAsFixed(2)} gram'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}