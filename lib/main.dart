import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'aes_256_cbc_pbkdf2_decryption_route.dart';
import 'aes_256_cbc_pbkdf2_encryption_route.dart';
import 'aes_256_gcm_pbkdf2_decryption_route.dart';
import 'aes_256_gcm_pbkdf2_encryption_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFormPage(title: 'AES Playground'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainFormPage extends StatefulWidget {
  MainFormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainFormPageState createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Bitte wählen Sie einen Algorithmus'; // please choose an algorithm

  BoxDecoration linkBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) // <--- border radius here
          ),
    );
  }

  Widget linkWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: linkBoxDecoration(), // <--- BoxDecoration here
      child: Text(
        'Beschreibung des Programms: http://fluttercrypto.bplaced.net/aes-playground-pc/',
        //'Program description: http://fluttercrypto.bplaced.net/aes-playground-pc/',
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          //decoration: TextDecoration.underline,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget libraryLinkWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: linkBoxDecoration(), // <--- BoxDecoration here
      child: Text(
        'verwendete Kryptographie Bibliothek:'
        //'Used crypto library:'
        '\npointycastle Version 3.3.5'
        '\nhttps://pub.dev/packages/pointycastle',
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Diese App demonstriert die symmetrische Verschlüsselung auf Basis des AES Algorithmus.',
                  //'This app is demonstrating the symmetric encryption on base of the AES algorithm.',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Bitte wählen Sie einen Algorithmus\naus der Liste aus:',
                  // 'Please choose an algorithm:',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: false,
                  itemHeight: 48,
                  //what you need for height
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    labelText: 'wählen Sie einen Algorithmus',
                    //labelText: 'choose an algorithm',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    if (dropdownValue ==
                        'AES-256 CBC PBKDF2\nVerschluesselung') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Aes256CbcPbkdf2EncryptionRoute()),
                      );
                    }
                    if (dropdownValue ==
                        'AES-256 CBC PBKDF2\nEntschluesselung') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Aes256CbcPbkdf2DecryptionRoute()),
                      );
                    }
                    if (dropdownValue ==
                        'AES-256 GCM PBKDF2\nVerschluesselung') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Aes256GcmPbkdf2EncryptionRoute()),
                      );
                    }
                    ;
                    if (dropdownValue ==
                        'AES-256 GCM PBKDF2\nEntschluesselung') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Aes256GcmPbkdf2DecryptionRoute()),
                      );
                    }
                    ;
                  },
                  items: <String>[
                    'Bitte wählen Sie einen Algorithmus',
                    'AES-256 CBC PBKDF2\nVerschluesselung',
                    'AES-256 CBC PBKDF2\nEntschluesselung',
                    'AES-256 GCM PBKDF2\nVerschluesselung',
                    'AES-256 GCM PBKDF2\nEntschluesselung'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // own license
                        LicenseRegistry.addLicense(() async* {
                          yield LicenseEntryWithLineBreaks(
                            ['FlutterCrypto AES Playground'],
                            'Das Programm unterliegt keiner Lizenz und kann frei verwendet werden (Public Domain).',
                          );
                        });
                        // show license dialog
                        showAboutDialog(
                          context: context,
                          applicationName: widget.title,
                          applicationVersion: '1.0.0',
                          applicationIcon:  Image.asset('assets/images/flutter_crypto_raw2.png', height: 86, width: 86),
                          applicationLegalese:
                              'Das Programm kann frei verwendet werden (Public Domain)',
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                  'Die App demonstriert die Verschlüsselung mit'
                                  ' dem AES Algorithmus in den Modi CBC und GCM.'
                                  '\nDer Schlüssel wird mit PBKDF2 aus einem Passwort erzeugt.'),
                            ),
                          ],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('bereitgestellt von FlutterCrypto')),
                        );
                      },
                      child: Text('über das Programm und Lizenzen'),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // clickable hyperlink as Text
                Link(
                  target: LinkTarget.blank, // new browser, not in app
                  // don't forget to add queries in AndroidManifest.xml
                  // and url scheme in Info.plist file
                  uri: Uri.parse('http://fluttercrypto.bplaced.net/aes-playground-pc/'),
                  builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                    child: linkWidget(),
                  ),
                ),

                // link to pub.dev
                SizedBox(height: 10),
                // clickable hyperlink as Text
                Link(
                  target: LinkTarget.blank, // new browser, not in app
                  // don't forget to add queries in AndroidManifest.xml
                  // and url scheme in Info.plist file
                  uri: Uri.parse('https://pub.dev/packages/pointycastle'),
                  builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                    child: libraryLinkWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
