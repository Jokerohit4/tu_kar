import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/assign_task/assign_task_view_model.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class AssignTaskView extends StatefulWidget {
  const AssignTaskView({super.key, required this.name});
  final String name;

  @override
  State<AssignTaskView> createState() => _AssignTaskViewState();
}

class _AssignTaskViewState extends State<AssignTaskView> {

  late AssignTaskViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<AssignTaskViewModel>(context,listen: false);
    viewModel.assignAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: viewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height:  0.18.sh ,
                width: 1.sw,
                padding: EdgeInsets.symmetric(vertical: 0.01.sh,horizontal: 10),
                decoration : const BoxDecoration(
                 color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor,
                      offset: Offset(0,4),
                      blurRadius: 2,
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const BackButton(color: AppColors.blackColor,),
                          0.23.sw.widthSizedBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              0.03.sh.heightSizedBox,
                              Text( widget.name,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.blackColor)),
                              0.01.sh.heightSizedBox,
                              Text( "9354859197",style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.blackColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              0.03.sh.heightSizedBox,
              field(StringConstants.task, StringConstants.taskHintText,viewModel.taskController,context),
              field(StringConstants.description,StringConstants.description,viewModel.descriptionController,context),
              field(StringConstants.amount,StringConstants.amountHintText,viewModel.amountController,context),
              field(StringConstants.tip, StringConstants.tipHintText,viewModel.tipsController,context),
              0.03.sh.heightSizedBox,
              ThemeButton(title: StringConstants.assignTask, onTap: () => viewModel.onPressAssignTask(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(String fieldName,String hintText,TextEditingController controller,  BuildContext context,){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 0.3.sw,child: Text(fieldName,style: Theme.of(context).textTheme.labelLarge)),
       10.w.widthSizedBox,
        Container(
          width: 0.5.sw,
          height: fieldName == StringConstants.description ? 0.3.sh : null,
          margin: EdgeInsets.symmetric(vertical: 0.02.sh,horizontal: 0.05.sw),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.greyWalaShade,
          ),
         child: fieldName != StringConstants.task
     ? TextFormField(
           readOnly: fieldName == StringConstants.amount ? true : false ,
           controller: controller,
           keyboardType: fieldName == StringConstants.tip  ? TextInputType.number : null,
           decoration:  InputDecoration(
             contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 25),
             hintText: hintText,
             hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.greyColor),
             border: InputBorder.none,
             enabledBorder: InputBorder.none,
             focusedBorder: fieldName == StringConstants.description ? InputBorder.none : null,
           ),
           validator: (value) => viewModel.showInvalidError(value),
       )
             : taskDropDown(),
       ),
      ],
    );
  }

  Widget taskDropDown(){
    return DropdownButtonFormField<String>(
     value: viewModel.dropDownValue.isEmpty ? null : viewModel.dropDownValue,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 16,
      hint: Text(StringConstants.taskHintText,style :Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.greyColor)),
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.blackColor),
      validator: (value) => viewModel.showInvalidError(value),
      onChanged: (String? newValue) => setState(() => viewModel.onChangedDropDown(newValue)),
      items: viewModel.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
