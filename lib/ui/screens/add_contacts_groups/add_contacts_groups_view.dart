import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view_model.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/widgets/contact_card.dart';
import 'package:tu_kar/ui/widgets/search_bar_widget.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class AddContactsGroupsView extends StatefulWidget {
  const AddContactsGroupsView({super.key, required this.isGroup});

  final bool isGroup;

  @override
  AddContactsGroupsViewState createState() => AddContactsGroupsViewState();
}

class AddContactsGroupsViewState extends State<AddContactsGroupsView> {
  late Future<void> _loadContacts;

  @override
  void initState() {
    super.initState();
    final viewModel =
        Provider.of<AddContactsGroupsViewModel>(context, listen: false);
    _loadContacts = viewModel.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddContactsGroupsViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: widget.isGroup ? 0.3.sh : 0.2.sh,
            width: 1.sw,
            padding: EdgeInsets.symmetric(vertical: 0.01.sh, horizontal: 10),
            color: AppColors.primaryColor,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const BackButton(
                        color: AppColors.whiteColor,
                      ),
                      0.3.sw.widthSizedBox,
                      Text(
                          "Add ${widget.isGroup ? StringConstants.groups : StringConstants.friends}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                  widget.isGroup ? isGroupBar() : const SizedBox.shrink(),
                  const SearchBarWidget(),
                ],
              ),
            ),
          ),
          contactList(viewModel),
          widget.isGroup
              ? ThemeButton(
                  title: "Done",
                  onTap: () {},
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget contactList(AddContactsGroupsViewModel viewModel) {
    return Expanded(
      child: FutureBuilder(
        future: _loadContacts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              debugPrint('Error: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListView(
              children: [
                giveContacts(viewModel.userContacts, false),
                Container(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.04.sw, vertical: 0.05.sh),
                    child: Text(
                      StringConstants.inviteYourBuddiesBruh,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.whiteColor),
                    )),
                giveContacts(viewModel.notUserContacts, true),
              ],
            );
          } else {
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()]);
          }
        },
      ),
    );
  }

  Widget giveContacts(List<Contact> contacts, bool toBeInvited) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contacts.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 0.5,
          color: AppColors.greyColor,
          indent: 0.05.sw,
          endIndent: 0.1.sw),
      itemBuilder: (context, index) {
        Contact contact = contacts[index];
        return ContactCardWidget(
          contact: contact,
          isGroup: widget.isGroup,
          toBeInvited: toBeInvited,
        );
      },
    );
  }

  Widget isGroupBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConstants.groupName,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: AppColors.whiteColor),
        ),
        SizedBox(
            width: 0.62.sw,
            height: 0.05.sh,
            child: TextFormField(
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0.01.sh, horizontal: 0.04.sw),
                border: InputBorder.none,
              ),
            )).paddingSymmetric(horizontal: 10, vertical: 0.03.sh),
      ],
    );
  }
}
