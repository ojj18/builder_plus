// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unnecessary_new, deprecated_member_use, avoid_print

import 'dart:io';

import 'package:builder_plus/Common/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImagePickerButton extends StatefulWidget {
  String? initialFile;
  ValueChanged<String>? getSelectedValue;
  ImagePickerButton({Key? key, this.initialFile, this.getSelectedValue})
      : super(key: key);

  @override
  State<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  String? _image;
  final picker = ImagePicker();
  File? varName;

  @override
  void initState() {
    // print('initimgBB------->$_image');
    _image = widget.initialFile;
    // print('initimgAA------->$_image');
    super.initState();
  }

  // @override
  // void didChangeDependencies() async {
  //   if (_image != null) {
  //     varName = await _getImageFile(_image!);

  //     // print('-------------->$varName');
  //   }
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  void imagepickerbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          Navigator.of(context).pop;
          return SafeArea(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camera'),
                  onTap: () => getImage(),
                ),
                new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text('Gallery'),
                  onTap: () => getImageGallery(),
                ),
              ],
            ),
          );
        });
  }

  Future getImage() async {
    try {
      final pickedFile = await picker.getImage(
          source: ImageSource.camera,
      
          imageQuality: 50);

      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await _cropImage(imageFile: img);
        setState(() {
          _image = img!.path;
          // widget.getSelectedValue!(_image!);
          Navigator.of(context).pop();
        });
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Future getImageGallery() async {
    try {
      final pickedFile = await picker.getImage(
          source: ImageSource.gallery,
          maxHeight: 1000,
          maxWidth: 4000,
          imageQuality: 50);

      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await _cropImage(imageFile: img);
        setState(() {
          _image = img!.path;
          // widget.getSelectedValue!(_image!);
          Navigator.of(context).pop();
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Color.fromARGB(240, 148, 6, 6),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
              const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );

    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  // _getImageFile(String path) async {
  //   if (path.contains('https') || path.contains('http')) {
  //     print('path-------------->$path');
  //     return await urlToFile(path);
  //   } else {
  //     print('path-------------->$path');
  //     return File(path);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        imagepickerbottomsheet();
      }),
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.camera_alt,
          color: cardBackgroundColor,
          size: 40,
        ),
      ),
    );
  }
}
