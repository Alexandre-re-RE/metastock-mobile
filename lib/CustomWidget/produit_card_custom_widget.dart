import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:metastock/utils/constantes.dart';

import '../models/product.dart';

class ProduitCardCustomWidget extends StatelessWidget {
  const ProduitCardCustomWidget(
      {super.key, required this.product, required this.onTap});
  final Product product;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 5,
                color: Colors.black54,
                inset: true,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage("${product.picture}"),
                        height: 100,
                      ),
                      Text("Stock : ${product.stock} ",
                          style: Constantes.styleSmall),
                      Text("Price : ", style: Constantes.styleSmall),
                      Text("${product.unitprice}\$",
                          style: Constantes.styleSmall),
                    ],
                  ),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                Flexible(
                  flex: 1,
                  child: Text(
                    product.name ?? "",
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
