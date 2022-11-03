import 'package:flutter/material.dart';
import 'package:project/alphabets.dart';

class CaesarCiphers extends StatefulWidget
{
  @override
  _CaesarCiphersState createState() => _CaesarCiphersState();

}

class _CaesarCiphersState extends State<CaesarCiphers>
{
  TextEditingController plaintextController = TextEditingController();
  TextEditingController plainkeyController = TextEditingController();
  TextEditingController ciphertextController = TextEditingController();
  TextEditingController cipherkeyController = TextEditingController();
  String? text1;
  String? text2;
  bool isplaintextPressed = false;
  bool isciphertextPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                top: 25.0,
                left: 15.0,
              ),
              // ignore: prefer_const_constructors
              child: Text(
                'Caesar Cipher',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: plaintextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the Plaintext: ',
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: plainkeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the key: ',
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    text1 = caesarCipherEncryption(plaintextController, int.parse(plainkeyController.text));
                    isplaintextPressed = true;
                  }
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: cipherkeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the key: ',
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
                    text2 = caesarCipherDecryption(ciphertextController, int.parse(cipherkeyController.text));
                    isciphertextPressed = true;
                  }
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Change to Plaintext',
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
                isciphertextPressed? text2! : " ",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

String caesarCipherEncryption(var plaintext, int key)
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
      if(plaintext.text[i].isEmpty)
      {
        changedtext.add(" ");
      }
      changedtext.add(alphabets[(place+key)%26]);
    }
  }
  return changedtext.join().toUpperCase();
}

String caesarCipherDecryption(var ciphertext, int key)
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
      place = alphabets.indexOf(ciphertext.text[i]);
      int decryptedkey = place-key;
      if(decryptedkey < 0)
      {
        decryptedkey += 26;
      }
      changedtext.add(alphabets[decryptedkey.abs()%26]);
    }
  }
  return changedtext.join().toUpperCase();
}