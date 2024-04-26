import 'package:flutter/material.dart';
import 'airport_list.dart';
import 'bottom_sheet.dart';

class GuzoGoHome extends StatefulWidget {
  const GuzoGoHome({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _GuzoGoHomeState createState() => _GuzoGoHomeState();
}

class _GuzoGoHomeState extends State<GuzoGoHome> {
  int _selectedOption = 1;
  int _count = 0;
  String _selectedCabinClass = 'Economy'; // Default cabin class

  void _navigateToAirportList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AirportList(title: '')),
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PassengerBottomSheet(
          count: _count,
          increment: _increment,
          decrement: _decrement,
        );
      },
    );
  }

  void _showCabinClassBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CabinClassBottomSheet(
          onCabinClassSelected: (selectedCabinClass) {
            setState(() {
              _selectedCabinClass = selectedCabinClass; // Update selected cabin class
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              'assets/images/plane1.jpg',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1F1E62).withOpacity(0.9),
                  const Color(0xFF000D41).withOpacity(0.8),
                  const Color(0xFF000D41).withOpacity(0.8),
                  const Color(0xFF1F1E62).withOpacity(0.9),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _buildHeader(),
                  SizedBox(height: 10),
                  _buildSelectionButtons(),
                  const SizedBox(height: 10),
                  _buildFromToSection(),
                  SizedBox(height: 50),
                  _buildSearchFlightsButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 150),
              child: Image.asset(
                'assets/images/guzo.png',
                width: 90,
                height: 90,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 60),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.grey,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 340,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOption = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedOption == 1 ? Color(0xFF1F1E62) : Colors.white,
                      backgroundColor: _selectedOption == 1 ? Colors.white : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Return'),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOption = 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedOption == 2 ? Color(0xFF1F1E62) : Colors.white,
                      backgroundColor: _selectedOption == 2 ? Colors.white : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('One-way'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFromToSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'From',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToAirportList(context),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Text(
                'Addis Ababa',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Bole International Airport',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Column(
                children: [
                  Transform.rotate(
                    angle: 90 * 3.1415926535 / 180,
                    child: const Icon(
                      Icons.airplanemode_active,
                      color: Colors.black,
                      size: 8,
                    ),
                  ),
                  Transform.rotate(
                    angle: 270 * 3.1415926535 / 180,
                    child: const Icon(
                      Icons.airplanemode_active,
                      color: Colors.black,
                      size: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'selected destination',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchFlightsButton() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 338,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    Text('Departure date'),
                                    Row(
                                      children: [
                                        Text(
                                          '25',
                                          style: TextStyle(fontSize: 45, color: Color(0xFF1F1E62)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0, left: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                'May',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F1E62)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 8.0),
                                                child: Text('Friday'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    Text('Return date'),
                                    Row(
                                      children: [
                                        Text(
                                          '25',
                                          style: TextStyle(fontSize: 45, color: Color(0xFF1F1E62)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0, left: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                'June',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F1E62)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 8.0),
                                                child: Text('Thursday'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 70, top: 16),
                            child: Column(
                              children: [
                                Text('Cabin Class'),
                                GestureDetector(
                                  onTap: () {
                                    _showCabinClassBottomSheet(context); // Show cabin class selection
                                  },
                                  child: Text('$_selectedCabinClass',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F1E62))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40, top: 16),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: const Text('Passengers'),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.man,
                                        color: Colors.black54,
                                        size: 24,
                                      ),
                                      Text('$_count'),
                                      SizedBox(width: 15,),
                                      const Icon(
                                        Icons.man_rounded,
                                        color: Colors.black54,
                                        size: 18,
                                      ),
                                      Text('$_count'),
                                      SizedBox(width: 14,),
                                      const Icon(
                                        Icons.woman_outlined,
                                        color: Colors.black54,
                                        size: 14,
                                      ),
                                      Text('$_count')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                backgroundColor: const Color(0xFFF1C933),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Search Flights"),
            ),
          ],
        ),
      ),
    );
  }
}
