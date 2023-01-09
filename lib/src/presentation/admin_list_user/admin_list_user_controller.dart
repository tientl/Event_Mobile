import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/utils/sf_datagrid_util.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/presentation/admin_home_page/admin_home_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:event_app/src/common/utils/util_datetime.dart';

class AdminListUserController extends GetxController {
  final event = Rxn<Event>(null);
  final user = AppManager().currentUser;
  final medicalTestDataSource = MedicalTestDataSource([]).obs;
  final registations = <Registration>[].obs;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is List<Registration>) {
      registations.value = argument;
      medicalTestDataSource.value = MedicalTestDataSource(registations);
    }
    super.onInit();
  }
}

class RegistationDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;
  RegistationDataSource(List<Registration> registrations) {
    dataGridRows = registrations
        .map<DataGridRow>((registrations) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Họ và tên'.tr,
                  value: registrations.name.toString()),
              DataGridCell<String>(
                  columnName: 'Thời gian check-in'.tr,
                  value: registrations.checkIntime?.hhmmddmmyyyy ?? '-'),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return SfDatagridUtils.buildRow(effectiveRows.indexOf(row), row);
  }
}
