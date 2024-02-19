import 'package:flutter/material.dart';

class CheckboxListWidget extends StatefulWidget {
  const CheckboxListWidget({Key? key}) : super(key: key);

  @override
  _CheckboxListWidgetState createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Section',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String letter in ['A', 'B', 'C', 'D', 'E', 'F', 'Other', 'NA'])
                CheckboxListTile(
                  side: BorderSide(color: Colors.black54),
                  value: selectedValue == letter,
                  contentPadding: EdgeInsets.zero,
                  title: Text(letter, style: const TextStyle(fontSize: 18),),
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedValue = letter;
                      } else {
                        selectedValue = null;
                      }
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

