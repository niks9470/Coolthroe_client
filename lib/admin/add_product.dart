import 'dart:io';

import 'package:coolthrow_client/services/database.dart';
import 'package:coolthrow_client/widget/widget_support.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> fooditems = ["clothing", "Stationary", "Faishon", "Hygine","Food",];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController brandController = TextEditingController();


  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {});
  }

  uplodeItem() async {
    if (selectedImage != null &&
        nameController.text != "" &&
        priceController.text != "" &&
        detailsController.text != ""&&
    brandController.text!=""
    ) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Details": detailsController.text,
        "Brand":brandController.text
      };
      await DatabaseMethods().addProductItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Food Item has been added Successfully",
              style: TextStyle(fontSize: 18.0),
            )));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xff373866),
            )),
        centerTitle: true,
        title: Text(
          "Add Items",
          style: AppWidget.headlineTextFieldStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Uplode the Item Picture",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              selectedImage == null
                  ? GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
                  : Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Items Name",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item name",
                      hintStyle: AppWidget.lightTextFieldStyle()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Items price",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Item Price",
                      hintStyle: AppWidget.lightTextFieldStyle()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Items Details",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 6,
                  controller: detailsController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Item Details",
                      hintStyle: AppWidget.lightTextFieldStyle()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Brand",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: brandController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Item brand",
                      hintStyle: AppWidget.lightTextFieldStyle()),
                ),
              ),SizedBox(height: 20,),
              Text(
                "Select categories",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: fooditems
                          .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.black),
                          )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Category"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: value,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  uplodeItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
