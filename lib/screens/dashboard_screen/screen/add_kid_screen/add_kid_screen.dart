import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/bottom_sheet_add_player_element.dart';
import 'package:play_safe_application/screens/dashboard_screen/screen/empty_kid_screen/empty_kid_screen.dart';
import 'package:play_safe_application/widgets/card/ps_card_container.dart';
import 'package:play_safe_application/widgets/elevated_button/ps_add_timer_button.dart';

class AddKidScreen extends StatelessWidget {
  const AddKidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CardContainer> cards = [
      CardContainer(
        subTittle: "Gema Victoria",
        tittle: "Francisco Colmenarez",
        progressPercent: 0.70,
        minutes: '10',
        onPressed: () {},
      ),
      CardContainer(
        subTittle: "Gema Victoria",
        tittle: "Francisco Colmenarez",
        progressPercent: 0.50,
        minutes: '20',
        onPressed: () {},
      ),
      CardContainer(
        subTittle: "Gema Victoria",
        tittle: "Francisco Colmenarez",
        progressPercent: 0.20,
        minutes: '35',
        onPressed: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: PsAppcolor.background,
      body: SafeArea(
        child: cards.isEmpty
            ? const EmptyKidScreen()
            : Stack(
                children: [
                  _Body(cards: cards),
                  Positioned(
                    bottom: 32,
                    right: 30,
                    child: PSAddTimerButton(
                      icon: Icons.alarm_add,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: PsAppcolor.black.withOpacity(0.25),
                          isDismissible: true,
                          isScrollControlled: true,
                          builder: (context) =>
                              const BottomSheetAddPlayerElement(),
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

class _Body extends StatelessWidget {
  final List<CardContainer> cards;

  const _Body({required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            cards[index],
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
