

import 'package:flutter/material.dart';
import 'package:massager_test/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.black
      
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // Start AppBar =>
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Chats",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
          leadingWidth: 70,

          leading: Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/12.jpg"),
              radius: 10
            ),
          ),
          actions: [
            CustButton(camera: (val){},
              icon: Icons.camera_alt,),
            CustButton(icon: Icons.edit,)
          ],
        ),
        // <= End AppBar

        body: ListView(
          children: [
        // Search Box
            SearchBox(),
        // Status Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatusContainer(Photo: "images/33.png", name: "Your Story"),
                  StatusContainer(
                    Photo: "images/12.jpg",
                    name: "John Nasser",
                  ),
                  StatusContainer(
                    Photo: "images/download.jpg",
                    name: "Mark Emad",
                  ),
                  StatusContainer(
                    Photo: "images/images.jpg",
                    name: "Amr Alaa",
                  ),
                  StatusContainer(
                    Photo: "images/12.jpg",
                    name: "Mohamed Sabra",
                  ),
                  StatusContainer(
                    Photo: "images/download.jpg",
                    name: "Eslam Center",
                  ),
                  
                ],
              ),
            ),
        // Contact =>
            UserList(photo: "images/12.jpg", name: "John Nasser", msg: "No Msg... (:"),
            UserList(photo: "images/download.jpg", name: "Mark Emad", msg: "No Msg... (:"),
            UserList(photo: "images/images.jpg", name: "Amr Alaa", msg: "No Msg... (:"),
            UserList(photo: "images/12.jpg", name: "Mohamed Sabra", msg: "No Msg... (:",),
            UserList(photo: "images/download.jpg", name: "Eslam Center", msg: "No Msg... (:",),
            UserList(photo: "images/images.jpg", name: "Nour ...", msg: "No Msg... (:"),
            UserList(photo: "images/12.jpg", name: "Abdo ...", msg: "No Msg... (:"),
            UserList(photo: "images/12.jpg", name: "Marco Abdo", msg: "No Msg... (:"),
            UserList(photo: "images/12.jpg", name: "Maya Ezz", msg: "No Msg... (:"),
            

          ]
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustNavigationBar(icon: Icons.mark_chat_unread, txt: "Chats"),
            CustNavigationBar(icon: Icons.people_alt, txt: "People")
           
          ],
        ),
      )
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.all(20),  
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
           Icons.search,
          ),
          hintText: "Search",
          border: InputBorder.none,
        ),
    ),
    );
  }
}


class CustButton extends StatelessWidget {
  final Function(String)? camera;
  final IconData icon;
  const CustButton({Key? key, this.camera, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.withOpacity(0.3),
          foregroundColor: Colors.white,
          child: IconButton(onPressed: (){}, icon: Icon(icon,
          color: Colors.black,
          )),
        ),
      ),
    );
  }
}


class StatusContainer extends StatelessWidget {
  final String Photo;
  final String name;

  const StatusContainer({Key? key,required this.Photo,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,bottom: 10,top: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Photo),
            backgroundColor: Colors.grey.withOpacity(0.3),
            foregroundColor: Colors.black,
            radius: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.w500,),),
          )
        ],
      ),
      
    );
  }
}


class UserList extends StatefulWidget {
  final String photo;
  final String name;
  final String msg;
  

  const UserList({Key? key, required this.photo, required this.name, required this.msg}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.photo),
        radius: 30,
      ),
      subtitle: Text(widget.msg),
      trailing: Icon(Icons.circle_notifications, color: Colors.blue,),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatScreen(msg: widget.msg ,name: widget.name,photo: widget.photo,)));
      },

    );
  }
}

class CustNavigationBar extends StatelessWidget {
final IconData icon;
final String txt;

  const CustNavigationBar({Key? key, required this.icon, required this.txt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        children: [
          IconButton(onPressed: (){}, icon: Icon(icon) ),
          Text(txt)
        ],
      ),
    );
  }
}