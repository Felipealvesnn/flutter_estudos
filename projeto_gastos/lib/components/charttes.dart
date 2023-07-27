import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class MyWidget extends StatelessWidget {
   MyWidget({Key? key}) : super(key: key);
 final List<String> nomes = ['CHN', 'GER', 'RUS', 'BRZ', 'IND'];
  final List<_ChartData> data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
  final TooltipBehavior _tooltip = TooltipBehavior(enable: true);

  
  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.nome,
                  yValueMapper: (_ChartData data, _) => data.valor,
                  name: 'GDP',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]);
  }
}
class _ChartData {
  
  final String nome;
  final double valor;

  _ChartData(this.nome, this.valor);
}