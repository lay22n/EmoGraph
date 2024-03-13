
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class GraphicalRepresentationScreen extends StatefulWidget {
  @override
  _GraphicalRepresentationScreenState createState() => _GraphicalRepresentationScreenState();
}

class _GraphicalRepresentationScreenState extends State<GraphicalRepresentationScreen> {
  List<bool> _selections = [true, false, false]; // Weekly is selected by default
   List<FlSpot> lineChartDataPoints = []; // Initialized as an empty list
  List<PieChartSectionData> pieChartDataSections = []; // Initialized as an empty list
int _currentIndex = 0; // 0 for Weekly, 1 for Monthly, 2 for Yearly
// Current selected date for the label
  DateTime selectedDate = DateTime.now();

  // Function to decrement the date by one month
  void _decrementMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      );
    });
    // You would also refresh your data here based on the new date
  }

  // Function to increment the date by one month
  void _incrementMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      );
    });
    // You would also refresh your data here based on the new date
  }

String _getBottomTitle(double value) {
  if (_currentIndex == 0) { // Weekly
    const daysOfWeek = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    return daysOfWeek[value.toInt() % daysOfWeek.length];
  } else if (_currentIndex == 1) { // Monthly
    return 'Week ${value.toInt() + 1}';
  } else if (_currentIndex == 2) { // Yearly
    const monthsOfYear = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return monthsOfYear[value.toInt() % monthsOfYear.length];
  }
  return '';
}

  void initState() {
    super.initState();
    _initData(); // Initial data load
  }
  void _initData() {
    // Initialize your chart data here with default or initial values
    lineChartDataPoints = [
      FlSpot(0, 3), FlSpot(1, 2.5), // ... initial data points for the line chart
    ];
    pieChartDataSections = [
      PieChartSectionData(value: 35, title: '35%', color: Color(0xDDDD8282).withOpacity(0.75), radius: 50),
      PieChartSectionData(value: 25, title: '25%', color: Color(0xFF7AC7FF), radius: 50),
      PieChartSectionData(value: 40, title: '40%', color: Color(0xFFCFE1B9), radius: 50),
    ];
  }

void _updateLineChartData(int index) {
  if (index == 0) { // Weekly
    lineChartDataPoints = [
      FlSpot(0, 1), FlSpot(1, 3), FlSpot(2, 2), FlSpot(3, 5), FlSpot(4, 3.5), FlSpot(5, 4), FlSpot(6, 3),
    ];
  } else if (index == 1) { // Monthly
    lineChartDataPoints = [
      FlSpot(0, 2.5), FlSpot(1, 2), FlSpot(2, 1.5), FlSpot(3, 3),
    ];
  } else if (index == 2) { // Yearly
    lineChartDataPoints = [
      FlSpot(0, 3.5), FlSpot(1, 3), FlSpot(2, 2.5), FlSpot(3, 4), FlSpot(4, 3.5), FlSpot(5, 4.5), FlSpot(6, 4), FlSpot(7, 4.5), FlSpot(8, 5), FlSpot(9, 4.5), FlSpot(10, 4), FlSpot(11, 4.5),
    ];
  }

  setState(() {
    // This will trigger the widget to rebuild with the new data for the LineChart
  });
}


void _updatePieChartData(int index) {
  if (index == 0) { // Weekly
    pieChartDataSections = [
      PieChartSectionData(value: 20, title: '20%', color: Color(0xDDDD8282).withOpacity(0.75), radius: 50),
      PieChartSectionData(value: 30, title: '30%', color: Color(0xFF7AC7FF), radius: 50),
      PieChartSectionData(value: 50, title: '50%', color: Color(0xFFCFE1B9), radius: 50),
    ];
  } else if (index == 1) { // Monthly
    pieChartDataSections = [
      PieChartSectionData(value: 25, title: '25%', color: Color(0xDDDD8282).withOpacity(0.75), radius: 50),
      PieChartSectionData(value: 35, title: '35%', color: Color(0xFF7AC7FF), radius: 50),
      PieChartSectionData(value: 40, title: '40%', color: Color(0xFFCFE1B9), radius: 50),
    ];
  } else if (index == 2) { // Yearly
    pieChartDataSections = [
      PieChartSectionData(value: 15, title: '15%', color: Color(0xDDDD8282).withOpacity(0.75), radius: 50),
      PieChartSectionData(value: 25, title: '25%', color:Color(0xFF7AC7FF), radius: 50),
      PieChartSectionData(value: 60, title: '60%', color: Color(0xFFCFE1B9), radius: 50),
    ];
  }

  setState(() {
    // This will trigger the widget to rebuild with the new data for the PieChart
  });
}


