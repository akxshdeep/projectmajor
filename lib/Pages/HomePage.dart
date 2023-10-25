import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDEEE7),
      appBar: AppBar(
        backgroundColor: Color(0xFF458C6E),
        title: Text(
          "My ML Project",
          style: TextStyle(
            color: Color(0xFFDDEEE7),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.menu, // Hamburger (menu) icon
        //       color: Color(0xFFDDEEE7), // Icon color
        //     ),
        //     onPressed: () {
        //       // Handle the menu icon button's onPressed event here
        //       // You can implement your specific navigation or menu opening logic here
        //     },
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFCDF8E8),
          child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    "LOGO",
                    style: TextStyle(fontSize: 35, color: Color(0xFF458C6E)),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.translate,
                  color: Color(0xFF458C6E),
                ),
                title: Text("Languages",
                    style: TextStyle(fontSize: 20, color: Color(0xFF458C6E))),
                onTap: () {
                  // Add the functionality to handle the "Languages" selection here
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text("Sign Out",
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                onTap: () {
                  // Add the functionality to handle the "Languages" selection here
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add Image",
                style: TextStyle(
                  color: Color(0xFF458C6E),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                    // Add the functionality for the "Gallery" button here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16.0),
                    backgroundColor: Color(0xFFCDF8E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.photo_library, size: 48.0,color: Color(0xFF458C6E),),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 16.0, color: Color(0xFF458C6E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromCamera();
                    // Add the functionality for the "Camera" button here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCDF8E8),
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.camera_alt, size: 48.0, color: Color(0xFF458C6E),),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 16.0, color: Color(0xFF458C6E)),
                      ),
                    ],
                  ),
                ),

              ],

            ),
            const SizedBox(
              height: 20,
            ),
            // when you can add images and functionality is done
            _selectedImage != null
                ? Container(
              width: 100,  // Adjust the width as needed
              height: 100, // Adjust the height as needed
              child: Image.file(
                _selectedImage!,
                fit: BoxFit.cover, // You can adjust the fit as needed
              ),
            )
                : const Text("Please Add an Image"),

            // SizedBox(height: 16.0),
            CardWidget(
              "Card 1",
              "This is the content of Card 1",
              Color(0xFFCDF8E8),
            ),
            CardWidget(
              "Card 2",
              "This is the content of Card 2",
              Color(0xFFCDF8E8),
            ),

          ],
        ),
      ),
    );
  }
  Future _pickImageFromGallery() async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
if (returnedImage == null) return;
  setState(() {
    _selectedImage = File(returnedImage!.path);
  });
}
  Future _pickImageFromCamera() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String content;
  final Color cardColor;

  CardWidget(this.title, this.content, this.cardColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor, // Set the color of the card
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}



