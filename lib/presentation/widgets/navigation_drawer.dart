import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

bool switchOn = false;

class _HomeDrawerState extends State<HomeDrawer> {
  Color buttonColor =
      switchOn ? const Color(0xff23262F) : const Color(0xffFCFCFC);
  final repoUrl = Uri.parse("https://github.com/");

  /*showUnableToLaunchUtlError() {
    toastification.show(
        context: context,
        title: const Text("An Error occurd!"),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        animationDuration: const Duration(milliseconds: 600),
        autoCloseDuration: const Duration(milliseconds: 4500),
        showProgressBar: false,
        alignment: Alignment.bottomCenter);
  }*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 200),
            child: Expanded(
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset("assets/images/ic_avatar.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        /*widget.data!.userName ??*/
                        "Suga diet Pham",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        /*widget.data!.email ??*/
                        "sugadiet@gmail.com",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed("settings");
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color.fromARGB(255, 92, 98, 111),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).popAndPushNamed("support");
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    "Support",
                    style: TextStyle(
                        color: Color.fromARGB(255, 92, 98, 111),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed("aboutus");
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(Icons.announcement_rounded),
                title: Text("About Us",
                    style: TextStyle(
                        color: Color.fromARGB(255, 92, 98, 111),
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          const SizedBox(
            height: 275,
          ),
        ],
      ),
    );
  }
}
