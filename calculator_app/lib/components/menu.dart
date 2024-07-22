import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff4B4B4B),
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          ListTile(
            title: const Text(
              "Standard",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: const Text("Currency",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 25)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/currencyCalc");
            },
          ),
          ListTile(
            title: const Text("Area",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 25)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/areaCalc");
            },
          ),
          ListTile(
            title: const Text("Data",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 25)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/dataCalc");
            },
          ),
        ],
      ),
    );
  }
}
