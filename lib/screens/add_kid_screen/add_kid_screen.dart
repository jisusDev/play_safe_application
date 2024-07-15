import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/card/ps_card_container.dart';
import 'package:play_safe_application/widgets/elevated_button/ps_add_timer_button.dart';

class AddKidScreen extends StatelessWidget {
  const AddKidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: SafeArea(
        child: Center(
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CardContainer(
            subTittle: "Gema Victoria",
            tittle: "Francisco Colmenarez",
            progressPercent: 0.70,
            minutes: '10',
            onPressed: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          CardContainer(
            subTittle: "Gema Victoria",
            tittle: "Francisco Colmenarez",
            progressPercent: 0.50,
            minutes: '20',
            onPressed: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          CardContainer(
            subTittle: "Gema Victoria",
            tittle: "Francisco Colmenarez",
            progressPercent: 0.20,
            minutes: '35',
            onPressed: () {},
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: PSAddTimerButton(
                  icon: Icons.alarm_add,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
