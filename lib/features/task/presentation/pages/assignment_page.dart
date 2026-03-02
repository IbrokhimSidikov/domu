import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  final List<Map<String, dynamic>> _assignments = [
    {
      'title': 'Savdoni 2x oshirish',
      'date': '13.01.2026',
      'status': 'Yangi',
      'statusColor': AppColors.cx2870E4,
      'assignedBy': 'Jenny Wilson',
      'description': 'AGSMEISE: Loan Application Cumbersome, EDIs Frustrating Scheme "APSAN under my leadership will continue to protect the interest of her',
    },
    {
      'title': "Mijozlarni ehtyojini o'rganish...",
      'date': '13.01.2026',
      'status': 'Bajarildi',
      'statusColor': AppColors.cx30B94D,
      'assignedBy': 'John Doe',
      'description': "Mijozlarning ehtiyojlarini o'rganish va ularning talablariga javob berish uchun strategiya ishlab chiqish",
    },
    {
      'title': "Mijozlarni ehtyojini o'rganish...",
      'date': '13.01.2026',
      'status': 'Bajarilmadi',
      'statusColor': AppColors.cxFF462E,
      'assignedBy': 'Sarah Smith',
      'description': "Bozor tadqiqotlari o'tkazish va raqobatchilarni tahlil qilish orqali mijozlar ehtiyojlarini aniqlash",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _assignments.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildAssignmentCard(_assignments[index]);
                },
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
      child: Row(
        children: [
          GestureDetector(
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
          const Expanded(
            child: Text(
              'Topshiriqlar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.cxBlack,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cxWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.filter_list, size: 22, color: AppColors.cxBlack),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard(Map<String, dynamic> assignment) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.assignmentDetailPage, extra: assignment);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cxWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignment['title'],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.cxBlack,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Sana',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  assignment['date'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.cxBlack,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Status',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: assignment['statusColor'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    assignment['status'],
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.cxWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
