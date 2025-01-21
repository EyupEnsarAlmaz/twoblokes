import 'package:flutter/material.dart';

class LiquidationsTable extends StatelessWidget {
  const LiquidationsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Tweets Sentiment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.black),
                dataRowColor: MaterialStateProperty.all(Colors.black),
                columns: const [
                  DataColumn(
                    label:
                        Text('Ranking', style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                    label:
                        Text('Symbol', style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                    label:
                        Text('Bullish', style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                    label:
                        Text('Bearish', style: TextStyle(color: Colors.white)),
                  ),
                ],
                rows: [
                  _buildCryptoRow(1, 'Crypto', '🟡', '350', '220'),
                  _buildCryptoRow(1, 'FX', '🟣', '310', '290'),
                  _buildCryptoRow(1, 'Nasdaq', '⚪', '180', '105'),
                  _buildCryptoRow(1, 'Currency', '⚪', '79', '110'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildCryptoRow(
    int ranking,
    String symbol,
    String icon,
    String longAmount,
    String shortAmount,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            ranking.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Row(
            children: [
              Text(icon),
              const SizedBox(width: 8),
              Text(
                symbol,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.green.withOpacity(0.1),
            child: Text(
              longAmount,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.red.withOpacity(0.1),
            child: Text(
              shortAmount,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
