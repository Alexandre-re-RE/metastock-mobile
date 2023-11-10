import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/CustomWidget/ElevatedButtonCustom.dart';
import 'package:metastock/app_cubit.dart';
import 'package:metastock/utils/constantes.dart';

class ProduitView extends StatelessWidget {
  const ProduitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubitRead = context.watch<AppCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Constantes.couleurPrincipale,
              borderRadius: BorderRadius.circular(20)),
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
                      child: Text(appCubitRead.state.product?.description ?? "",
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
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: NetworkImage(appCubitRead
                                      .state.product?.picture ??
                                  "https://cdn.vectorstock.com/i/1000x1000/98/14/empty-photo-frame-on-transparent-background-vector-20569814.webp"),
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
                        Text("Description",
                            style: TextStyle(color: Colors.white)),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText:
                                      appCubitRead.state.product?.description ??
                                          ""),
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
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: appCubitRead
                                          .state.product?.threshold
                                          .toString() ??
                                      ""),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('  Stock',
                            style: TextStyle(color: Colors.white)),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: appCubitRead.state.product?.stock
                                          .toString() ??
                                      ""),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('  Uniprice',
                            style: TextStyle(color: Colors.white)),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: appCubitRead
                                          .state.product?.unitprice
                                          .toString() ??
                                      ""),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            const Text("  Archive",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: const Size(150, 60),
                              ),
                              onPressed: () {},
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(Icons.qr_code,
                                      size: 60, color: Colors.white),
                                  Icon(Icons.add,
                                      size: 50, color: Colors.greenAccent),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: const Size(150, 60),
                              ),
                              onPressed: () {},
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(Icons.qr_code,
                                      size: 60, color: Colors.white),
                                  Icon(Icons.remove,
                                      size: 50, color: Colors.redAccent),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButtonCustom(textButton: "Comfirmed"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
