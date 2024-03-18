part of '../home_page.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDropdown<Job>(
        hintText: 'Select job role',
        items: _list,
        onChanged: (value) {
          log('changing value to: $value');
        },
      ),
    );
  }
}

const List<Job> _list = [
  Job('Developer', Icons.developer_mode),
  Job('Designer', Icons.design_services),
  Job('Consultant', Icons.account_balance),
  Job('Student', Icons.school),
];


class Job {
  final String name;
  final IconData icon;
  const Job(this.name, this.icon);

  @override
  String toString() {
    return name;
  }
}