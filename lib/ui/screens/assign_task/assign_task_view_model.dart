import 'package:flutter/material.dart';
import 'package:tu_kar/services/storage/firebase_storage.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';


class AssignTaskViewModel extends ChangeNotifier{
  final _formKey = GlobalKey<FormState>();
   final TextEditingController _taskController = TextEditingController();
   final TextEditingController _tipsController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
  String _dropDownValue =  '';
  final List<String> _items = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
  ];
  final _firebaseStorage = FirebaseStorage();


  get taskController => _taskController;
  get tipsController => _tipsController;
  get descriptionController => _descriptionController;
  get amountController => _amountController;
  get formKey => _formKey;
  get dropDownValue => _dropDownValue;
  get items => _items;





 void assignAmount(){
   if(_amountController.text.isEmpty)
     {
       _amountController.text = "345";
     }
  }


  String? showInvalidError(String? value){
      if (value == null || value.isEmpty) {
        return StringConstants.invalidError;
      }
      return null;
  }

  void onChangedDropDown(String? newValue){
    _dropDownValue = newValue!;
  }

  void onPressAssignTask(BuildContext context){
    if (_formKey.currentState!.validate())
    {
      Map<String,dynamic> task = {
        'task' :  _dropDownValue,
        'description' : _descriptionController.text,
        'amount': _amountController.text,
        'tip': _tipsController.text,
      };
      _firebaseStorage.addTask(task);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }
}