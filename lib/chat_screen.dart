import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String msg;
  final String name;
  final String photo;

  const ChatScreen({Key? key, required this.msg, required this.name, required this.photo}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // Start AppBar =>
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3,
          leadingWidth: 90,
          title: Text(widget.name,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
          leading: Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
                },),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.photo,),
              )
            ],
          ),
          iconTheme: IconThemeData(color: Colors.pink.shade100),
          actions: [
            Icon(Icons.call),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.videocam_rounded),
            )
          ],
        ),
        // <= End AppBar

        // body =>
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Center(
             child: Text(widget.msg, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37
                ),),
           ),
        // <= End 
           
            
          ],
        ),
        bottomNavigationBar:  Container(
          color: Colors.black12.withOpacity(0.02),
          child: Row(
          children: [
            CustButton(icon: Icons.more_vert, onPressed: (){},),
            CustButton(icon: Icons.photo_camera_sharp,onPressed: (){},),
            CustButton(icon: Icons.photo,onPressed: (){},),
            CustButton(icon: Icons.mic,onPressed: (){},),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: 110,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search",
                    border: InputBorder.none
                  ),
                ),
              ),
            CustButton(icon: Icons.thumb_up, onPressed: (){},)
          ],
            ),
        ),              
      ),
    );
  }
  
}


class CustButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  const CustButton({Key? key, required this.icon, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon),
    color: Colors.lightBlueAccent,
    
    );
  }
}

