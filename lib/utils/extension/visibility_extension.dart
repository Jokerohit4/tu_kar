part of 'extension.dart';

///
/// Extension Method for the [Visibility] Widget
///
extension VisibilityX on Widget {
  Visibility visibility({bool visible = true}) => Visibility(
        key: key,
        visible: visible,
        child: this,
      );
}
