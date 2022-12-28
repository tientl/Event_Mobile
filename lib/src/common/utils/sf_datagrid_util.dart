import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SfDatagridUtils {
  static Color getRowBackgroundColor(int index) {
    if (index % 2 == 0) {
      return Colors.grey.shade200;
    }

    return Colors.transparent;
  }

  static DataGridRowAdapter buildRow(int index, DataGridRow row) {
    return DataGridRowAdapter(
        color: SfDatagridUtils.getRowBackgroundColor(index),
        cells: row
            .getCells()
            .map<Widget>((dataGridCell) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  alignment: Alignment.center,
                  child: Text(
                    dataGridCell.value.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList());
  }
}
