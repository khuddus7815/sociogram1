import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:sociogram/features/home/data/users.dart';

import '../../../utils/back_ground.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/post_card.dart';
import '../widgets/stories_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/11.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Shaik \nAbdul \nKhuddus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'abdul224601@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation code here
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation code here
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation code here
                },
              ),
              ListTile(
                leading: Icon(Icons.info_rounded),
                title: Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation code here
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                  _handleLogout(); // Call method to handle logout
                },
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text("Stories"),
                    const SizedBox(
                      height: 110,
                      child: Stories(),
                    ),
                    const SizedBox(height: 20),
                    const Text("Trending Posts"),
                    ...posts.map(
                          (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: PostCard(
                          m: e,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle logout and quit the application
  void _handleLogout() {
    // Platform-specific code to exit the application
    if (Platform.isAndroid) {
      // For Android, use this method to exit the app
      exit(0);
    } else if (Platform.isIOS) {
      // For iOS, there's no direct method to quit the app programmatically
      // Typically, iOS users expect apps to stay open, so handle logout only
      // You can navigate back to login screen or do other appropriate actions
    }
  }
}

void exit(int i) {
}
