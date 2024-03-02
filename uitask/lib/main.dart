import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCartPage(),
    );
  }
}

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back arrow press
            Navigator.pop(context);
          },
        ),
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Handle refresh icon press
              // Add your refresh logic here
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 124, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          // Added SingleChildScrollView to handle scrolling
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white, // Change the color as needed
                        alignment: Alignment.center,
                        child: Text(
                          'Invoice',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white, // Change the color as needed
                        alignment: Alignment.center,
                        child: Text(
                          'History',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop Name:Temporary Route',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Route:TEMP 568794231',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              buildCustomBox('Lebanon Med', '45', '12', 'Rs35', 'Rs450'),
              buildCustomBox('Lebanon Sma', '45', '10', 'Rs25', 'Rs300'),
              buildCustomBox('Lebanon lar', '45', '11', 'Rs55', 'Rs475'),
              buildCustomBox('Chapati', '45', '0', 'Rs35', 'Rs450'),
              SizedBox(height: 2),
              buildTotalBox('Sub Total', 'Rs 240'),
              buildTotalBox('Discount', 'Rs 74'),
              buildTotalBox('VAT(5%)', 'Rs 54'),
              buildTotalBoxBold('Total', 'Rs 340'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle save button press
                      // Add your save logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Adjusted border radius
                      ),
                    ),
                    child: Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle generate button press
                      // Add your generate logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Adjusted border radius
                      ),
                    ),
                    child: Text('Generate'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomBox(
      String firstText, String box1, String box2, String box3, String box4) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 252, 252).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              firstText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 10), // Added spacing
          buildNumberBox(box1),
          SizedBox(width: 10), // Added spacing
          buildNumberBox(box2),
          SizedBox(width: 10), // Added spacing
          buildNumberBox(box3, isSameColor: true),
          SizedBox(width: 10), // Added spacing
          buildNumberBox(box4, isBlue: true),
        ],
      ),
    );
  }

  Widget buildNumberBox(String content,
      {bool isBlue = false, bool isSameColor = false}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isBlue
            ? Colors.blue
            : (isSameColor ? Colors.grey.shade100 : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isBlue ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget buildTotalBox(String leftText, String rightText) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 252, 252).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              leftText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            rightText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalBoxBold(String leftText, String rightText) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 252, 252).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              leftText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            rightText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Changed the color to black
            ),
          ),
        ],
      ),
    );
  }
}
