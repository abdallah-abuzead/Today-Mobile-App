class Language {
  String? name;
  bool isChecked;

  Language({required this.name, this.isChecked = false});

  void toggleIsChecked() {
    this.isChecked = !this.isChecked;
  }
}
