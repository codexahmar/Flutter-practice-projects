import 'package:flutter/material.dart';
import 'package:qoutes_app/api_service.dart';
import 'package:qoutes_app/quoteClass.dart';

class Qoutescreen extends StatefulWidget {
  const Qoutescreen({super.key});

  @override
  State<Qoutescreen> createState() => _QoutescreenState();
}

class _QoutescreenState extends State<Qoutescreen> {
  final ApiService apiService = ApiService();
  Quote? currentQoute;

  void fetchQuote() async {
    Quote quote = await apiService.fetchRandomQuote();
    setState(() {
      currentQoute = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motivational Quotes'),
        backgroundColor: Colors.teal, // Changed the app bar color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentQoute != null)
                Column(
                  children: [
                    Text(
                      currentQoute!.text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal, // Changed text color
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '- ${currentQoute!.author}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54, // Changed text color
                      ),
                    ),
                  ],
                )
              else
                const Text(
                  'Press the button to get a motivational quote!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54), // Changed text color
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: fetchQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Get Quote',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
