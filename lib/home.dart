import 'package:exam_app2/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            Column(
              children: [
                Container(height: 200,alignment: Alignment.center,child: Text("Contact",style: TextStyle(color: Colors.white,fontSize: 35),)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 580,
                    child: ListView.builder(itemCount: modallist.length,itemBuilder: (context, index) {
                      return Box("${modallist[index].Name}","${modallist[index].Num}",index);
                    },),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.grey.shade900,
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, 'new').then((value) {setState(() {

                      });});
                    });
                  },
                  child: Icon(Icons.add,size: 30,color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget Box(String a,String b,index)
  {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, 'second',arguments: index);
        });
      },
      child: Container(
        height: 50,
        child: Row(
          children: [
            Text("$a",style: TextStyle(color: Colors.white,fontSize: 20)),
            Expanded(child: SizedBox()),
            InkWell(onTap: () {
              launchUrl(Uri.parse('tel:$b'));
            },child: Icon(Icons.call,color: Colors.white)),
            SizedBox(width: 10,),
            InkWell(onTap: () {
              launchUrl(Uri.parse('sms:$b'));
            },child: Icon(Icons.message,color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
