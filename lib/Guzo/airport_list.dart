import 'package:flutter/material.dart';

class AirportList extends StatefulWidget {
  const AirportList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _GuzoGoHomeState createState() => _GuzoGoHomeState();
}

class _GuzoGoHomeState extends State<AirportList> {
  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'China',
    'Australia',
    'India',
    'Brazil',
    'Mexico',
    'Italy',
    'Spain',
    'South Korea',
    'Russia',
    'Turkey',
    'Netherlands',
    'Switzerland',
    'Sweden',
    'Norway',
  ];

  List<String> filteredCountries = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredCountries = countries;
    super.initState();
  }

  void filterCountries(String query) {
    List<String> _filteredCountries = [];
    if (query.isNotEmpty) {
      _filteredCountries = countries
          .where((country) =>
          country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredCountries = countries;
    }
    setState(() {
      filteredCountries = _filteredCountries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Select Airport',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 150,),
                    Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0, right: 10),
                      child: Container(
                        height: 40,
                        width: 340,
                        child: TextField(
                          controller: searchController,
                          onChanged: filterCountries,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon with gray color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                              borderSide: BorderSide.none, // Transparent border
                            ),
                            filled: true, // Filled background
                            fillColor: Colors.grey[200], // Gray interior color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Container(
                  height: 1,
                  width: 360,// Height of the line
                  color: Colors.grey.shade300, // Color of the line
                ),
                SizedBox(height: 5), // Added SizedBox for spacing
                const Padding(
                  padding: EdgeInsets.only(right: 220.0),
                  child: Text(
                    'Direct Airport',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),



      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: filteredCountries.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Transform.rotate(
                angle: 220 * 3.1415926535 / 180,
                child: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.black,

                ),
              ), // Leading icon
              title: Text(filteredCountries[index]),
              onTap: () {
                // Handle item tap
              },
            );

          },
        ),
      ),
    );
  }
}