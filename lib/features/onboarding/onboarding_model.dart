// lib/features/onboarding/onboarding_model.dart
import 'package:flutter/material.dart';

class PurusharthaPage {
  final String title;
  final String philosophy;
  final String productReminder;
  final IconData icon;

  const PurusharthaPage({
    required this.title,
    required this.philosophy,
    required this.productReminder,
    required this.icon,
  });
}

const List<PurusharthaPage> purusharthaData = [
  PurusharthaPage(
    title: 'DHARMA',
    philosophy: 'Your ultimate purpose, duty, and moral righteousness alignment.',
    productReminder: 'Our Core Tees feature structural minimalist patterns—serving as a constant tactile anchor to your daily responsibilities.',
    icon: Icons.gavel_rounded,
  ),
  PurusharthaPage(
    title: 'ARTHA',
    philosophy: 'The noble pursuit of wealth, skills, and material prosperity.',
    productReminder: 'Designed with ultra-durable, premium heavyweight fabrics built for execution, security, and relentless wealth creation.',
    icon: Icons.account_balance_wallet_rounded,
  ),
  PurusharthaPage(
    title: 'KAMA',
    philosophy: 'The celebration of desires, creative passions, art, and love.',
    productReminder: 'Tailored luxury silhouettes boasting vibrant, expressive tones that seamlessly fuse elegance with personal expression.',
    icon: Icons.favorite_rounded,
  ),
  PurusharthaPage(
    title: 'MOKSHA',
    philosophy: 'The zenith of liberation, self-realization, and absolute inner freedom.',
    productReminder: 'Crafted from ethereal, breathable organic blends designed to strip away distraction and focus completely on pure being.',
    icon: Icons.wb_sunny_rounded,
  ),
];
