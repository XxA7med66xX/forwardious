import 'package:flutter/material.dart';
import 'package:forwardious/i18n/strings.g.dart';

class InstanceInfoDataTable extends StatelessWidget {

  ///A table that shows the information of an invidious instance.
  const InstanceInfoDataTable({
    super.key,
    required this.location,
    required this.type,
    required this.health,
    required this.signUp,
  });

  final String location;
  final String type;
  final String health;
  final String signUp;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: DataTable(
            border: TableBorder.all(color: Theme.of(context).primaryColor, width: 1),
            headingRowHeight: 30,
            headingTextStyle: Theme.of(context).textTheme.titleSmall,
            dataRowMinHeight: 20,
            dataRowMaxHeight: 30,
            columnSpacing: 20,
            columns: [
              DataColumn(label: Text(context.t.instanceDetails.location),tooltip: context.t.instanceDetails.tooltip.locationTip),
              DataColumn(label: Text(context.t.instanceDetails.type),tooltip: context.t.instanceDetails.tooltip.typeTip),
              DataColumn(label: Text(context.t.instanceDetails.health),tooltip: context.t.instanceDetails.tooltip.healthTip),
              DataColumn(label: Text(context.t.instanceDetails.signUp),tooltip: context.t.instanceDetails.tooltip.signUpTip),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text(location)),
                  DataCell(Text(type)),
                  DataCell(Text(health)),
                  DataCell(Text(signUp)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
