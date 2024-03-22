import 'package:get/get.dart';
import 'package:ukandoit/tables/table.model.dart';

class TableController extends GetxController {
  var tables = <Table>[].obs;
  Rx<Table?> selectedTable = Rx<Table?>(null);

  void removeTable(Table table) {
    tables.remove(table);
    update();
  }

  void patchTable({
    required Table oldTable,
    required Table newTable,
  }) {
    final index = tables.indexWhere((p) => p == oldTable);

    if (index != -1) {
      tables[index] = newTable;
      update();
    } else {
      throw Exception('Not found Table.');
    }
  }
}
