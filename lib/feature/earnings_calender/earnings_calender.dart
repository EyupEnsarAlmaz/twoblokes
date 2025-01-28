import 'package:flutter/material.dart';

class EarningsCalendar extends StatelessWidget {
  const EarningsCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earnings Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Selector
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildDateCard('FRI', '17', 'Jan', false),
                _buildDateCard('MON', '20', 'Jan', false),
                _buildDateCard('TUE', '21', 'Jan', true),
                _buildDateCard('WED', '22', 'Jan', false),
                _buildDateCard('THU', '23', 'Jan', false),
                _buildDateCard('FRI', '24', 'Jan', false),
                _buildDateCard('MON', '27', 'Jan', false),
              ],
            ),
          ),

          // Table Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              children: [
                const Expanded(flex: 3, child: Text('Company')),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Text('Market Cap'),
                      Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                    ],
                  ),
                ),
                const Expanded(flex: 2, child: Text('EPS Est')),
              ],
            ),
          ),

          // Earnings List
          Expanded(
            child: ListView(
              children: [
                _buildEarningsRow(
                  icon: '🌙',
                  symbol: 'NFLX',
                  name: 'Netflix, Inc.',
                  marketCap: '\$360,077,891,490',
                  epsEstimate: '\$4.19',
                  reportedestimates: '11',
                  suprise: '-2%',
                  revenueforcast: '\$2.11',
                  revenueActual: "2.12",
                ),
                _buildEarningsRow(
                  icon: '⚪',
                  symbol: 'HDB',
                  name: 'HDFC Bank Limited',
                  marketCap: '\$148,494,280,406',
                  epsEstimate: '\$0.74',
                  reportedestimates: '1',
                  suprise: '3%',
                  revenueforcast: '\$0.82',
                  revenueActual: "2.12",
                ),
                _buildEarningsRow(
                  icon: '☀️',
                  symbol: 'SCHW',
                  name: 'The Charles Schwab Corporation',
                  marketCap: '\$138,225,267,174',
                  epsEstimate: '\$0.90',
                  reportedestimates: '10',
                  suprise: '-2%',
                  revenueforcast: '\$0.68',
                  revenueActual: "2.12",
                ),
                // Add more rows as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateCard(
      String day, String date, String month, bool isSelected) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            month,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsRow({
    required String icon,
    required String symbol,
    required String name,
    required String marketCap,
    required String epsEstimate,
    required String reportedestimates,
    required String suprise,
    required String revenueforcast,
    required String revenueActual,
  }) {
    return ExpansionTile(
      leading: Text(icon, style: const TextStyle(fontSize: 20)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            symbol,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      subtitle: Text(
        'Market Cap: $marketCap',
        style: const TextStyle(fontSize: 12),
      ),
      children: [ 
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildDetailRow('EPS Estimate', epsEstimate, Colors.black),
              _buildDetailRow(
                  'Reported Estimates', reportedestimates, Colors.black),
              _buildDetailRow('Suprise', suprise, Colors.red),
              _buildDetailRow('Revenue Forcast', revenueforcast, Colors.black),
              _buildDetailRow('Revenue Actual', revenueActual, Colors.green),
            ],
          ),   
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    Color? color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
