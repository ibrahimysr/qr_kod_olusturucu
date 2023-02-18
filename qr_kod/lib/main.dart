import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrCode(),
    );
  }
}

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  var data = "";
  Color renk = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c0f45),
      appBar: AppBar(
        title: const Text("QR kod oluşturucu"),
        centerTitle: true,
        backgroundColor: const Color(0xff191970),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: data,
              size: 200,
              version: QrVersions.auto,
              backgroundColor: Colors.white,
              foregroundColor: renk,
              errorStateBuilder: (cxt, err) {
                return const Center(
                  child: Text(
                    "Hatalı giriş işlemi",
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    data = value;
                  });
                },
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xff191970),
                    hintText: "Bilgiyi Giriniz",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "QRCODE RENK SEÇİMİ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.palette,
                    size: 40,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 1,
                        child: Text(
                          "Kırmızı",
                          style: TextStyle(color: Colors.red),
                        )),
                    const PopupMenuItem(
                        value: 2,
                        child: Text("Sarı",
                            style: TextStyle(color: Colors.yellow))),
                    const PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Mavi",
                          style: TextStyle(color: Colors.blue),
                        )),
                    const PopupMenuItem(
                        value: 4,
                        child: Text("Turuncu",
                            style: TextStyle(color: Colors.orange))),
                    const PopupMenuItem(
                        value: 5,
                        child: Text("Yeşil",
                            style: TextStyle(color: Colors.green))),
                    const PopupMenuItem(
                        value: 6,
                        child: Text("Siyah",
                            style: TextStyle(color: Colors.black))),
                  ],
                  onSelected: (value) {
                    setState(() {
                      if (value == 1) {
                        renk = Colors.red;
                      } else if (value == 2) {
                        renk = Colors.yellow;
                      } else if (value == 3) {
                        renk = Colors.blue;
                      } else if (value == 4) {
                        renk = Colors.orange;
                      } else if (value == 5) {
                        renk = Colors.green;
                      } else if (value == 6) {
                        renk = Colors.black;
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: 170,
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff191970)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            color: const Color(0xff1c0f45),
                            height: 400,
                            child: Center(
                              child: QrImage(
                                data: data,
                                size: 300,
                                version: QrVersions.auto,
                                backgroundColor: Colors.white,
                                foregroundColor: renk,
                                errorStateBuilder: (cxt, err) {
                                  return const Center(
                                    child: Text(
                                      "Hatalı giriş işlemi",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text("QR GÖSTER")),
            )
          ],
        ),
      ),
    );
  }
}
