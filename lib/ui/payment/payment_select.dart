import 'package:final_project/ui/payment/payment_success.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPayOnline = true; // Default payment method
  String selectedBank = "ABA"; // Default selected bank

  List<Map<String, String>> banks = [
    {"name": "ABA", "image": "assets/images/aba.png"},
    {"name": "ACLEDA", "image": "assets/images/aceleda.png"},
    {"name": "KHQR", "image": "assets/images/khqr.png"},
    {"name": "WING BANK", "image": "assets/images/wing.png"},
    {"name": "CHIPMONG BANK", "image": "assets/images/chipmong.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pay online",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: isPayOnline,
                  onChanged: (bool? value) {
                    setState(() {
                      isPayOnline = value!;
                    });
                  },
                ),
              ],
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 10),
            Text(
              "Payments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey[300]),
            Column(
              children: banks.map((bank) {
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        bank["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(bank["name"]!),
                  trailing: Radio<String>(
                    value: bank["name"]!,
                    groupValue: selectedBank,
                    onChanged: (String? value) {
                      setState(() {
                        selectedBank = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub-Total:", style: TextStyle(fontSize: 16)),
                Text("\$ 999.00", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charge:", style: TextStyle(fontSize: 16)),
                Text("\$ 10.00", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ 1,009.00",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferSuccessScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Order Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Do you need some help?",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
