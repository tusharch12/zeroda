import 'package:flutter/material.dart';

class PositionTabContent extends StatefulWidget {
  final String title;
  const PositionTabContent({super.key, required this.title});

  @override
  State<PositionTabContent> createState() => _PositionTabContentState();
}

class _PositionTabContentState extends State<PositionTabContent> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    appendInList();
    super.initState();
  }

  final List<Map<String, dynamic>> stocks = [
  {
    'symbol': 'USDINR23JUNFUT',
    'qty': -1,
    'avg': 82.05637,
    'ltp': 82.35674,
    'type': 'NRML',
    'pnl': 260.00, // Profit & Loss
  },
  {
    'symbol': 'TATAMOTORS23JUNFUT',
    'qty': 3,
    'avg': 312.50,
    'ltp': 315.75,
    'type': 'NRML',
    'pnl': 9.75,
  },
  {
    'symbol': 'RELIANCE23JUNFUT',
    'qty': -2,
    'avg': 2450.00,
    'ltp': 2430.50,
    'type': 'MIS',
    'pnl': -39.00,
  },
  {
    'symbol': 'HDFCBANK23JUNFUT',
    'qty': 1,
    'avg': 1500.75,
    'ltp': 1520.25,
    'type': 'NRML',
    'pnl': 19.50,
  },
  {
    'symbol': 'INFY23JUNFUT',
    'qty': 4,
    'avg': 1345.50,
    'ltp': 1338.00,
    'type': 'MIS',
    'pnl': -30.00,
  },
  {
    'symbol': 'ICICIBANK23JUNFUT',
    'qty': -5,
    'avg': 750.00,
    'ltp': 755.50,
    'type': 'NRML',
    'pnl': -27.50,
  },
  {
    'symbol': 'SBIN23JUNFUT',
    'qty': 2,
    'avg': 550.25,
    'ltp': 555.00,
    'type': 'MIS',
    'pnl': 9.50,
  },
  {
    'symbol': 'BHARTIARTL23JUNFUT',
    'qty': -3,
    'avg': 670.00,
    'ltp': 675.75,
    'type': 'NRML',
    'pnl': -17.25,
  },
];

 void appendInList() {
  widgetList.add(Searchbar());

  for (var stock in stocks) {
    widgetList.add(
      Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Qty. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['qty']} ',
                        style: TextStyle(
                          color: stock['qty'] > 0 ? Colors.green : Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      const TextSpan(text: '   '),
                      const TextSpan(
                        text: 'Avg. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['avg'].toStringAsFixed(5)}',
                        style: const TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 50,
                  color: const Color.fromARGB(255, 239, 210, 244),
                  child: Center(
                    child: Text(
                      stock['type'],
                      style: TextStyle(color: Colors.purple[400]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stock['symbol'],
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  "${stock['pnl'].toStringAsFixed(4)}",
                  style: TextStyle(
                    color: stock['pnl'] >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'CDS ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'LTP ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: "${stock['ltp'].toStringAsFixed(5)}",
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey, thickness: 0.5),
        ],
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, // Remove padding from ListView
      itemCount: widgetList.length,
      itemBuilder: (context, index) {
        return widgetList[index];
      },
    );
  }


  Widget Searchbar()=>
    Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30), // Removed margin to avoid gap
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Container(
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10), // Adjust margin to remove extra gap
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 2), // Changes position of shadow
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total P&L", style: TextStyle(color: Colors.grey),),
                     Text("+184.00", style: TextStyle(color: Colors.green,fontSize: 20),),
                  ],
                )
              ),
            ),
          ],
        ),
      );
}
