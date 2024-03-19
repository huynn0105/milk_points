part of '../home_page.dart';

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDropdown<FilterCustomer>(
        initialItem: FilterCustomer.point,
        items: FilterCustomer.values,
        headerBuilder: (context, selectedItem) {
          return Text(
            selectedItem.description,
            style: UITextStyles.medium(14).copyWith(color: UIColors.primaryColor),
          );
        },
        listItemBuilder: (context, item, isSelected, onItemSelect) {
          return Text(
            item.description,
            style: UITextStyles.regular(14).copyWith(
              color: isSelected ? UIColors.primaryColor : null,
            ),
          );
        },
        onChanged: (value) {
          log('changing value to: $value');
        },
      ),
    );
  }
}
