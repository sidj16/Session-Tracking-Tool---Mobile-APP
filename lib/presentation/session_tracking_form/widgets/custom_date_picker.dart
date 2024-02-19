
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({super.key, required this.fieldName});

  final String fieldName;

  @override
  _CustomDatePickerWidgetState createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  DateTime? _selectedDate;

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                  SizedBox(
                    height: 24,
                  ),
        Text( widget.fieldName ),
        SizedBox(
                    height: 6,
                  ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 58,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        
                Text(
                  _selectedDate != null 
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                      : '',
                  style: TextStyle(fontSize: 18)
                ),
                const Icon(
                  Icons.date_range_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          onTap: () {
            _showDatePicker(context);
          },
        ),
      ],
    );
  }
}
