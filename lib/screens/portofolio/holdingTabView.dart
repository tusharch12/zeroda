import 'package:flutter/material.dart';

class HoldingTabContent extends StatefulWidget {
  final String title;
  const HoldingTabContent({super.key, required this.title});

  @override
  State<HoldingTabContent> createState() => _HoldingTabContentState();
}

class _HoldingTabContentState extends State<HoldingTabContent> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    appendInList();
    super.initState();
  }

  final List<Map<String, dynamic>> stocks = [
  {
    'symbol': 'ALEMBICLTD',
    'qty': 2,
    'avg': 66.65,
    'changePercent': '+5.03%',
    'invested': 133.30,
    'ltp': 70.00,
    'ltpChangePercent': '-0.56%',
  },
  {
    'symbol': 'TATAMOTORS',
    'qty': 10,
    'avg': 290.50,
    'changePercent': '+2.34%',
    'invested': 2905.00,
    'ltp': 305.00,
    'ltpChangePercent': '+1.56%',
  },
  {
    'symbol': 'RELIANCE',
    'qty': 5,
    'avg': 2500.00,
    'changePercent': '+1.23%',
    'invested': 12500.00,
    'ltp': 2530.00,
    'ltpChangePercent': '+0.84%',
  },
  {
    'symbol': 'HDFCBANK',
    'qty': 8,
    'avg': 1600.00,
    'changePercent': '-0.50%',
    'invested': 12800.00,
    'ltp': 1592.00,
    'ltpChangePercent': '-0.30%',
  },
  {
    'symbol': 'INFY',
    'qty': 6,
    'avg': 1300.00,
    'changePercent': '+1.10%',
    'invested': 7800.00,
    'ltp': 1320.00,
    'ltpChangePercent': '+1.54%',
  },
  {
    'symbol': 'SBIN',
    'qty': 15,
    'avg': 550.00,
    'changePercent': '+2.00%',
    'invested': 8250.00,
    'ltp': 561.00,
    'ltpChangePercent': '+1.60%',
  },
  {
    'symbol': 'ICICIBANK',
    'qty': 12,
    'avg': 700.00,
    'changePercent': '-1.00%',
    'invested': 8400.00,
    'ltp': 693.00,
    'ltpChangePercent': '-0.90%',
  },
  {
    'symbol': 'BHARTIARTL',
    'qty': 5,
    'avg': 700.00,
    'changePercent': '+0.75%',
    'invested': 3500.00,
    'ltp': 710.00,
    'ltpChangePercent': '+1.42%',
  },
  {
    'symbol': 'TCS',
    'qty': 4,
    'avg': 3300.00,
    'changePercent': '-0.45%',
    'invested': 13200.00,
    'ltp': 3285.00,
    'ltpChangePercent': '-0.54%',
  },
  {
    'symbol': 'HINDUNILVR',
    'qty': 6,
    'avg': 2100.00,
    'changePercent': '+0.60%',
    'invested': 12600.00,
    'ltp': 2115.00,
    'ltpChangePercent': '+0.71%',
  },
  {
    'symbol': 'AXISBANK',
    'qty': 7,
    'avg': 650.00,
    'changePercent': '+1.50%',
    'invested': 4550.00,
    'ltp': 660.00,
    'ltpChangePercent': '+1.54%',
  },
  {
    'symbol': 'ITC',
    'qty': 20,
    'avg': 200.00,
    'changePercent': '+0.30%',
    'invested': 4000.00,
    'ltp': 201.50,
    'ltpChangePercent': '+0.75%',
  },
  {
    'symbol': 'MARUTI',
    'qty': 3,
    'avg': 8000.00,
    'changePercent': '-0.25%',
    'invested': 24000.00,
    'ltp': 7980.00,
    'ltpChangePercent': '-0.12%',
  },
  {
    'symbol': 'BAJAJFINSV',
    'qty': 2,
    'avg': 12000.00,
    'changePercent': '+1.25%',
    'invested': 24000.00,
    'ltp': 12150.00,
    'ltpChangePercent': '+1.50%',
  },
  {
    'symbol': 'WIPRO',
    'qty': 15,
    'avg': 450.00,
    'changePercent': '-0.75%',
    'invested': 6750.00,
    'ltp': 445.00,
    'ltpChangePercent': '-1.11%',
  },
];

  

 void appendInList() {
  widgetList.add(Searchbar());

  for (var stock in stocks) {
    widgetList.add(
      Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Qty. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['qty']} ',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      TextSpan(text: '   '),
                      TextSpan(
                        text: 'Avg. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['avg']}',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text(
                  stock['changePercent'],
                  style: TextStyle(
                    color: stock['changePercent'].contains('+') ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(stock['symbol'], style: TextStyle(fontSize: 16)),
                Text(
                  stock['ltpChangePercent'],
                  style: TextStyle(
                    color: stock['ltpChangePercent'].contains('+') ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Invested ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['invested']}',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'LTP ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '${stock['ltp']} ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: '(${stock['ltpChangePercent']})',
                        style: TextStyle(
                          color: stock['ltpChangePercent'].contains('+') ? Colors.green : Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
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
              margin: const EdgeInsets.only(top: 40), // Removed margin to avoid gap
              height: 150,
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
              height: 150,
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
              child: Center(
                child: Column(
                  children: [
                    const ListTile(
                      
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Invested",
                            style: TextStyle(color: Colors.grey,fontSize: 15),
                          ),
                          Text("Current", style: TextStyle(color: Colors.grey,fontSize: 15))
                        ],
                      ),

                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "122,305.15",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text("123,084.50", style: TextStyle(fontSize: 20))
                        ],
                      ),
                     
                    ),
                    const Divider( 
                      indent: 10,

                    ),
                    ListTile(
          
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("P&L", style: TextStyle(color: Colors.grey),),
                          Text("+779.35", style: TextStyle(color: Colors.green[300],fontSize: 23),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
