import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Details',
      home: const TransactionDetailsPage(),
    );
  }
}

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 16,
            child: Image.asset(
              'assets/images/wannabuy.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Transaction',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'WannaBuy.co',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(folder
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Transaction number', '#7011979'),
                      const Divider(thickness: 2, color: Colors.black),
                      _buildDetailRow('Reference Number', '54384894'),
                      _buildDetailRow('Source of funds', 'John the Ripper'),
                      _buildDetailRow('Destination number', '45761251551'),
                      _buildDetailRow('Recipient', 'T. Jonathan'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Note(s)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text('Please! Be careful with my items'),
                      const Divider(height: 40, thickness: 1),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Transaction:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$1,009.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Button color
                          foregroundColor: Colors.white, // Text color
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Download Transaction'),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Back?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
