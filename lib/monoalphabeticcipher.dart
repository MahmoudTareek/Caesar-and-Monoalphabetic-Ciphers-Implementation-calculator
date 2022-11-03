import 'package:flutter/material.dart';
import 'package:project/alphabets.dart';

class MonoalphabeticCiphers extends StatefulWidget
{
  @override
  _MonoalphabeticCiphersState createState() => _MonoalphabeticCiphersState();

}

class _MonoalphabeticCiphersState extends State<MonoalphabeticCiphers>
{
  TextEditingController plaintextController = TextEditingController();
  TextEditingController ciphertextController = TextEditingController();
  String? text1;
  String? text2;
  bool isplaintextPressed = false;
  bool isciphertextPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15.0,
              ),
              child: const Text(
                'Monoalphabetic Cipher',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: plaintextController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter the Plaintext: ',
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    text1 = monoalphabeticCipherEncryption(plaintextController);
                    isplaintextPressed = true;
                  }
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Change to Ciphertext',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                isplaintextPressed? text1! : " ",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: ciphertextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the Ciphertext: ',
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    text2 = monoalphabeticCipherDecryption(ciphertextController);
                    isciphertextPressed = true;
                  }
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Change to Plaintext',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                isciphertextPressed? text2! : " ",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String monoalphabeticCipherEncryption(var plaintext)
{
  var changedtext = [];
  int place;
  for(int i = 0; i < plaintext.text.length; i++)
  {
    if(plaintext.text[i] == " ")
    {
      changedtext.add(" ");
    }
    else
    {
      place =  alphabets.indexOf(plaintext.text[i]);
      changedtext.add(monoalphabeticalphabets[place]);
    }
  }
  return changedtext.join().toUpperCase();
}

String monoalphabeticCipherDecryption(var ciphertext)
{
  var changedtext = [];
  int place;
  for(int i = 0; i < ciphertext.text.length; i++)
  {
    if(ciphertext.text[i] == " ")
    {
      changedtext.add(" ");
    }
    else
    {
      place = monoalphabeticalphabets.indexOf(ciphertext.text[i]);
      changedtext.add(alphabets[place]);
    }
  }
  return changedtext.join().toUpperCase();
}