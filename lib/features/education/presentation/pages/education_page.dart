import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Mijoz turlari',
      'description':
          'Mijozlarni qanday qilib qulay onson va foydali harid qilishlari uchun sharoit qilib berish',
      'duration': '15 min',
      'tests': '12 test',
      'score': '57%',
    },
    {
      'title': 'Qanday sotuvchi pro?',
      'description':
          'Mijozlarni qanday qilib qulay onson va foydali harid qilishlari uchun sharoit qilib berish',
      'duration': '15 min',
      'tests': '12 test',
      'score': '57%',
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildHeaderCard(),
                    const SizedBox(height: 12),
                    ..._courses.map((course) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildCourseCard(course),
                        )),
                    const SizedBox(height: 16),
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
            "Ta'lim",
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

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Treyninglar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cxBlack,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Video darsliklar va testlar',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),
          const Text(
            '2',
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

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cxBlack,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  course['description'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildBadge(
                      icon: Icons.access_time,
                      label: course['duration'],
                      color: AppColors.cx2870E4,
                    ),
                    const SizedBox(width: 8),
                    _buildBadge(
                      icon: Icons.edit_outlined,
                      label: course['tests'],
                      color: AppColors.cxFF9437,
                    ),
                    const SizedBox(width: 8),
                    _buildBadge(
                      icon: Icons.emoji_events_outlined,
                      label: course['score'],
                      color: AppColors.cx30B94D,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: AppColors.textGray, size: 22),
        ],
      ),
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
