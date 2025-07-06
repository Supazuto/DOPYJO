import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/glass_morphism_container.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 8,
            margin: const EdgeInsets.only(right: AppConstants.marginMedium),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.2),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimary,
              ),
              onPressed: () {
                // TODO: Add new event
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppColors.backgroundDark,
                    AppColors.backgroundDark.withValues(alpha: 0.8),
                  ]
                : [
                    AppColors.background,
                    AppColors.background.withValues(alpha: 0.8),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            children: [
              // Calendar Widget
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 15,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: isDark
                    ? AppColors.surfaceDark.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(
                  color: isDark
                      ? AppColors.borderDark.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Column(
                  children: [
                    // Month Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimary,
                          ),
                          onPressed: () {
                            setState(() {
                              _focusedDate = DateTime(
                                _focusedDate.year,
                                _focusedDate.month - 1,
                              );
                            });
                          },
                        ),
                        Text(
                          '${_getMonthName(_focusedDate.month)} ${_focusedDate.year}',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                              ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimary,
                          ),
                          onPressed: () {
                            setState(() {
                              _focusedDate = DateTime(
                                _focusedDate.year,
                                _focusedDate.month + 1,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),

                    // Calendar Grid
                    _buildCalendarGrid(),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Today's Events
              Text(
                'Today\'s Events',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              _buildEventItem(
                'Morning Workout',
                '7:00 AM',
                Icons.fitness_center,
                AppColors.primary,
              ),
              _buildEventItem(
                'Lunch Meeting',
                '12:00 PM',
                Icons.restaurant,
                AppColors.success,
              ),
              _buildEventItem(
                'Evening Walk',
                '6:00 PM',
                Icons.directions_walk,
                AppColors.accent,
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Upcoming Events
              Text(
                'Upcoming Events',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              _buildUpcomingEvent(
                'Doctor Appointment',
                'Tomorrow, 2:00 PM',
                Icons.medical_services,
              ),
              _buildUpcomingEvent(
                'Gym Session',
                'Friday, 5:00 PM',
                Icons.fitness_center,
              ),
              _buildUpcomingEvent(
                'Weekend Hike',
                'Saturday, 9:00 AM',
                Icons.terrain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
    final lastDayOfMonth = DateTime(
      _focusedDate.year,
      _focusedDate.month + 1,
      0,
    );
    final firstWeekday = firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    // Day headers
    final dayHeaders = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Column(
      children: [
        // Day headers
        Row(
          children: dayHeaders.map((day) {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        // Calendar days
        ...List.generate((daysInMonth + firstWeekday - 1) ~/ 7 + 1, (
          weekIndex,
        ) {
          return Row(
            children: List.generate(7, (dayIndex) {
              final dayNumber = weekIndex * 7 + dayIndex - firstWeekday + 1;
              final isCurrentMonth = dayNumber > 0 && dayNumber <= daysInMonth;
              final isToday =
                  dayNumber == _selectedDate.day &&
                  _focusedDate.month == _selectedDate.month &&
                  _focusedDate.year == _selectedDate.year;
              final isSelected = dayNumber == _selectedDate.day;

              return Expanded(
                child: GestureDetector(
                  onTap: isCurrentMonth
                      ? () {
                          setState(() {
                            _selectedDate = DateTime(
                              _focusedDate.year,
                              _focusedDate.month,
                              dayNumber,
                            );
                          });
                        }
                      : null,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isToday
                          ? AppColors.primary.withValues(alpha: 0.2)
                          : isSelected
                          ? AppColors.accent.withValues(alpha: 0.1)
                          : Colors.transparent,
                      border: isToday
                          ? Border.all(color: AppColors.primary, width: 2)
                          : isSelected
                          ? Border.all(color: AppColors.accent, width: 1)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        isCurrentMonth ? dayNumber.toString() : '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: isToday
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isToday
                              ? AppColors.primary
                              : isSelected
                              ? AppColors.accent
                              : isCurrentMonth
                              ? (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary)
                              : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondary),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }

  Widget _buildEventItem(
    String title,
    String time,
    IconData icon,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassMorphismContainer(
        borderRadius: AppConstants.borderRadiusMedium,
        blur: 5,
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        backgroundColor: isDark
            ? AppColors.surfaceDark.withValues(alpha: 0.1)
            : Colors.white.withValues(alpha: 0.1),
        border: Border.all(
          color: isDark
              ? AppColors.borderDark.withValues(alpha: 0.2)
              : AppColors.border.withValues(alpha: 0.2),
          width: 1,
        ),
        child: Row(
          children: [
            GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusSmall,
              blur: 3,
              padding: const EdgeInsets.all(8),
              backgroundColor: color.withValues(alpha: 0.1),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: AppConstants.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvent(String title, String date, IconData icon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassMorphismContainer(
        borderRadius: AppConstants.borderRadiusMedium,
        blur: 5,
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        backgroundColor: isDark
            ? AppColors.surfaceDark.withValues(alpha: 0.1)
            : Colors.white.withValues(alpha: 0.1),
        border: Border.all(
          color: isDark
              ? AppColors.borderDark.withValues(alpha: 0.2)
              : AppColors.border.withValues(alpha: 0.2),
          width: 1,
        ),
        child: Row(
          children: [
            GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusSmall,
              blur: 3,
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.info.withValues(alpha: 0.1),
              child: Icon(icon, color: AppColors.info, size: 20),
            ),
            const SizedBox(width: AppConstants.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
