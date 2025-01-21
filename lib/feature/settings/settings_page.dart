import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSettingItem(
            icon: Icons.settings_outlined,
            title: 'General settings',
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy status',
          ),
          _buildSettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
          ),
          _buildSettingItem(
            icon: Icons.email_outlined,
            title: 'Emails',
          ),
          _buildSettingItem(
            icon: Icons.subscriptions_outlined,
            title: 'Subscriptions',
          ),
          _buildSettingItem(
            icon: Icons.password_outlined,
            title: 'Change password',
          ),
          _buildSettingItem(
            icon: Icons.wifi_outlined,
            title: 'Networks',
          ),
          _buildSettingItem(
            icon: Icons.logout_outlined,
            title: 'Log out',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      onTap: () {
        // Handle navigation or action
      },
    );
  }
}
