import 'package:flutter/foundation.dart';

class SkillProvider with ChangeNotifier {
  String? _activeSkill;

  String? get activeSkill => _activeSkill;

  void setActiveSkill(String skillName) {
    _activeSkill = skillName;
    notifyListeners();
  }

  void clearActiveSkill() {
    _activeSkill = null;
    notifyListeners();
  }
}



