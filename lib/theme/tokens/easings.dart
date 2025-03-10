import 'package:flutter/material.dart';

class Easings {
  static const Cubic entranceEffective = Cubic(0.0, 0.0, 0.2, 1.0);
  static const Cubic standardEffective = Cubic(0.3, 0.0, 0.2, 1.0);
  static const Cubic exitEffective = Cubic(0.17, 0.0, 1.0, 1.0);
  static const Cubic entranceRevealing = Cubic(0.0, 0.0, 0.0, 1.0);
  static const Cubic standardRevealing = Cubic(0.5, 0.0, 0.0, 1.0);
  static const Cubic exitRevealing = Cubic(0.5, 0.0, 1.0, 1.0);
  static const Cubic entranceAttentive = Cubic(0.5, 0.0, 0.3, 1.5);
  static const Cubic exitAttentive = Cubic(0.7, 0.0, 0.5, 1.0);
  static const Cubic standardWary = Cubic(1.0, 0.5, 0.0, 0.5);
}
