import 'package:flutter/material.dart';

void main() {
  runApp(const EarnApp());
}

class EarnApp extends StatelessWidget {
  const EarnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earn App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int coins = 0;

  void earnCoins() {
    setState(() {
      coins += 10;
    });
  }

  void withdraw() {
    if (coins >= 100) {
      setState(() {
        coins -= 100;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Withdrawal requested")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not enough coins")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earn Money App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coins: $coins",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: earnCoins,
            child: const Text("Watch Ad (Earn 10 Coins)"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: withdraw,
            child: const Text("Withdraw (100 Coins)"),
          ),
        ],
      ),
    );
  }
}
