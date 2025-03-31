import 'package:final_project/payment_select.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InvoiceScreen(),
    );
  }
}

class InvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'Invoice',
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Invoice number', '#7011979'),
                      _buildInfoRow('Date', '20/02/2025'),
                      _buildInfoRow('Due Date', '20/02/2025'),
                      _buildInfoRow(
                        'Time',
                        '3:00 PM',
                        rightLabel: 'Time',
                        rightValue: '6:00 PM',
                      ),
                      _buildDivider(),
                      _buildSectionTitle('Item(s):', 'Price:'),
                      _buildSectionTitle('MSI GF63', '\$999.00'),
                      _buildInfoRow('Reference Number', '54384894'),
                      _buildInfoRow('Source of funds', 'John the Ripper'),
                      _buildInfoRow('Destination number', '45761251551'),
                      _buildInfoRow('Recipient alias', 'T. Jonathann'),
                      const SizedBox(height: 10),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You can pay the full price before the deadline date. A refund request is only available 24 hours after the payment, and the period of the refund is 7 days after the request.',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      _buildDivider(),
                      _buildInfoRow('Sub-Total:', '\$999.00', isBold: true),
                      _buildInfoRow(
                        'Delivery Charge:',
                        '\$10.00',
                        isBold: true,
                      ),
                      const SizedBox(height: 10),
                      _buildInfoRow(
                        'Total:',
                        '\$1,009.00',
                        isBold: true,
                        fontSize: 20,
                      ),
                      const SizedBox(height: 20),
                      _buildPaymentButton(context),
                      const SizedBox(height: 20),
                      _buildHelpSection(),
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

  Widget _buildInfoRow(
    String label,
    String value, {
    String? rightLabel,
    String? rightValue,
    bool isBold = false,
    double fontSize = 16,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(thickness: 1, color: Colors.grey[300]);
  }

  Widget _buildSectionTitle(String leftText, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            rightText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: Text('Pay Now'),
      ),
    );
  }

  Widget _buildHelpSection() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Need Help?',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ),
    );
  }
}