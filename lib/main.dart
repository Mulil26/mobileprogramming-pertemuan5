import 'package:flutter/material.dart';
// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:simple_alert_dialog/simple_alert_dialog.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:pertemuan5/page/beranda_page.dart';
import 'package:pertemuan5/page/profile_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<Widget> _page = [BerandaPage(),ProfilePage()];
  List<String> jobs=[];

  int currentPage = 0;

  void addJob(String job) {
    setState(() {
      jobs.add(job);
    });
  }

  void deleteJob(int index) {
    setState(() {
      jobs.removeAt(index);
    });
  }

  void respondToJob(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Respon untuk: ${jobs[index]}")),
    );
  }

  @override
  Widget build(BuildContext context) {

    final pages = [
      BerandaPage(onAddJob: addJob),
      ProfilePage(
        jobs: jobs,
        onDelete: deleteJob,
        onRespond: respondToJob,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            // Beranda
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Beranda"),
              selectedColor: Colors.blue,
            ),
            // Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
