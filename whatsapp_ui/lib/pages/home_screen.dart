// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              "WhatsApp",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white, // Set the indicator color to white
              labelColor: Colors.white, // Set the color for selected tabs
              unselectedLabelColor:
                  Colors.white60, // Set the color for unselected tabs
              labelStyle: TextStyle(
                fontSize: 16.0, // Adjust font size for selected tabs
                fontWeight:
                    FontWeight.bold, // Adjust font weight for selected tabs
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.0, // Adjust font size for unselected tabs
              ),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "STATUS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text(
                            "New group",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text("New broadcast",
                              style: TextStyle(fontSize: 15)),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text("Linked devices",
                              style: TextStyle(fontSize: 15)),
                        ),
                        PopupMenuItem(
                          value: 4,
                          child: Text("Starred messages",
                              style: TextStyle(fontSize: 15)),
                        ),
                        PopupMenuItem(
                          value: 5,
                          child:
                              Text("Settings", style: TextStyle(fontSize: 15)),
                        ),
                        PopupMenuItem(
                          value: 6,
                          child: Text("Switch accounts",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ]),
              SizedBox(
                width: 10,
              )
            ],
            backgroundColor: Colors.teal,
            elevation: 0,
          ),
          body: TabBarView(
            children: [
              Text('Camera'),
              ListView(
                padding: EdgeInsets.all(5),
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/sabir_profile_pic.jpg"),
                    ),
                    title: Text("B A H I ✨🌙"),
                    subtitle: Row(
                      children: [
                        Icon(Icons.check),
                        SizedBox(width: 5),
                        Text("Aloooo BAHI"),
                      ],
                    ),
                    trailing: Text(
                      "4.11 PM",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/my_profile_pic.jpg"),
                    ),
                    title: Text("You"),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.done_all,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text("Create WhatsApp UI"),
                      ],
                    ),
                    trailing: Text(
                      "4.50 PM",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    ),
                    title: Text("Anna"),
                    subtitle: Row(
                      children: [
                        SizedBox(width: 5),
                        Text("Are you available?"),
                      ],
                    ),
                    trailing: Text(
                      "3.02 AM",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/2379008/pexels-photo-2379008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    ),
                    title: Text("Sheharyar"),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.done_all,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text("Bazar ajao Jinnah Plaza tak."),
                      ],
                    ),
                    trailing: Text(
                      "Yesterday",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              ListView(
                padding: EdgeInsets.all(8),
                children: [
                  ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage("images/my_profile_pic.jpg"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text("My Status"),
                    subtitle: Text(
                      "Tap to add status update",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onTap: () {
                      // Handle tap to add status update
                      print("Add status tapped");
                    },
                  ),
                  Divider(height: 16, thickness: 0.5, color: Colors.grey),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                    title: Text("Anna"),
                    subtitle: Text("Today, 10:30 AM"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/285173/pexels-photo-285173.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                    title: Text("Client"),
                    subtitle: Text("5 minutes ago"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/2379008/pexels-photo-2379008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                    title: Text("Sheharyar"),
                    subtitle: Text("Today, 9:45 AM"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/sabir_profile_pic.jpg"),
                    ),
                    title: Text("B A H I ✨🌙"),
                    subtitle: Text("Yesterday, 8:00 PM"),
                  ),
                ],
              ),
              ListView(
                padding: EdgeInsets.all(5),
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/sabir_profile_pic.jpg"),
                    ),
                    title: Text(
                      "B A H I ✨🌙 ",
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.video_call),
                        SizedBox(width: 5),
                        Text("Today, 6.09 PM"),
                      ],
                    ),
                    trailing: Icon(Icons.video_call, color: Colors.teal),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/sabir_profile_pic.jpg"),
                    ),
                    title: Text(
                      "B A H I ✨🌙 (3) ",
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.call_missed),
                        SizedBox(width: 5),
                        Text("Today, 11.09 AM"),
                      ],
                    ),
                    trailing: Icon(Icons.call, color: Colors.teal),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/2379008/pexels-photo-2379008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    ),
                    title: Text(
                      "Sheharyar ",
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.call_missed_outgoing),
                        SizedBox(width: 5),
                        Text("Yesterday, 10.36 AM"),
                      ],
                    ),
                    trailing: Icon(Icons.call, color: Colors.teal),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/285173/pexels-photo-285173.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    ),
                    title: Text(
                      "Client",
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.video_call),
                        SizedBox(width: 5),
                        Text("June 25, 10.12 PM"),
                      ],
                    ),
                    trailing: Icon(Icons.video_call, color: Colors.teal),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
