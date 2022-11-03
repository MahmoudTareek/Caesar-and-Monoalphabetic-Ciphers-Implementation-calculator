import 'package:flutter/material.dart';
import 'package:project/caesercipher.dart';
import 'package:project/monoalphabeticcipher.dart';

class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 200.0,
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Mahmoud Tarek Sayed',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                '2019/02841',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Caesar Cipher',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaesarCiphers()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Monoalphabetic Cipher',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MonoalphabeticCiphers()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}