import 'package:color_order_match/presentation/components/color_group_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {

          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Choose a color group',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                ColorGroupButton(
                                  groupName: 'Rainbow',
                                  colors: const [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.green,
                                    Colors.blue,
                                  ],
                                  onPressed: () {
                                    context.go('/game/0');
                                  },
                                ),
                                const SizedBox(width: 16.0,),
                                ColorGroupButton(
                                  groupName: 'Pastel',
                                  colors: const [
                                    Color(0xFFFFC0CB),
                                    Color(0xFFFFE4B5),
                                    Color(0xFF77DD77),
                                    Color(0xFFB0E0E6),
                                  ],
                                  onPressed: () {
                                    context.go('/game/1');
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0,),
                            Row(
                              children: [
                                ColorGroupButton(
                                  groupName: 'Neon',
                                  colors: const [
                                    Color(0xFFF21D79),
                                    Color(0xFFFFFC00),
                                    Color(0xFF39FF14),
                                    Color(0xFF00F9FF),
                                  ],
                                  onPressed: () {
                                    context.go('/game/2');
                                  },
                                ),
                                const SizedBox(width: 16.0,),
                                ColorGroupButton(
                                  groupName: 'Vintage',
                                  colors: const [
                                    Color(0xFF9B2D20),
                                    Color(0xFFE5C7B9),
                                    Color(0xFFA18F77),
                                    Color(0xFFC0C0C0),
                                  ],
                                  onPressed: () {
                                    context.go('/game/3');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
