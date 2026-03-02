import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';

class AssignmentDetailPage extends StatefulWidget {
  final Map<String, dynamic>? assignment;
  
  const AssignmentDetailPage({super.key, this.assignment});

  @override
  State<AssignmentDetailPage> createState() => _AssignmentDetailPageState();
}

class _AssignmentDetailPageState extends State<AssignmentDetailPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
                    _buildMainCard(),
                    const SizedBox(height: 12),
                    _buildSectionTitle('Topshiriq uchun izohi'),
                    const SizedBox(height: 8),
                    _buildCommentInputCard(),
                    const SizedBox(height: 12),
                    _buildSectionTitle('Fayl yuklash'),
                    const SizedBox(height: 8),
                    _buildFileUploadCard(),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(),
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

  Widget _buildMainCard() {
    final title = widget.assignment?['title'] ?? 'Savdoni 2x oshirish';
    final assignedBy = widget.assignment?['assignedBy'] ?? 'Jenny Wilson';
    final description = widget.assignment?['description'] ?? 
        'AGSMEISE: Loan Application Cumbersome, EDIs Frustrating Scheme "APSAN under my leadership will continue to protect the interest of her';
    
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.cxBlack,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Topshiriq beruvchi:', assignedBy),
          const SizedBox(height: 12),
          _buildInfoRow(
            'Topshiriq mazmuni:',
            description,
            isMultiline: true,
          ),
          const SizedBox(height: 12),
          const Text(
            'Fayl:',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.cxBlack,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.borderGray,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/1.jpg',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.cxWhite,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.backgroundLight, width: 1),
                      ),
                      child: const Center(
                        child: Text(
                          '+3',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cxBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.cxBlack,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textGray,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.cxBlack,
      ),
    );
  }

  Widget _buildCommentInputCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _commentController,
        maxLines: 4,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '',
          hintStyle: TextStyle(
            fontSize: 13,
            color: AppColors.textGray,
          ),
        ),
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.cxBlack,
        ),
      ),
    );
  }

  Widget _buildFileUploadCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.attach_file,
            size: 20,
            color: AppColors.textGray,
          ),
          SizedBox(width: 8),
          Text(
            'rasm, fayl, video',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundLight,
                  foregroundColor: AppColors.textGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Bajarmadim',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
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
                  'Bajardim',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
