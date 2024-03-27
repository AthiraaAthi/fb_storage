import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

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
                  //image: DecorationImage(image: FileImage()),
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20)),
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
                            final ImagePicker picker = ImagePicker();
// Pick an image.
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            // Pick singe image or video.
                            final XFile? media = await picker.pickMedia();
// Pick multiple images and videos.
                            final List<XFile> medias =
                                await picker.pickMultipleMedia();
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
                            final ImagePicker picker = ImagePicker();
                            // Capture a photo.
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            // Pick singe image or video.
                            final XFile? media = await picker.pickMedia();
// Pick multiple images and videos.
                            final List<XFile> medias =
                                await picker.pickMultipleMedia();
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
