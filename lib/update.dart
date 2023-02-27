import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';
import 'modal.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var key1 =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    TextEditingController txtname= TextEditingController(text: modallist[ind].Name);
    TextEditingController txtnum= TextEditingController(text: modallist[ind].Num);
    TextEditingController txtweb= TextEditingController(text: modallist[ind].web);
    TextEditingController txtemail= TextEditingController(text: modallist[ind].email);
    String Path="${modallist[ind].img}";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("New contact"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if(key1.currentState!.validate())
                        {
                          Modal m1 =Modal(
                            Name: txtname.text,
                            email: txtemail.text,
                            Num: txtnum.text,
                            web: txtweb.text,
                            img: Path,
                          );
                          setState(() {
                            modallist[ind]=m1;
                            Navigator.pop(context);
                          });
                        }
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: key1,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() async {
                      ImagePicker img = ImagePicker();
                      XFile? xfile =
                      await img.pickImage(source: ImageSource.gallery);
                      setState(() {
                        Path = xfile!.path;
                      });
                    });
                  },
                  child: Container(
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: (Path.isEmpty)
                        ? Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.grey.shade900, size: 65)
                        : CircleAvatar(
                        backgroundImage: FileImage(File(Path)),
                        maxRadius: 62.5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Box(txtname, 'Name'),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.length!=10)
                    {
                      return 'Enter the valid number';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  controller: txtnum,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Number',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Box(txtemail, 'Email'),
                SizedBox(
                  height: 10,
                ),
                Box(txtweb, 'Website'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget Box(TextEditingController a, String b) {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty)
        {
          return 'Enter the data';
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      controller: a,
      decoration: InputDecoration(
        hintText: '$b',
        hintStyle: TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

}
