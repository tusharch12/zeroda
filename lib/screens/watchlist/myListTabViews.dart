import 'package:flutter/material.dart';

class MyListTabContent extends StatefulWidget {
  final String title;
  const MyListTabContent({super.key, required this.title});

  @override
  State<MyListTabContent> createState() => _MyListTabContentState();
}

class _MyListTabContentState extends State<MyListTabContent> {
  List<Widget> widgetList = [];

  final List<Map<String, dynamic>> stocks = [
  {"name": "SBI", "price": "1,677.21", "index": "BSE", "change": "+20.30 (+1.23%)", "color": Colors.green},
  {"name": "Reliance Industries", "price": "1,436.94", "index": "NSE", "change": "-15.50 (-1.07%)", "color": Colors.red},
  {"name": "Zomato", "price": "1,298.83", "index": "NSE", "change": "+12.10 (+0.94%)", "color": Colors.green},
  {"name": "SBI Cards And Payment", "price": "933.33", "index": "BSE", "change": "-5.80 (-0.62%)", "color": Colors.red},
  {"name": "HDFC Bank", "price": "905.17", "index": "NSE", "change": "+8.60 (+0.96%)", "color": Colors.green},
  {"name": "Baazar Style Retail", "price": "892.83", "index": "BSE", "change": "-10.30 (-1.14%)", "color": Colors.red},
  {"name": "Tata Technologies", "price": "867.68", "index": "NSE", "change": "+15.80 (+1.86%)", "color": Colors.green},
  {"name": "Premier Energies", "price": "1,152.95", "index": "BSE", "change": "-6.40 (-0.55%)", "color": Colors.red},
  {"name": "Piramal Pharma", "price": "225.42", "index": "NSE", "change": "+5.90 (+2.69%)", "color": Colors.green},
  {"name": "KEC International", "price": "999.80", "index": "BSE", "change": "-12.50 (-1.23%)", "color": Colors.red},
  {"name": "HFCL", "price": "155.25", "index": "NSE", "change": "-1.20 (-0.77%)", "color": Colors.red},
  {"name": "Godrej Industries", "price": "1,229.60", "index": "BSE", "change": "+10.70 (+0.88%)", "color": Colors.green},
  {"name": "Bajaj Finserv", "price": "1,861.95", "index": "NSE", "change": "-30.25 (-1.60%)", "color": Colors.red},
  {"name": "Indegene", "price": "677.20", "index": "BSE", "change": "+8.30 (+1.24%)", "color": Colors.green},
  {"name": "Ashoka Buildcon", "price": "271.79", "index": "NSE", "change": "-3.90 (-1.42%)", "color": Colors.red},
];


  @override
  void initState() {
    appendInList();
    super.initState();
  }

  void appendInList() {
    widgetList.add(
    Searchbar()
    );

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


  Widget Searchbar()=>
    Container(
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
