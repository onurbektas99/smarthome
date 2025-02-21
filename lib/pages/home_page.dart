import 'package:flutter/material.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  // list of devices
  List mySmartDevices = [
    // names-path-status
    ["Smart Light", "lib/icons/light.png", true],
    ["Smart AC", "lib/icons/air.png", false],
    ["Smart TV", "lib/icons/tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  // power button switched
  void powerSwithChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'ONUR BEKTAŞ',
                    style: TextStyle(fontWeight:FontWeight.bold, fontSize:  40),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(color: Colors.grey[400], thickness: 2),
            ),

            const SizedBox(height: 25),

            // devices
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwithChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
