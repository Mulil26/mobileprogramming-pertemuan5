import 'package:flutter/material.dart';
import 'package:pertemuan6/page/profile_page.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';
import 'package:pertemuan6/page/pertemuan_page.dart';


class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Widget> _page = [ProfilePage(), ListPage()];
  List<Pertemuan> pertemuan = [
    Pertemuan(title: 'Pertemuan 1',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 2',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 3',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 4',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 5',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 6',subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 7',subtitle: 'Pengenalan Android'),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text("Pertemuan 5"),
      ),
      body: ListView.builder(
        itemCount: pertemuan.length,
        itemBuilder: (context,index) {
          final Pertemuan = pertemuan[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.list),
              title : Text(Pertemuan.title),
              subtitle: Text (Pertemuan.subtitle),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=>PertemuanPage(pertemuan:Pertemuan),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan ({required this.title, required this.subtitle});
}
