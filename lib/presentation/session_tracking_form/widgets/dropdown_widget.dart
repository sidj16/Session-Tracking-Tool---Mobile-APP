import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String fieldName;

  const DropDownWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged, required this.fieldName,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

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
        DropdownButtonFormField<String>(
          
          value: widget.value,
          decoration: const InputDecoration(
            border: OutlineInputBorder( ),
          ),
          onChanged: widget.onChanged,
          items: widget.items.map((teacherName) {
            return DropdownMenuItem<String>(
              value: teacherName,
              child: Text(teacherName),
            );
          }).toList(),
        ),
      ],
    );
  }
}
