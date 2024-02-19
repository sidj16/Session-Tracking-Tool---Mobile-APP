import 'package:flutter/material.dart';
import 'package:session_tracking_tool/presentation/session_tracking_form/widgets/custom_checkbox_widget.dart';
import 'package:session_tracking_tool/presentation/session_tracking_form/widgets/custom_date_picker.dart';
import 'package:session_tracking_tool/presentation/session_tracking_form/widgets/custom_picture_upload_widget.dart';
import 'package:session_tracking_tool/presentation/session_tracking_form/widgets/custom_tff.dart';
import 'package:session_tracking_tool/presentation/session_tracking_form/widgets/dropdown_widget.dart';

class TeacherSelectionPage extends StatefulWidget {
  const TeacherSelectionPage({super.key});

  @override
  State<TeacherSelectionPage> createState() => _TeacherSelectionPageState();
}

String? _selectedCategory;
final List<String> _teacherCategory = [
  'Life Skilled Trained Teacher',
  'Others',
];

String? _selectedTeacher;
final List<String> _teacherNames = [
  'Teacher 1',
  'Teacher 2',
  'Teacher 3',
];

String? _selectedClass;
final List<String> _classNumber = [
  '6',
  '7',
  '8',
];

String? _selectSessionCode;
final List<String> _sessionCode = [
  'HSCCC Communication',
  'HSCSA Self Awareness',
];

class _TeacherSelectionPageState extends State<TeacherSelectionPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer:  Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child:
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.blue,
                            ),
                            height: 50,
                            width: width * 0.3,
                            child: const Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),)],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        // height: height * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
              width: width,
              child: const Center(
                  child: Text(
                'Session Tracking Tool',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  DropDownWidget(
                    value: _selectedCategory,
                    items: _teacherCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    fieldName: 'Teacher *',
                  ),
                  DropDownWidget(
                    value: _selectedTeacher,
                    items: _teacherNames,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedTeacher = newValue;
                      });
                    },
                    fieldName: 'Teacher Name and Emp ID *',
                  ),
                  DropDownWidget(
                    value: _selectedClass,
                    items: _classNumber,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedClass = newValue;
                      });
                    },
                    fieldName: 'Class *',
                  ),
                  const CheckboxListWidget(),
                  DropDownWidget(
                    value: _selectSessionCode,
                    items: _sessionCode,
                    onChanged: (newValue) {
                      setState(() {
                        _selectSessionCode = newValue;
                      });
                    },
                    fieldName: 'Session Code *',
                  ),
                  const CustomDatePickerWidget(
                    fieldName: 'Session Planned Date *',
                  ),
                  const CustomDatePickerWidget(
                    fieldName: 'Session Held Date *',
                  ),
                  const CustomTFF(
                    fieldName: 'Total Girls Enrolled in Class *',
                    keyBoardType: TextInputType.number,
                  ),
                  const CustomTFF(
                    fieldName: 'No. of girls attended the session headcount *',
                    keyBoardType: TextInputType.number,
                  ),
                  const CustomTFF(
                    fieldName: 'Total boys enrolled in the class *',
                    keyBoardType: TextInputType.number,
                  ),
                  const CustomTFF(
                    fieldName: 'No. of boys attended the session headcount *',
                    keyBoardType: TextInputType.number,
                  ),
                  const CustomTFF(
                    fieldName: 'No. of students who completed Magicsheets *',
                    keyBoardType: TextInputType.number,
                  ),
                  const CustomTFF(
                    fieldName: 'Feedback/Remarks (if any)',
                  ),


                SizedBox(height: 24, ),


                PictureUploadWidget(beforeUpload:  'Upload the photo of this session' , afterUpload: 'Photo Uploaded for this Session' ),


                SizedBox(height: 24, ),

                  
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(height: height * 0.1 , child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.blue),
                            ),
                            height: 50,
                            width: width * 0.3,
                            child: const Text(
                              'Discard',
                              style: TextStyle(),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.blue,
                            ),
                            height: 50,
                            width: width * 0.3,
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),),
    );
  }
}
