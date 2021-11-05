# aes_playground

AES Cryptography with Flutter

version 1.0.0

For more information see http://fluttercrypto.bplaced.net/aes-playground

uses pointycastle: ^3.3.5 for encryption

https://pub.dev/packages/pointycastle

uses url_launcher: ^6.0.12 for text-link to fluttercrypto homepage

https://pub.dev/packages/url_launcher

appended in AndroidManifest.xml:

    <queries>
        <!-- If your app opens https URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
    </queries>

project is null safety

Flutter 2.5.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 18116933e7 (vor 3 Wochen) • 2021-10-15 10:46:35 -0700
Engine • revision d3ea636dc5
Tools • Dart 2.14.4

Android Studio Arctic Fox | 2020.3.1 Patch 3
Build #AI-203.7717.56.2031.7784292, built on October 1, 2021
Runtime version: 11.0.10+0-b96-7249189 aarch64
VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o.
macOS 11.6.1
GC: G1 Young Generation, G1 Old Generation
Memory: 2048M
Cores: 8
Registry: external.system.auto.import.disabled=true
Non-Bundled Plugins: Dart, org.jetbrains.kotlin, io.flutter, org.intellij.plugins.markdown

/Users/michaelfehr/flutter/bin/flutter clean

https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/

AES GCM-256 PBKDF2 example

Klartext: Mein wichtiges Geheimnis

Passwort: Passwort1234

Ausgabe:

{
"algorithm": "AES-256 CBC PBKDF2",
"iterations": "15000",
"salt": "HFRpHumEM1VQOOYtkQPXe8FC8cMgA3uP3s8iIuvLY4s=",
"iv": "2tVlCfaEmA1TX1BFDs3srA==",
"ciphertext": "7vSERqidtwIEm8Lty7EDxGl4UkunTIvFkLnJDP6WRgw=",
"gcmTag": "nicht benutzt"
}

{
"algorithm": "AES-256 GCM PBKDF2",
"iterations": "15000",
"salt": "CxvOsOKsJQ+I0sZlFKoG1+PtM24zsZpvXhtbECRhyGE=",
"iv": "+PVx60N3yLeoJmL2",
"ciphertext": "lg+UZBb+3lj21AZv58B60wrFZuCUCgXj",
"gcmTag": "stK/u/IsGzP5vgB9tpb8PA=="
}

Tested on Android 11 (SDK 30) Emulator
Android 12 (SDK 31) Emulator
Android 7 (SDK 24) ? Der Emulator ist derzeit nicht startfähig
iOS 15 Emulator
iOS 11.4 Emulator


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
