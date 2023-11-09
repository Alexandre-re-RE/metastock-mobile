import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum TypeMouvement { add, remouve }

class MouvementCardCustomWidget extends StatelessWidget {
  const MouvementCardCustomWidget({
    super.key,
    required this.typeMouvement,
    required this.quantity,
  });

  final TypeMouvement typeMouvement;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0.5, 0.5),
              blurRadius: 2,
              spreadRadius: 5,
              color: Colors.black54,
              inset: true,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("07/11/2023"),
                  Text("GIGABYTE GEFORCE RTX 4070"),
                ],
              ),
              const Icon(Icons.storefront),
              Visibility(
                visible: typeMouvement == TypeMouvement.add ? true : false,
                child: const Icon(Icons.add),
              ),
              Visibility(
                  visible:
                      typeMouvement == TypeMouvement.remouve ? true : false,
                  child: const Icon(Icons.remove)),
              Text(quantity.toString(), style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
