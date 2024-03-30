import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  String url =
      "https://firebasestorage.googleapis.com/v0/b/fb-practise-a21f2.appspot.com/o/images%2FPanda%E2%99%A1.jpeg?alt=media&token=a40c8419-614f-4607-9a5d-178a47fb3328";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Picker",
          style: TextStyle(color: Color.fromARGB(255, 38, 170, 12)),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(32.0), child: Container()),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightGreenAccent, Colors.lightGreen.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 280,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            final uniqueNameStamp =
                                DateTime.now().microsecondsSinceEpoch;
                            final ImagePicker picker = ImagePicker();
// Pick an image.
                            final XFile? pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedImage != null) {
                              final storageRef = FirebaseStorage.instance.ref();
                              Reference? imagesRef = storageRef.child("images");
                              final uploadref =
                                  imagesRef.child(uniqueNameStamp.toString());
                              await uploadref.putFile(File(pickedImage.path));
                              final downloadUrl =
                                  await uploadref.getDownloadURL();
                              url = downloadUrl;

                              setState(() {});
                            }
//
//                             // Pick singe image or video.
//                             final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
//                             final List<XFile> medias =
//                                 await picker.pickMultipleMedia();
                          },
                          icon: Icon(
                            Icons.upload,
                            size: 30,
                          )),
                      Text("Upload")
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            final uniqueNameStamp =
                                DateTime.now().microsecondsSinceEpoch;
                            XFile? pickedImage = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (pickedImage != null) {
                              final storageRef = FirebaseStorage.instance.ref();
                              Reference? imagesRef = storageRef.child("images");
                              final uploadref =
                                  imagesRef.child(uniqueNameStamp.toString());
                              await uploadref.putFile(File(pickedImage.path));
                              final downloadUrl =
                                  await uploadref.getDownloadURL();
                              url = downloadUrl;

                              setState(() {});
                            }
//                             // Pick singe image or video.
//                             final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
//                             final List<XFile> medias =
//                                 await picker.pickMultipleMedia();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                          )),
                      Text("Camera")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
