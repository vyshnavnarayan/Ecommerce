import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class IndexPage extends StatelessWidget {
   IndexPage({super.key});
Map<String, double> salesData = {
  'Total Paid': 10,
  'Total Overdue': 10,
  'Tolal Unpaid': 10
};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 241, 243),
      appBar: AppBar(),
      drawer: Drawer(),
      body: 
      // Column(
      //   children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: 
            GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget> [
                Container(
                  child: Card(
                    color: Color.fromARGB(255, 183, 189, 222),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Customers',style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
                            Icon(Icons.group,color: Colors.blue,),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text('200',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                  Container(
                  child: Card(
                    color: Color.fromARGB(255, 183, 189, 222),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Revenue',style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
                            Icon(Icons.attach_money,color: Colors.blue,)
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.currency_rupee,color: Colors.blue,),
                            Text('10,000',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                   Container(
                  child: Card(
                    color: Color.fromARGB(255, 183, 189, 222),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Profit',style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
                            Icon(Icons.arrow_upward,color: Colors.blue,)
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('65',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                            Icon(Icons.percent,color: Colors.blue,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                 Container(
                  child: Card(
                    color: Color.fromARGB(255, 183, 189, 222),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Invoices',style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
                            Icon(Icons.file_copy,color: Colors.blue,),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text('1135',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                  Container(
                    child: PieChart(dataMap: salesData,chartRadius: MediaQuery.of(context).size.width / 1.7,
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.bottom,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true
                    ),),
                  )
              ],
            ),
           
          ),
      //   ],
      // ),
    );
  }
}