import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';

class WorkEntryPage extends StatefulWidget {
  const WorkEntryPage({super.key});

  @override
  State<WorkEntryPage> createState() => _WorkEntryPageState();
}

class _WorkEntryPageState extends State<WorkEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildStatusRow('Hozirgi status:', 'ishda', AppColors.cx30B94D, true),
                    const SizedBox(height: 6),
                    _buildStatusRow('Keyingi harakat:', 'ishdan chiqish', AppColors.textGray, false),
                    const SizedBox(height: 24),
                    _buildCameraCard(),
                  ],
                ),
              ),
            ),
            _buildBottomButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.cxWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.chevron_left, size: 24, color: AppColors.cxBlack),
              ),
            ),
          ),
          const Text(
            'Face ID',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.cxBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color dotColor, bool filled) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.cxBlack,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: filled ? dotColor : Colors.transparent,
            shape: BoxShape.circle,
            border: filled ? null : Border.all(color: dotColor, width: 1.5),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: dotColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCameraCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Yuzingizni romka ichiga joylashtiring',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textGray,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderGray, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 56,
                  color: AppColors.textGray,
                ),
                SizedBox(height: 12),
                Text(
                  'Kamera',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cxFF462E,
            foregroundColor: AppColors.cxWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Yuzni suratga olish',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
