import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan5/page/profile_page.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  final Function(String) onAddJob;
  const BerandaPage({super.key,required this.onAddJob});

  @override
  State<BerandaPage> createState() => _BerandaPage();
}

class _BerandaPage extends State<BerandaPage> {
  List<Widget> _page = [BerandaPage(onAddJob: (_) {}), ProfilePage(jobs: const[],onDelete: (_){},onRespond:(_){})];

  final TextEditingController _controller = TextEditingController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text("Pertemuan 5"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: "Masukkan pekerjaan Anda",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Submit Button
            InkWell(
              onTap: () {
                if (_controller.text.isNotEmpty) {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.confirm,
                    buttonsColor: Colors.green,
                    title: AlertTitleText("Apakah kamu yakin?"),
                    content: AlertContentText(
                        "Apakah kamu ingin menambahkan data"),
                    onConfirmButtonPressed: (ctx) {
                      widget.onAddJob(_controller.text);
                      CherryToast.success(
                        inheritThemeColors: true,
                        title: Text("Berhasil menambahkan data!"),
                        borderRadius: 0,
                      ).show(context);
                      _controller.clear();
                      Navigator.pop(context);
                    },
                  );
                }
              },
              child: Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(height: 10),
            // Delete Button
            InkWell(
              onTap: () {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.warning,
                  buttonsColor: Colors.red,
                  title:  AlertTitleText("Apakah kamu yakin?"),
                  content:  AlertContentText("Apakah kamu ingin menghapus data"),
                  onConfirmButtonPressed: (ctx) {
                    CherryToast.success(
                      inheritThemeColors: true,
                      title: const Text("Berhasil menghapus data!"),
                      borderRadius: 0,
                    ).show(context);
                    Navigator.pop(context);
                  },
                );
              },
              child: Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(height: 10),
            // Show Dialog Button
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:  Text("AlertDialog"),
                    contentPadding:  EdgeInsets.all(20),
                    content:  Text("Ini AlertDialog"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child:  Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Text(
                  "Show Dialog",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
