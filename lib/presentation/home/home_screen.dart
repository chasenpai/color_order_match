import 'package:color_order_match/presentation/components/common_flexible_button.dart';
import 'package:color_order_match/presentation/components/common_text_button.dart';
import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 108.0,
                            width: 352,
                            child: Stack(
                              children: [
                                const Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Color Order Match',
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 5,
                                  top: 14,
                                  child: Container(
                                    height: 16.0,
                                    width: 16.0,
                                    decoration: const BoxDecoration(
                                      color: turquoise,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 26.5,
                                  bottom: 16,
                                  child: Container(
                                    height: 16.0,
                                    width: 16.0,
                                    decoration: const BoxDecoration(
                                      color: orange,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 106,
                                  top: 0,
                                  child: Container(
                                    height: 16.0,
                                    width: 16.0,
                                    decoration: const BoxDecoration(
                                      color: violet,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 32.0,
                                  child: Container(
                                    height: 16.0,
                                    width: 16.0,
                                    decoration: const BoxDecoration(
                                      color: skyBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0,),
                        const Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Challenge Your Memory, Match the Colors!',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CommonFlexibleButton(
                                  text: 'Start',
                                  onPressed: () {
                                    context.push('/ready');
                                  },
                                  color: skyBlue,
                                  fontSize: 32.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0,),
                          CommonTextButton(
                            text: 'View Records',
                            color: Colors.black87,
                            onPressed: () {
                              context.push('/record');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
