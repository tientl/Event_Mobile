import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/utils/sf_datagrid_util.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class AdminHomeController extends GetxController {
  final event = Rxn<Event>(null);
  final user = AppManager().currentUser;
  final medicalTestDataSource = MedicalTestDataSource([]).obs;

  @override
  void onInit() {
    if (AppManager().currentEvent != null &&
        AppManager().currentEvent?.registrations != null) {
      event.value = AppManager().currentEvent;
      medicalTestDataSource.value =
          MedicalTestDataSource(event.value!.registrations!);
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (event.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }

  upDateDataSource() {
    medicalTestDataSource.value =
        MedicalTestDataSource(AppManager().currentEvent!.registrations!);
    medicalTestDataSource.refresh();
  }
}

class MedicalTestDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;
  MedicalTestDataSource(List<Registration> registrations) {
    dataGridRows = registrations
        .map<DataGridRow>((registrations) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'ID'.tr, value: registrations.id.toString()),
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
