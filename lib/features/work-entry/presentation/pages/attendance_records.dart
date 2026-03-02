import 'package:flutter/material.dart';
import 'package:domu/core/constants/app_colors.dart';

class AttendanceRecords extends StatefulWidget {
  const AttendanceRecords({super.key});

  @override
  State<AttendanceRecords> createState() => _AttendanceRecordsState();
}

class _AttendanceRecordsState extends State<AttendanceRecords> {
  final List<Map<String, dynamic>> _records = [
    {'date': '21-01-2026', 'time': '11:30', 'late': '10m', 'emoji': '😊'},
    {'date': '20-01-2026', 'time': '11:30', 'late': '0m', 'emoji': '😊'},
    {'date': '19-01-2026', 'time': '11:30', 'late': '1m', 'emoji': '😊'},
    {'date': '18-01-2026', 'time': '-', 'late': '-', 'emoji': ''},
    {'date': '17-01-2026', 'time': '11:30', 'late': '2m', 'emoji': '😡'},
    {'date': '16-01-2026', 'time': '11:30', 'late': '2m', 'emoji': '😊'},
    {'date': '15-01-2026', 'time': '11:30', 'late': '9m', 'emoji': '😊'},
    {'date': '14-01-2026', 'time': '11:30', 'late': '0m', 'emoji': '😊'},
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
                  children: [
                    const SizedBox(height: 8),
                    _buildMonthSelector(),
                    const SizedBox(height: 16),
                    _buildTableHeader(),
                    const SizedBox(height: 8),
                    ..._records.map((record) => _buildRecordRow(record)),
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
            'Davomat',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Keldi-ketdi tarixi',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cxBlack,
                ),
              ),
              Icon(Icons.refresh, color: AppColors.cxFF462E, size: 22),
            ],
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

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Text(
              'Sana',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Kirish',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Chiqish',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Kechikish',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Kayfiyat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordRow(Map<String, dynamic> record) {
    final bool isLate = record['late'] != '-' && record['late'] != '0m';
    final Color lateColor = record['late'] == '0m' 
        ? AppColors.textGray 
        : (isLate ? AppColors.cxFF462E : AppColors.textGray);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              record['date'],
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.cxBlack,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              record['time'],
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.cxBlack,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.cxBlack,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              record['late'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: lateColor,
                fontWeight: isLate ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              record['emoji'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
