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

/Users/michaelfehr/flutter/bin/flutter clean

https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/

AES GCM-256 PBKDF2 example

Klartext: Mein wichtiges Geheimnis

Passwort: Passwort1234

Ausgabe:

{
"algorithm": "AES-256 GCM PBKDF2",
"iterations": "15000",
"salt": "CxvOsOKsJQ+I0sZlFKoG1+PtM24zsZpvXhtbECRhyGE=",
"iv": "+PVx60N3yLeoJmL2",
"ciphertext": "lg+UZBb+3lj21AZv58B60wrFZuCUCgXj",
"gcmTag": "stK/u/IsGzP5vgB9tpb8PA=="
}



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
