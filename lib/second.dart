import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:exam_app2/main.dart';
import 'package:flutter/material.dart';

class Sceond extends StatefulWidget {
  const Sceond({Key? key}) : super(key: key);

  @override
  State<Sceond> createState() => _SceondState();
}

class _SceondState extends State<Sceond> {
  @override
  Widget build(BuildContext context) {
    int a = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("${modallist[a].Name}"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, 'update', arguments: a).then((value) {setState(() {

                    });});
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle),
                  child: (modallist[a].img!.isEmpty)?Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    child: Text("${modallist[a].Name!.substring(0,1)}",style: TextStyle(color: Colors.white,fontSize: 50)),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                  ):CircleAvatar(
                    maxRadius: 75,
                    backgroundImage: FileImage(File('${modallist[a].img}')),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${modallist[a].Name}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                Container(height: 1,width: double.infinity,color: Colors.grey.shade800,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          launchUrl(
                              Uri.parse('tel: ${modallist[a].Num}'));
                        },
                        child: Column(
                          children: [
                            Icon(Icons.call,color: Colors.white,),
                            SizedBox(height: 5,),
                            Text("Call",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          launchUrl(
                              Uri.parse('sms: ${modallist[a].Num}'));
                        },
                        child: Column(
                          children: [
                            Icon(Icons.message,color: Colors.white,),
                            SizedBox(height: 5,),
                            Text("Sms",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(height: 1,width: double.infinity,color: Colors.grey.shade800,),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact info",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse('tel: ${modallist[a].Num}'));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${modallist[a].Num}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse('sms: ${modallist[a].Num}'));
                                  },
                                  child:
                                      Icon(Icons.message, color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    Uri.parse('mailto:${modallist[a].email}'));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${modallist[a].email}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse('${modallist[a].web}'));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.computer,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${modallist[a].web}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
