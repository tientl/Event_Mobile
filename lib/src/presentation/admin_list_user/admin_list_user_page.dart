import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/presentation/admin_list_user/admin_list_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminListUserPage extends GetView<AdminListUserController> {
  const AdminListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Danh sách khách mời'.tr,
        titleStyle: Theme.of(context).textTheme.bodyText1,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: _buildDataGrid(context)),
    );
  }

  Widget _buildDataGrid(BuildContext context) {
    return SfDataGrid(
        onCellTap: (details) => {},
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        selectionMode: SelectionMode.none,
        columnWidthMode: ColumnWidthMode.fill,
        columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
        source: controller.medicalTestDataSource.value,
        columns: [
          GridColumn(
              columnName: 'Họ và tên'.tr,
              label: Container(
                padding: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Họ và tên'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          GridColumn(
              columnName: 'checkin'.tr,
              label: Container(
                padding: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Thời gian check-in'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ]);
  }
}
