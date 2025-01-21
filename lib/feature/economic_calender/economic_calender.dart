import 'package:flutter/material.dart';

class MobileEconomicCalendar extends StatelessWidget {
  const MobileEconomicCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Economic Calendar'),
      ),
      body: Column(
        children: [
          // Filter chips scrollable row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                _buildFilterChip('Recent', Icons.calendar_today),
                _buildFilterChip('Impact', Icons.star_border),
                _buildFilterChip('Countries', Icons.public),
                _buildFilterChip('Category', Icons.bar_chart),
                _buildFilterChip('UTC', Icons.access_time),
              ],
            ),
          ),

          // Date header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.grey[100],
            child: const Text(
              'Tuesday January 21 2025',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          // Events list
          Expanded(
            child: ListView(
              children: [
                _buildEventCard(
                  time: '03:35',
                  country: '🇯🇵 JP',
                  event: '40-Year JGB Auction',
                  actual: '2.570%',
                  previous: '2.550%',
                  consensus: '-',
                  forecast: '-',
                  isHighlighted: false,
                ),
                _buildEventCard(
                  time: '05:00',
                  country: '🇸🇬 SG',
                  event: 'MAS 12-Week Bill Auction',
                  actual: '3.07%',
                  previous: '3.18%',
                  consensus: '-',
                  forecast: '-',
                  isHighlighted: false,
                ),
                _buildEventCard(
                  time: '07:00',
                  country: '🇬🇧 GB',
                  event: 'Unemployment Rate NOV',
                  actual: '4.4%',
                  previous: '4.3%',
                  consensus: '4.3%',
                  forecast: '4.3%',
                  isHighlighted: true,
                ),
                _buildEventCard(
                  time: '07:00',
                  country: '🇬🇧 GB',
                  event: 'Average Earnings incl. Bonus (3Mo/Yr)',
                  actual: '5.6%',
                  previous: '5.2%',
                  consensus: '5.6%',
                  forecast: '5.5%',
                  isHighlighted: false,
                ),
                _buildEventCard(
                  time: '09:30',
                  country: '🇿🇦 ZA',
                  event: 'Gold Production YoY',
                  actual: '-11.5%',
                  previous: '-3.4%',
                  consensus: '-',
                  forecast: '-3.0%',
                  isHighlighted: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        onSelected: (bool selected) {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String time,
    required String country,
    required String event,
    required String actual,
    required String previous,
    required String consensus,
    required String forecast,
    required bool isHighlighted,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 0,
      color: isHighlighted ? Colors.brown[50] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time and Country
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isHighlighted ? Colors.brown : Colors.black87,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  country,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Event name
            Text(
              event,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            // Data grid
            Row(
              children: [
                _buildDataColumn('Actual', actual, isBold: true),
                _buildDataColumn('Previous', previous,
                    textColor:
                        previous.startsWith('-') ? Colors.red : Colors.green),
                _buildDataColumn('Consensus', consensus),
                _buildDataColumn('Forecast', forecast),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataColumn(String label, String value,
      {bool isBold = false, Color? textColor}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
