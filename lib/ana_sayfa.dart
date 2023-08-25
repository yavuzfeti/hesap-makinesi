import 'package:flutter/material.dart';


void main() => runApp(ana_sayfa());

class ana_sayfa extends StatefulWidget {

  @override
  State<ana_sayfa> createState() => _ana_sayfaState();
}

class _ana_sayfaState extends State<ana_sayfa> {

  int _selectedRadio = 0;
  double sayi_1 = 0;
  double sayi_2 = 0;
  double sonuc = 0;
  String islem = "+";

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value as int;
      switch(_selectedRadio)
      {
        case 0:
          sonuc = (sayi_1+sayi_2);
          break;

        case 1:
          sonuc = (sayi_1-sayi_2);
          break;

        case 2:
          sonuc = (sayi_1*sayi_2);
          break;

        case 3:
          sonuc = (sayi_1/sayi_2);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hesap makinesi"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "1. Sayıyı gir",
                ),
                  onChanged: (sayi_1_text)
                  {
                    setState(() {
                      sayi_1 = double.parse(sayi_1_text);
                      switch(_selectedRadio)
                      {
                        case 0:
                          sonuc = (sayi_1+sayi_2);
                          break;

                        case 1:
                          sonuc = (sayi_1-sayi_2);
                          break;

                        case 2:
                          sonuc = (sayi_1*sayi_2);
                          break;

                        case 3:
                          sonuc = (sayi_1/sayi_2);
                          break;
                      }
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _selectedRadio,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('+'),
                    Radio(
                      value: 1,
                      groupValue: _selectedRadio,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('-'),
                    Radio(
                      value: 2,
                      groupValue: _selectedRadio,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('*'),
                    Radio(
                      value: 3,
                      groupValue: _selectedRadio,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text('/'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                  labelText: "2. Sayıyı gir",
                  border: OutlineInputBorder(),
                ),
                  onChanged: (sayi_2_text){
                    setState(() {
                      sayi_2 = double.parse(sayi_2_text);
                      switch(_selectedRadio)
                      {
                        case 0:
                          sonuc = (sayi_1+sayi_2);
                          break;

                        case 1:
                          sonuc = (sayi_1-sayi_2);
                          break;

                        case 2:
                          sonuc = (sayi_1*sayi_2);
                          break;
                        case 3:
                           sonuc = (sayi_1/sayi_2);
                          break;
                      }
                    });



                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Sonuç: $sonuc",style: const TextStyle(fontSize: 25),),
              ),
            ],
        ),
      )
    );
  }
}
