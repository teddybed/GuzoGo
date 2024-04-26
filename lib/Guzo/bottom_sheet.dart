import 'package:flutter/material.dart';

class PassengerBottomSheet extends StatelessWidget {
  final int count;
  final void Function() increment;
  final void Function() decrement;

  const PassengerBottomSheet({
    Key? key,
    required this.count,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Passenger',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 100),
                Text('Cancel'),
                SizedBox(width: 10),
                Text(
                  'Done',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Adult'),
                SizedBox(width: 190),
                Material(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: decrement,
                        icon: Icon(Icons.remove),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 20.0),
                Material(
                  color: Colors.white.withOpacity(0.5),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: increment,
                        icon: Icon(Icons.add),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Children 2-12 years'),
                SizedBox(width: 100),
                Material(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: decrement,
                        icon: Icon(Icons.remove),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 20.0),
                Material(
                  color: Colors.white.withOpacity(0.5),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: increment,
                        icon: Icon(Icons.add),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Infant <2 Years'),
                SizedBox(width: 130),
                Material(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: decrement,
                        icon: Icon(Icons.remove),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 20.0),
                Material(
                  color: Colors.white.withOpacity(0.5),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: increment,
                        icon: Icon(Icons.add),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class CabinClassBottomSheet extends StatefulWidget {
  final void Function(String) onCabinClassSelected;

  const CabinClassBottomSheet({
    Key? key,
    required this.onCabinClassSelected,
  }) : super(key: key);

  @override
  _CabinClassBottomSheetState createState() => _CabinClassBottomSheetState();
}

class _CabinClassBottomSheetState extends State<CabinClassBottomSheet> {
  String? _selectedCabinClass;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Cabin Class',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),
          _buildCabinClassOption('Economy'),Divider(),
          SizedBox(height: 10),
          _buildCabinClassOption('Business'),Divider(),
          SizedBox(height: 10),
          _buildCabinClassOption('First'),
        ],
      ),
    );
  }

  Widget _buildCabinClassOption(String cabinClass) {
    bool isSelected = cabinClass == _selectedCabinClass;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCabinClass = cabinClass;
        });

        // Automatically trigger the 'Done' button functionality upon selection
        widget.onCabinClassSelected(cabinClass);
        Navigator.pop(context); // Close the bottom sheet
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              cabinClass,
              style: TextStyle(
                fontSize: 16,

                color: isSelected ? Color(0xFF1F1E62) : Colors.black,
                fontWeight:  FontWeight.bold ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
