import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view_model.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';


// Define an enum for checkbox state
enum CheckboxState {
  unchecked,
  checked,
}



class ContactCardWidget extends StatefulWidget {
  const ContactCardWidget({Key? key, required this.contact, required this.isGroup, required this.toBeInvited}) : super(key: key);

  final Contact contact;
  final bool isGroup;
  final bool toBeInvited;

  @override
  ContactCardWidgetState createState() => ContactCardWidgetState();
}

class ContactCardWidgetState extends State<ContactCardWidget> {
  CheckboxState _checkboxState = CheckboxState.unchecked;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddContactsGroupsViewModel>(context);
    return ListTile(
      onTap: () {
        setState(() {
          _checkboxState = _checkboxState == CheckboxState.checked
              ? CheckboxState.unchecked
              : CheckboxState.checked;
        });
        viewModel.onTapContact(_checkboxState == CheckboxState.checked, widget.isGroup,widget.toBeInvited);
      },
      title: Text(widget.contact.displayName ?? ''),
      subtitle: Text(
        widget.contact.phones!.isNotEmpty ? widget.contact.phones!.first.value ?? '' : '',
      ),
        leadingAndTrailingTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
      trailing: widget.toBeInvited
      ? const Text("invite")
      : widget.isGroup
          ? Checkbox(
        side: BorderSide.none,
        value: _checkboxState == CheckboxState.checked,
        onChanged: (val) {
          setState(() {
            _checkboxState = val ?? false ? CheckboxState.checked : CheckboxState.unchecked;
          });
          viewModel.onTapContact(val ?? false, widget.isGroup,widget.toBeInvited);
        },
      )
          : null,
    );
  }
}