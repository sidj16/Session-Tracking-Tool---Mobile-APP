import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureUploadWidget extends StatefulWidget {
  final String beforeUpload;
  final String afterUpload;

  const PictureUploadWidget({
    Key? key,
    required this.beforeUpload,
    required this.afterUpload,
  }) : super(key: key);

  @override
  _PictureUploadWidgetState createState() => _PictureUploadWidgetState();
}

class _PictureUploadWidgetState extends State<PictureUploadWidget> {
  File? _imageFile;
  bool _uploaded = false;

  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _uploaded = true;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.camera_alt_rounded),
                    title: Text('Take A Picture', style: TextStyle(fontSize: 16, color: Colors.grey),),
                    onTap: () {
                      _getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  Divider(color: Colors.grey.shade100),
                  ListTile(
                    leading: Icon(Icons.filter),
                    title: Text('Upload From Gallery',style: TextStyle(fontSize: 16, color: Colors.grey),),
                    onTap: () {
                      _getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade300 ),
          color: _uploaded ? Colors.blue : Colors.grey.shade50,
        ),
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_uploaded)
              Container(
                height: 36,
                width: 36,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.credit_card_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              )
            else
              Container(
                height: 36,
                width: 36,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.credit_card_rounded,
                  color: Colors.grey,
                  size: 28,
                ),
              ),
            const SizedBox(
              width: 16,
            ),
            if (_uploaded)
              Expanded(
                child: Text(
                  widget.afterUpload,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            else
              Expanded(
                child: Text(
                  widget.beforeUpload,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            if (_uploaded)
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              )
            else
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.upload ,
                  color: Colors.grey,
                ),
              )
          ],
        ),
      ),
    );
  }
}
