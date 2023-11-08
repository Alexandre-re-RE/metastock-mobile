import 'package:flutter/material.dart';
import 'package:metastock/const/color.dart';

import '../CustomWidget/elevatedButtonCustom.dart';

class ProduitView extends StatelessWidget {
  const ProduitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: couleurPrincipale, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Title(
                    color: Colors.white,
                    child: const Text("GIGBYTE Geforce RTX 4070",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("assets/image/metastock.png"),
                            height: 100,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('  Description',
                          style: TextStyle(color: Colors.white)),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const TextField(
                            maxLines: 3,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('  Threshold',
                          style: TextStyle(color: Colors.white)),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const TextField()),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('  Uniprice',
                          style: TextStyle(color: Colors.white)),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const TextField()),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Text("  Archive",
                            style: TextStyle(color: Colors.white)),
                      ]),
                    ],
                  ),
                ],
              ),
              ElevatedButtonCustom(textButton: "Comfirmed"),
            ],
          ),
        ),
      ),
    );
  }
}
