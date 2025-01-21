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
                  eps: '\$4.19',
                  estimates: '11',
                  lastDate: '1/23/2024',
                  lastEps: '\$2.11',
                ),
                _buildEarningsRow(
                  icon: '⚪',
                  symbol: 'HDB',
                  name: 'HDFC Bank Limited',
                  marketCap: '\$148,494,280,406',
                  eps: '\$0.74',
                  estimates: '1',
                  lastDate: '1/16/2024',
                  lastEps: '\$0.82',
                ),
                _buildEarningsRow(
                  icon: '☀️',
                  symbol: 'SCHW',
                  name: 'The Charles Schwab Corporation',
                  marketCap: '\$138,225,267,174',
                  eps: '\$0.90',
                  estimates: '10',
                  lastDate: '1/17/2024',
                  lastEps: '\$0.68',
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
    required String eps,
    required String estimates,
    required String lastDate,
    required String lastEps,
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
              _buildDetailRow('Consensus EPS', eps),
              _buildDetailRow('# of Estimates', estimates),
              _buildDetailRow('Last Year\'s Report', lastDate),
              _buildDetailRow('Last Year\'s EPS', lastEps),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
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
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
