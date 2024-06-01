import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProfileDetailsPage extends StatefulWidget {
  @override
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  DateTime selectedDate = DateTime.now();
  bool isDatePickerVisible = false;

  void toggleDatePickerVisibility() {
    setState(() {
      isDatePickerVisible = !isDatePickerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          isDatePickerVisible
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: TextButton(
                    onPressed: () {
                      toggleDatePickerVisibility();
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile details',
                    style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please use your real informations',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Image.asset(
                    'images/Logo.png',
                    height: 100,
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: toggleDatePickerVisibility,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8),
                        Text('Choose birthday date'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                      disabledBackgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Action pour le bouton "Confirm"
                    },
                    child: Text('Confirm'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Couleur de fond du bouton
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: isDatePickerVisible ? 0 : -400,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Birthday',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedDate = DateTime(selectedDate.year - 1, selectedDate.month, selectedDate.day);
                          });
                        },
                        icon: Icon(Icons.arrow_left, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Column(
                          children: [
                            Text(
                              DateFormat.y().format(selectedDate),
                              style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.MMMM().format(selectedDate),
                              style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              selectedDate.day.toString(),
                              style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedDate = DateTime(selectedDate.year + 1, selectedDate.month, selectedDate.day);
                          });
                        },
                        icon: Icon(Icons.arrow_right, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: toggleDatePickerVisibility,
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Couleur de fond du bouton
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isAfter(DateTime.now()) ? DateTime.now() : selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red,
            secondaryHeaderColor: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.red),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}