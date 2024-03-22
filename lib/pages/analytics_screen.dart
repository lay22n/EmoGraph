import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmotionalAnalyticsScreen extends StatefulWidget {
  @override
  _EmotionalAnalyticsScreenState createState() => _EmotionalAnalyticsScreenState();
}

class _EmotionalAnalyticsScreenState extends State<EmotionalAnalyticsScreen> {
  List<bool> _selections = [true, false, false]; // Weekly is selected by default
  DateTime selectedDate = DateTime.now(); // Current selected date for the label

  void _decrementMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);
    });
  }

  void _incrementMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Emotional Analytics and Insights',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            
            //  // Add space between the toggle buttons and logout button
            TextButton(
              onPressed: () {
                // Implement logout functionality
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFBC6C25),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: 
      Container(
                width: 1450.0,
          height: 900.0,
          decoration: BoxDecoration(
            
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'BGgreen.PNG',
              ).image,
            ),
          ),
          child:
      SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: _decrementMonth,
              ),
              Text(
                "${DateFormat('MMMM yyyy').format(selectedDate)}", // Using DateFormat from the intl package
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: _incrementMonth,
              ),
                Expanded(
                    flex: 1, // This will allow the search bar to shrink/expand as needed
  child: Center(
    child: Container(
      width: 400, // Fixed width of the search bar
      
                    child: TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        
                      hintText: 'Search for an employee here',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFBFBABA),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(44.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF283618),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(44.0),
                        ),
                        
                        filled: true,
                        fillColor: const Color(0xFFBFBABA),
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 28.0,
                        ),
                      ),
                    ),

                  ),
                  ),
                  ), 
                  Container(
              height: 35, // Adjust the height as needed
              child:
            ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.white, // Selected text color
              color: Color(0xDDA15E).withOpacity(0.75), // Not selected text color
              fillColor: Color(0xFFBC6C25), // Background color when selected
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Weekly'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Monthly'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Yearly'),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                // Update the selection state
                // Also trigger any other changes you need
              },
            ),
            ), 
SizedBox(width: 180),
            ],
          ),
              
              
              // ... Text content similar to the uploaded image
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    SizedBox(
                      width: 850,
                      child:
                    Text(
                    'The Emotional Analytics Report provides an overview of the emotional well-being of your employees. By analyzing various emotional metrics, we aim to gain insights into the emotional state ofour workforce and provide recommendations for improving overall employee morale and satisfaction.',
                     style: TextStyle(
                        fontSize: 15,
                        
                      ),
                    ), ),
                    SizedBox(height: 20,),
                    Text(
                      'Key Statistics:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 16),
                    Text(
                      'Overall Employee Satisfaction:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 16),
                    Text(
                      'Employee satisfaction rating: 65%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFBC6C25),
                        
                      ),
                    ),
                     SizedBox(height: 10),
                    Text(
                      'Change in satisfaction compared to the previous quarter: +5% Change',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFBC6C25),
                        
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Emotional Well-being Metrics:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    Text(
                      'Average happiness level:',
                       style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF606C38),
                        
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
    Tooltip(
      message: 'Average happiness: 75%', // Adjust message as needed
      child: Image.asset(
        'smileyface.png', // Provide path to colored image 1
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average happiness: 75%', // Adjust message as needed
      child: Image.asset(
        'smileyface.png', // Provide path to colored image 2
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average happiness: 75%', // Adjust message as needed
      child: Image.asset(
        'smileyface.png', // Provide path to colored image 3
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average happiness: 75%', // Adjust message as needed
      child: Image.asset(
        'smileyfaceBW.png', // Provide path to black and white image
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
        // color: Colors.grey, // Adjust the color of the black and white image
      ),
    ),
  ],
),
                    SizedBox(height: 10),
                    
                    Text(
                      'Average stress level:',
                       style: TextStyle(
                        fontSize: 18,
                        color: Color(0xDDDD8282),
                        
                      ),
                    ),
                    SizedBox(height: 10),
             Row(
                      children: [       
    Tooltip(
      message: 'Average stress: 25%', // Adjust message as needed
      child: Image.asset(
        'sad.png', // Provide path to colored image 1
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average stress: 25%', // Adjust message as needed
      child: Image.asset(
        'sadBW.png', // Provide path to colored image 2
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average stress: 25%', // Adjust message as needed
      child: Image.asset(
        'sadBW.png', // Provide path to colored image 3
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
      ),
    ),
    Tooltip(
      message: 'Average stress: 25%', // Adjust message as needed
      child: Image.asset(
        'sadBW.png', // Provide path to black and white image
        width: 40, // Adjust the width as needed
        height: 40, // Adjust the height as needed
        // color: Colors.grey, // Adjust the color of the black and white image
      ),
    ),
  ],
),
                    SizedBox(height: 16),
                    
                    Text(
                      'Emotional Insights:',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                      
                      children: [
                    Text(
                      '1. Happiness Analysis:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF606C38),
                        
                      ),
                    ),
                    SizedBox(height: 10),
                    
                 GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Happiness Analysis'),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
            child: Text(
              'The average happiness score remains relatively stable compared to the previous quarter. However, it is essential to continue monitoring this metric, as small fluctuations could impact overall morale.',
              textAlign: TextAlign.left,
              style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF606C38),
                        
                      ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  },
  child: Image.asset(
    'Stable.PNG',
    width: 200, // Adjust the width as needed
    height: 200, // Adjust the height as needed
  ),
),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      
                      children: [
                    Text(
                      '2. Stress Analysis:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xDDDD8282),
                        
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Stress Analysis'),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
            child: Text(
              'The average stress level has increased slightly compared to the previous quarter. This could be attributed to various factors such as workload, or external pressures. Addressing stressors and promoting stress management techniques is crucial.',
              textAlign: TextAlign.left,
              style: TextStyle(
                        fontSize: 18,
                        color: Color(0xDDDD8282),
                        
                      ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  },
  child: Image.asset(
    'rising.PNG',
    width: 200, // Adjust the width as needed
    height: 200, // Adjust the height as needed
  ),
),
                      ],
                    ),
                      ],
                    ),
                    
                    SizedBox(height: 16),
                    Text(
                      'Recommendations for Improving Employees’ Emotions:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row (
                      children: [
                    Image.asset(
        'stressManagment.PNG', // Provide path to colored image 3
        width: 80, // Adjust the width as needed
        height: 80, // Adjust the height as needed
      ),
      SizedBox(width: 10),
                    Text(
                      '1. Implement stress management programs, workshops, or resources to help employees cope with workplace stress effectively.',
                       style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFBC6C25),
                        
                      ),
                    ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row (
                      children: [
                    Image.asset(
        'employeeDevelopment.jpg', // Provide path to colored image 3
        width: 80, // Adjust the width as needed
        height: 80, // Adjust the height as needed
      ),
      SizedBox(width: 10),
                    Text(
                      '2. Professional Development: Invest in employee growth and development opportunities to increase engagement and job satisfaction.',
                       style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFBC6C25),
                        
                      ),
                    ),
                      ],
                    ),
                    // Add any other content here...
                  ],
                ),
              ),
              // Add any additional UI elements that are part of your page
            ],
          ),
        ),
      ),
      ),
    );
  }
}
