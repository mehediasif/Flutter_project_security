import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'first_encryption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {

  TextEditingController tex = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Encryption/Decryption"),),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: tex,
                ),
            ),
            Column(
              children: [
                Text("Plain Text",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.green[400],
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(plainText == null ? '' : plainText ,
                      style: TextStyle(
                        height: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        background: Paint()
                          ..invertColors = true,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.blue[700]!
                          ..blendMode = BlendMode.darken
                      ),
                    ),
                )
              ],
            ),
            Column(
              children: [
                Text("Encrypted Text",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(encryptedText == null ? '' : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText ,
                  style: TextStyle(
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      background: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black87
                        ..filterQuality = FilterQuality.high
                      ,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.purple[600]!
                        ..blendMode = BlendMode.darken
                  ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      plainText = tex.text;
                      setState(() {
                        encryptedText = MyEncryptionDecryption.encryptAES(plainText);
                      });
                    },
                    child: const Text("Encrypt"),
                ),
                const SizedBox(width: 10.0, height: 2.0,),
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      encryptedText = MyEncryptionDecryption.decryptAES(encryptedText);
                    });
                  },
                  child: const Text("Decrypt"),
                ),
              ],
            ),
            const Text("Buttons for Fernet Algorithm",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color.fromRGBO(170, 23, 45, 0.8),
                decorationStyle: TextDecorationStyle.double,
                height: 3,
                letterSpacing: 2.0,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        encryptedText = MyEncryptionDecryption.encryptFernet(plainText);
                      });
                    },
                    child: const Text("Encrypt"),
                ),
                const SizedBox(width: 10.0, height: 2.0,),
                RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    setState(() {
                      encryptedText = MyEncryptionDecryption.decryptFernet(encryptedText);
                    });
                  },
                  child: const Text("Decrypt"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}