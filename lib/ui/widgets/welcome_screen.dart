import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/texts.dart';
import 'package:accounting_pos_project/ui/views/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: tassistPrimary,
                          ),
                        );
                      },
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context); // Close the dialog
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeDashboardScreen(),
                      ));
                    });
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 510,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/ledgers.png',
                                ),
                                height: 280.0,
                                width: 280.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'View parties, products,\nand vouchers.',
                              style: secondaryListTitle.copyWith(
                                  color: tassistWhite),
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'View all your parties, latest vouchers, and products on the app itself.',
                              style: secondaryListDisc.copyWith(
                                  color: tassistWhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: ClipRect(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/invoice-maker.png',
                                  ),
                                  height: 280.0,
                                  width: 280.0,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                'Make GST invoices\nfrom the app!',
                                style: secondaryListTitle.copyWith(
                                    color: tassistWhite),
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                                'Select from parties & products from Tally to create new invoices from TallyAssist.',
                                style: secondaryListDisc.copyWith(
                                    color: tassistWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/invoice.png',
                                ),
                                height: 280.0,
                                width: 280.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text('Generate inovices and\nparty statements',
                                style: secondaryListTitle.copyWith(
                                    color: tassistWhite)),
                            const SizedBox(height: 15.0),
                            Text(
                              'Generate pdfs and share with your customers via WhatsApp & email.',
                              style: secondaryListDisc.copyWith(
                                  color: tassistWhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      flex: 1,
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 70.0,
              width: double.infinity,
              color: tassistMenuBg,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: tassistPrimary,
                        ),
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeDashboardScreen(),
                    ));
                  });
                },
                child: const Center(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      color: tassistWhite,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