void _updateSelection(int index) {
  setState(() {
    for (int i = 0; i < _selections.length; i++) {
      _selections[i] = i == index;
    }
    _currentIndex = index;
    // Update charts
    _updateLineChartData(index);
    _updatePieChartData(index);
  });
}


  LineChartData _mainChartData() {
      double minX = 0;
  double maxX;

  switch (_currentIndex) {
    case 0: // Weekly
      maxX = 6; // 0-6 for seven days of the week
      break;
    case 1: // Monthly
      maxX = 3; // 0-3 for four weeks of the month
      break;
    case 2: // Yearly
      maxX = 11; // 0-11 for twelve months of the year
      break;
    default:
      maxX = 11; // Default to yearly view if unsure
  }

  return LineChartData(
    
    gridData: FlGridData(show: false),
     titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22, // Adjust as needed for label spacing
        getTitles: (value) {
          return _getBottomTitle(value);
        },
      ),
    ),
    borderData: FlBorderData(show: false),
    minX: minX,
    maxX: maxX,
    minY: 0,
    maxY: 6, // Example Y axis value, set according to your data
    lineBarsData: [
      LineChartBarData(
        spots: 
          lineChartDataPoints, // Use dynamic data here
        
        isCurved: true,
        colors: [Colors.redAccent],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      ),
    ],
  );
}
PieChartData _mainPieData() {
  return PieChartData(
    sections: pieChartDataSections, // Use dynamic data here
    centerSpaceRadius: 48,
    sectionsSpace: 7,
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Graphical Representation',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(), // Add spacer to push buttons to the right edge of the screen
            Container(
              height: 35, // Adjust the height as needed
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white, // Selected text color
                color: Color(0xDDA15E).withOpacity(0.75), // Not selected text color
                fillColor: Color(0xFFBC6C25), // Background color when selected
                  children: <Widget>[
                    
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Weekly',
                    ),
                  ),
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Monthly',
                    ),
                  ),
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Yearly',
                    ),
                  ),
                    ],
                    isSelected: _selections,
                    onPressed: (int index) {
                      _updateSelection(index);
                    }
              ),
            ),
            SizedBox(width: 60), // Add space between the toggle buttons and logout button
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              container(
                width: 1450.0,
          height: 900.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.jpg',
              ).image,
            ),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                  SizedBox(width: 20), // Provide some spacing
                 
                ],
              ),
              SizedBox(height: 20), // Provide spacing between elements
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
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
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
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(44.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
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
                      style: FlutterFlowTheme.of(context).titleMedium,
                      cursorColor: const Color(0xFF283618),
                      validator:
                          _model.textController1Validator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                      ],
                    ),

                  ),
                  ),
                  ),    
            ],
          ),
           SizedBox(height: 30), // Provide spacing between elements
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                height: 50,
                width: 300,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xDDDD8282).withOpacity(0.60),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'WARNING: consistent negative emotions in the last month!',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 30),

                   
                SizedBox(
                   height: 50,
                width: 300,
                     child: ElevatedButton(
                      
                      onPressed: () {
                        // TODO: Navigate to the tips page or display the tips
                      },
                      child: Text('Check out these ideas to improve employee emotions!'),
                      style: ElevatedButton.styleFrom(
                        
                        primary: Color(0xFFCFE1B9), // Background color
                        onPrimary: Colors.black, // Text color
                      ),
                    ),
              ),
            ],
          ),
          SizedBox(height: 40), // Provide spacing between elements
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Container for Line Chart
                  Expanded(
                    child: Container(
                      height: 200,
                      child: LineChart(_mainChartData()),
                    ),
                  ),
                  SizedBox(width: 20), // Space between the charts
                  // Container for Pie Chart
                  Expanded(
                    child: Container(
                      height: 200,
                      child: PieChart(_mainPieData()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicatorCircle(Color(0xFFCFE1B9), 'Happy'),
                  SizedBox(width: 20),
                  _buildIndicatorCircle(Color(0xFF7AC7FF), 'Neutral'),
                  SizedBox(width: 20),
                  _buildIndicatorCircle(Color(0xDDDD8282), 'Sad'),
                ],
              ),
            ),
              SizedBox(height: 20),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildIndicatorCircle(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }