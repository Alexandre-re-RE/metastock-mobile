import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/const/color.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../CustomWidget/mouvement_card_custom_widget.dart';
import 'cubit/liste_produit_cubit.dart';

class ListeProduitView extends StatelessWidget {
  ListeProduitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListeProduitCubit cubitWatch = context.watch<ListeProduitCubit>();
    ListeProduitCubit cubitRead = context.read<ListeProduitCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: couleurPrincipale.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                minWidth: 180.0,
                cornerRadius: 5.0,
                activeBgColors: const [
                  [couleurPrincipale],
                  [couleurPrincipale]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.transparent,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Liste des Produit', 'Liste des mouvement'],
                radiusStyle: true,
                onToggle: (index) {
                  cubitRead.changeVisibility(index: index ?? 1);
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: cubitWatch.state.visibilityListePorduit,
          child: Expanded(
              flex: 9,
              child: GridView.count(
                  crossAxisCount: 2,
                  children: cubitRead.generateRandomProductCards(18))),
        ),
        Visibility(
          visible: !cubitWatch.state.visibilityListePorduit,
          child: Expanded(
            flex: 9,
            child: ListView.separated(
                itemCount: 18,
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemBuilder: (context, index) => MouvementCardCustomWidget(
                      typeMouvement: cubitRead.getRandomTypeMouvement(),
                      quantity: cubitRead.getRandomNumber(),
                    )),
          ),
        ),
      ],
    );
  }
}
