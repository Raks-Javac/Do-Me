// import 'dart:io';

// import 'package:billbunch/src/core/utils/helper_functions/functions.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageSelector {
//   final ImagePicker _picker = ImagePicker();

//   Future<File?> pickImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image == null) {
//       return null;
//     }
//     return File(image.path);
//   }

//   void showImageSourceDialog(Function(File?) onImageSelected) {
//     showModalBottomSheet(
//       context: getAppContext(),
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Gallery'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   File? image = await pickImage(ImageSource.gallery);
//                   onImageSelected(image);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   File? image = await pickImage(ImageSource.camera);
//                   onImageSelected(image);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
