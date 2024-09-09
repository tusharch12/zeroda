import 'package:flutter/material.dart';

class FavoriteTabContent extends StatefulWidget {
  final String title;
  const FavoriteTabContent({super.key, required this.title});

  @override
  State<FavoriteTabContent> createState() => _PortfolioTabContentState();
}

class _PortfolioTabContentState extends State<FavoriteTabContent> {
  List<Widget> widgetList = [];

  // Sample dynamic list of stocks with "NSE", "INDICES", "BSE" as index values
 final List<Map<String, dynamic>> stocks = [
    {"name": "SENSEX", "price": "61,084.65", "index": "INDICES", "change": "-345 (-0.57%)", "color": Colors.red},
    {"name": "NIFTY 50", "price": "18,107.85", "index": "INDICES", "change": "-120 (-0.66%)", "color": Colors.red},
    {"name": "TATA MOTORS", "price": "1,046.90", "index": "BSE", "change": "-25.10 (-2.34%)", "color": Colors.red},
    {"name": "RELIANCE", "price": "2,475.00", "index": "NSE", "change": "-45 (-1.85%)", "color": Colors.red},
    {"name": "INFY", "price": "1,600.45", "index": "NSE", "change": "+25.50 (+1.62%)", "color": Colors.green},
    {"name": "HDFC", "price": "2,872.00", "index": "BSE", "change": "+32.40 (+1.14%)", "color": Colors.green},
    {"name": "ICICI", "price": "895.55", "index": "NSE", "change": "-15 (-1.65%)", "color": Colors.red},
    {"name": "SBIN", "price": "525.80", "index": "BSE", "change": "+12.10 (+2.35%)", "color": Colors.green},
    {"name": "TCS", "price": "3,275.90", "index": "INDICES", "change": "-5.35 (-0.16%)", "color": Colors.red},
    {"name": "BHARTIARTL", "price": "723.25", "index": "NSE", "change": "+8.75 (+1.23%)", "color": Colors.green},
    {"name": "ONGC", "price": "151.60", "index": "BSE", "change": "-2.50 (-1.62%)", "color": Colors.red},
    {"name": "BAJAJ FIN", "price": "5,895.60", "index": "NSE", "change": "+95.70 (+1.65%)", "color": Colors.green},
    {"name": "ITC", "price": "278.20", "index": "BSE", "change": "-1.15 (-0.41%)", "color": Colors.red},
    {"name": "HUL", "price": "2,025.30", "index": "INDICES", "change": "+15.25 (+0.76%)", "color": Colors.green},
    {"name": "ASIAN PAINTS", "price": "3,115.40", "index": "INDICES", "change": "-25.60 (-0.82%)", "color": Colors.red},
  ];

  @override
  void initState() {
    appendInList();
    super.initState();
  }

  void appendInList() {
    // Add Searchbar to widgetList
    widgetList.add(Searchbar());

    // Loop through the stocks list and add them to widgetList
    for (var stock in stocks) {
      widgetList.add(
        Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stock["name"]),
                  Text(
                    stock["price"],
                    style: TextStyle(color: stock["color"]),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stock["index"], style: const TextStyle(color: Colors.grey)),
                  Text(
                    stock["change"],
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              onTap: () {
                // Handle item tap
              },
            ),
            const Divider(color: Colors.grey, thickness: 0.5), // Add this line for a bottom line
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

  Widget Searchbar() => Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20), // Removed margin to avoid gap
              height: 50,
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
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust margin to remove extra gap
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
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search and add ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("20/100", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: Icon(Icons.filter_list_outlined),
                ),
              ),
            ),
          ],
        ),
      );
}
