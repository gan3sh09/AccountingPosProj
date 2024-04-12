import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage('graphics/dataanalysis.png'),
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 10,
              left: 10,
              bottom: 30,
              child: HomeScreenButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const HomeScreenText(),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: ElevatedButton(
              onPressed: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authenticate(),
                  ),
                ); */
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Start Now!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenText extends StatelessWidget {
  const HomeScreenText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          "TallyAssist",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        SizedBox(height: 10),
        Text(
          "Send invoices under 30 seconds.",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
