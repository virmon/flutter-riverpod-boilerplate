import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  @override
  int get rowCount => 3;

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(Text('Business 1')),
            DataCell(Text('Owner 1')),
            DataCell(Text('Pilates')),
            DataCell(Text('Special Plan')),
            DataCell(
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.remove_circle_outline_outlined),
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(Text('Business 2')),
            DataCell(Text('Owner 2')),
            DataCell(Text('Hair Salon')),
            DataCell(Text('Special Plan')),
            DataCell(
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.remove_circle_outline_outlined),
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
          ],
        );
      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(Text('Business 3')),
            DataCell(Text('Owner 3')),
            DataCell(Text('Pilates')),
            DataCell(Text('Special Plan')),
            DataCell(
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.remove_circle_outline_outlined),
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

final DataTableSource dataSource = MyDataSource();

class DataTableExampleApp extends StatelessWidget {
  const DataTableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(right: 50.0, left: 50.0),
      child: DataTableExample(),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Business Plan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text('Owner', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text(
            'Industry',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text('Plan', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      source: dataSource,
    );
  }
}

class MyDataTable extends StatelessWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: const Text(
            'Business Management',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        const DataTableExampleApp(),
      ],
    );
  }
}
