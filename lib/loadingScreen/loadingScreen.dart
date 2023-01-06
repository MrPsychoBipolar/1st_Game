import 'package:flutter/material.dart';
import 'package:untitled/dashboard/dashboard.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLoginPage();
  }

  _navigateToLoginPage() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Center(
          child: Icon(Icons.gamepad, color: Colors.white, size: 300,),
        ),
      ],
    );
  }
}
