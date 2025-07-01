import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Navigation Bar
          SideBar(),
          // Container(
          //   width: 250,
          //   color: const Color.fromRGBO(32, 34, 34, 1),
          //   child: Column(
          //     children: [
          //       //Search Bar
          //       //Footer
          //       ListTile(
          //         leading: Icon(Icons.home, color: Colors.white),
          //         title: Text('Home', style: TextStyle(color: Colors.white)),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.search, color: Colors.white),
          //         title: Text('Search', style: TextStyle(color: Colors.white)),
          //       ),
          //     ],
          //   ),
          // ),

          // Main Content Area
          Expanded(
            child: Center(
              child: Text(
                'Main Content Area',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
