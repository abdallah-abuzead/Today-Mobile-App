import 'package:get/get.dart';
import 'package:today/models/language.dart';

class LanguageController extends GetxController {
  //Loading Indicator
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void set isLoading(bool newValue) {
    _isLoading = newValue;
    update();
  }

  //Camera Indicator
  bool _camera = false;
  bool get camera => _camera;
  void set camera(bool newValue) {
    _camera = newValue;
    update();
  }

  //Google Ml Kit Indicator
  bool _mlKit = true;
  bool get mlKit => _mlKit;
  void set mlKit(bool newValue) {
    _mlKit = newValue;
    update();
  }

  List<Language> languages = [
    Language(name: 'ara', isChecked: true),
    Language(name: 'eng'),
  ];

  void updateLanguage(Language language) {
    language.toggleIsChecked();
    update();
  }
}
