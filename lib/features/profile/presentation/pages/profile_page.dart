import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:domu/core/constants/app_colors.dart';
import 'package:domu/core/constants/app_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    _buildProfileCard(),
                    const SizedBox(height: 12),
                    _buildSalaryRow(),
                    const SizedBox(height: 12),
                    _buildKarieraCard(),
                    const SizedBox(height: 12),
                    _buildSozlamalarCard(),
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
            'Profil',
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

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 44,
            backgroundColor: AppColors.borderGray,
            child: ClipOval(
              child: Image.network(
                'https://randomuser.me/api/portraits/women/44.jpg',
                width: 88,
                height: 88,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 44, color: AppColors.textGray),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Jamila Qurbonaliyeva',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.cxBlack,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(),
              const SizedBox(width: 4),
              const Text(
                'Sales menejer',
                style: TextStyle(fontSize: 13, color: AppColors.textGray),
              ),
              const SizedBox(width: 10),
              _dot(),
              const SizedBox(width: 4),
              const Text(
                'Global stroy',
                style: TextStyle(fontSize: 13, color: AppColors.textGray),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'ID 6783',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.cxFF462E,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: AppColors.textGray,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSalaryRow() {
    return Row(
      children: [
        Expanded(child: _buildOylikCard()),
        const SizedBox(width: 12),
        Expanded(child: _buildAvansCard()),
      ],
    );
  }

  Widget _buildOylikCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Oylik',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.cxBlack),
          ),
          const SizedBox(height: 4),
          const Text(
            'Yanvar 2026',
            style: TextStyle(fontSize: 12, color: AppColors.textGray),
          ),
          const SizedBox(height: 16),
          const Text(
            '300 c.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.cxBlack),
          ),
          const SizedBox(height: 2),
          const Text(
            'Jarima: 50 c.',
            style: TextStyle(fontSize: 12, color: AppColors.cxFF462E),
          ),
        ],
      ),
    );
  }

  Widget _buildAvansCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Avans',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.cxBlack),
          ),
          const SizedBox(height: 4),
          const Text(
            'Yanvar 2026',
            style: TextStyle(fontSize: 12, color: AppColors.textGray),
          ),
          const SizedBox(height: 16),
          const Text(
            '3 600 000',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textGray),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _buildKarieraCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kariera',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.cxBlack),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ishdagi rivojlanish bosqichlari',
                  style: TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
                const Text(
                  'Lavozim pog\'onalari',
                  style: TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppIcons.trophy,
            width: 64,
            height: 64,
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: AppColors.textGray, size: 22),
        ],
      ),
    );
  }

  Widget _buildSozlamalarCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.productivity,
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Sozlamalar',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.cxBlack),
                ),
                SizedBox(height: 2),
                Text(
                  'Qorong\'u rejim, chiqish, til...',
                  style: TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textGray, size: 22),
        ],
      ),
    );
  }
}
