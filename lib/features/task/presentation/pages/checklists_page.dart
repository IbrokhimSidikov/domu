import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';

class ChecklistsPage extends StatefulWidget {
  const ChecklistsPage({super.key});

  @override
  State<ChecklistsPage> createState() => _ChecklistsPageState();
}

class _ChecklistsPageState extends State<ChecklistsPage> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _buildMonthSelector(),
                    const SizedBox(height: 12),
                    if (_isExpanded) ...[
                      _buildChecklistCard(),
                      const SizedBox(height: 12),
                      _buildStatsCard(),
                    ],
                  ],
                ),
              ),
            ),
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
            'Topshiriqlar',
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

  Widget _buildMonthSelector() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Mening checklistlarim',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cxBlack,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 ta topshiriq topildi',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textGray,
                      ),
                    ),
                  ],
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.cxBlack,
                  size: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chevron_left, color: AppColors.cxFF462E, size: 20),
              const SizedBox(width: 16),
              const Text(
                'Yanvar 2026',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textGray,
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.chevron_right, color: AppColors.cxFF462E, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCard() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cxWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.list_alt,
                color: AppColors.textGray,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sales manager checklist',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '21-01-2026',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textGray,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.cx30B94D,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Bajarilgan',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.cxWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textGray, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sales manager checklist',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.cxFF462E,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatRow(Icons.person_outline, "Ro'l:", 'Savdo menejeri'),
          const SizedBox(height: 12),
          _buildStatRow(Icons.list_alt_outlined, 'Umumiy vazifalar:', '17'),
          const SizedBox(height: 12),
          _buildStatRow(Icons.check_circle_outline, 'Bajarilgan:', '8'),
        ],
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textGray),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.cxBlack,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.cxBlack,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
