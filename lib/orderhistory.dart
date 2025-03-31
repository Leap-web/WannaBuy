import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order History',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OrderHistoryScreen(),
    );
  }
}

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [Tab(text: 'Current'), Tab(text: 'History')],
              labelColor: Colors.black,
              indicatorColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OrderList(isCurrent: true),
                  OrderList(isCurrent: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final bool isCurrent;

  OrderList({super.key, required this.isCurrent});

  final List<OrderGroup> orderGroups = [
    OrderGroup(
      date: 'Feb.20.2025',
      orders: [
        OrderItem(
          name: 'Macbook Pro M2',
          quantity: 1,
          description: 'CPU : Apple M2 chip, Ram : i568_see more',
          price: 999.00,
        ),
        OrderItem(
          name: 'IMAC PRO M3',
          quantity: 1,
          description: 'CPU : Apple M3 chip, Ram : i568_see more',
          price: 1459.00,
        ),
      ],
    ),
    OrderGroup(
      date: 'Jan.20.2025',
      orders: [
        OrderItem(
          name: 'Lenovo ThinkPad',
          quantity: 1,
          description: 'CPU : Core I5, Ram : i568_see more',
          price: 830.00,
        ),
        OrderItem(
          name: 'TUF Gaming F15',
          quantity: 1,
          description: 'CPU : Core I7, Ram : i568_see more',
          price: 699.00,
        ),
        OrderItem(
          name: 'Dell',
          quantity: 1,
          description: 'CPU : Core I6, Ram : i568_see more',
          price: 569.00,
        ),
      ],
    ),
    OrderGroup(
      date: 'Dec.20.2024',
      orders: [
        OrderItem(name: 'Airpods Pro', quantity: 1, price: 249.00),
        OrderItem(name: 'iPhone 14 Pro Max', quantity: 1, price: 999.00),
        OrderItem(name: 'iPhone 15 Pro Max', quantity: 1, price: 1160.00),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderGroups.length,
      itemBuilder: (context, index) {
        final group = orderGroups[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                group.date,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...group.orders.map(
              (order) => OrderItemCard(order: order, isCurrent: isCurrent),
            ),
          ],
        );
      },
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final OrderItem order;
  final bool isCurrent;

  const OrderItemCard({
    super.key,
    required this.order,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'x ${order.quantity}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            if (order.description != null) ...[
              const SizedBox(height: 8),
              Text(
                order.description!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
            const SizedBox(height: 16),
            // Fix: Set price text color to red
            Text(
              '\$${order.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Make the price red
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Time Cover',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCurrent ? Colors.blue[50] : Colors.green[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isCurrent ? 'Delivered' : 'Paid',
                    style: TextStyle(
                      color: isCurrent ? Colors.blue[800] : Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderGroup {
  final String date;
  final List<OrderItem> orders;

  OrderGroup({required this.date, required this.orders});
}

class OrderItem {
  final String name;
  final int quantity;
  final String? description;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    this.description,
    required this.price,
  });
}
