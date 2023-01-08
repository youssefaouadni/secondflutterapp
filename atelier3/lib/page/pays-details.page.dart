import 'dart:convert';
import 'dart:convert' show utf8;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaysDetailsPage extends StatefulWidget {
  String p = '';

  PaysDetailsPage(this.p, {super.key});

  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  var paysData;

  @override
  void initState() {
    super.initState();
    getPaysData(widget.p);
  }

  void getPaysData(String p) {
    print("Pays de " + p);
    String url = "https://restcountries.com/v2/name/${p}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        paysData = json.decode(utf8.decode(resp.bodyBytes));

        print(paysData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Pays Details ${widget.p}'),
        ),
        body: (paysData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (paysData == null ? 0 : paysData.length),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        child: Image.network(paysData[index]['flags']['png'], fit: BoxFit.fitWidth),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        const SizedBox(height: 20),
                        Text(paysData[index]['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(paysData[index]['nativeName'],
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ]),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Administration',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Capital :',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                paysData[index]['capital'],
                                style: const TextStyle(fontSize: 22),
                              )
                            ],
                          ),
                          const SizedBox(height: 1),
                          Container(
                            padding: const EdgeInsets.all(5),
                          ),
                          Row(
                            children: [
                              const Text(
                                'language(s) :',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                paysData[index]['languages'][index]['name'],
                                style: const TextStyle(fontSize: 22),
                              ),
                              const Text(
                                ",",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                paysData[index]['languages'][index]['nativeName'],
                                style: const TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Géographie',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Région :',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(paysData[index]['region'],
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Superficie :',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(paysData[index]['area'].toString(),
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Fuseau Horaire :',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(paysData[index]['timezones'][index],
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        const Text(
                          'Démographie',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              'Population :',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              paysData[index]['population'].toString(),
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        )
                      ])
                    ],
                  );
                })));
  }
}
