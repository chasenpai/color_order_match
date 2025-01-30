import 'package:color_order_match/presentation/components/common_flexible_button.dart';
import 'package:color_order_match/presentation/components/common_text_button.dart';
import 'package:color_order_match/presentation/game/game_state.dart';
import 'package:color_order_match/ui/ui_colors.dart';
import 'package:color_order_match/util/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameScreen extends StatefulWidget {
  final GameState state;
  final Function(Color) onColorTap;
  final VoidCallback onExitTap;
  final VoidCallback onShowOrderTap;

  const GameScreen({
    required this.state,
    required this.onColorTap,
    required this.onExitTap,
    required this.onShowOrderTap,
    super.key,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  bool _showMessage = true;
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;

  @override
  void initState() {
    super.initState();
    _startMessageTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_bannerAd == null && !_isBannerLoaded) {
      _loadBannerAd();
    }
  }

  Future<void> _loadBannerAd() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.sizeOf(context).width.truncate());
    if (size == null) {
      return;
    }
    BannerAd(
      size: size,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isBannerLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  void _startMessageTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _showMessage = false;
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Score ${widget.state.score.toString()}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Life ${widget.state.life.toString()}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    if(widget.state.randomOrder != null)
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: SizedBox(
                            height: 48.0,
                            child: _showMessage
                                ? const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      'Tap the colors in the correct order',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                )
                                : widget.state.isShowOrder
                                ? Text(
                                  widget.state.showRemainingTime.toString(),
                                  style: const TextStyle(
                                    fontSize: 42.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                )
                                : widget.state.isCorrect || widget.state.isWrong
                                ? Center(
                                    child: Text(
                                      widget.state.isCorrect ? 'Success!' : 'Wrong',
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w700,
                                        color: widget.state.isCorrect ? Colors.green : Colors.red,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16.0,),
                    if(widget.state.randomOrder != null && widget.state.isShowOrder)
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 16.0,
                              runSpacing: 16.0,
                              children: widget.state.randomOrder!.map((e) {
                                final width = (MediaQuery.of(context).size.width - 120 - 32) / 3;
                                return Container(
                                  width: width,
                                  height: width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: e,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    if(widget.state.shuffledOrder != null && !widget.state.isShowOrder)
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 16.0,
                              runSpacing: 16.0,
                              children: widget.state.shuffledOrder!.map((e) {
                                final width = (MediaQuery.of(context).size.width - 120 - 32) / 3;
                                return GestureDetector(
                                  onTap: () {
                                    widget.onColorTap(e.color!);
                                  },
                                  child: Container(
                                    width: width,
                                    height: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: e.color,
                                    ),
                                    child: e.order != null ? Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '${e.order}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 42.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ) : null,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Expanded(
                          child: CommonFlexibleButton(
                            text: 'Show Order',
                            onPressed: widget.onShowOrderTap,
                            color: skyBlue,
                            fontSize: 18.0,
                            minHeight: 56.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0,),
                    CommonTextButton(
                      text: 'Exit',
                      color: Colors.black87,
                      onPressed: widget.onExitTap,
                    ),
                  ],
                ),
              ),
            ),
            if(_bannerAd != null && _isBannerLoaded)
              SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
