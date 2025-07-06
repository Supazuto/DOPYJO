import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/glass_morphism_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // Add some sample messages
    _messages.addAll([
      ChatMessage(
        text:
            'Hello! How can I help you with your health and fitness goals today?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        text: 'I want to create a workout plan for weight loss',
        isUser: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      ChatMessage(
        text:
            'Great! I\'ll help you create a personalized workout plan. What\'s your current fitness level?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ]);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: const Text('AI Health Assistant'),
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
                Icons.more_vert,
                color: isDark ? AppColors.textPrimaryDark : Colors.white,
              ),
              onPressed: () {
                // TODO: Show chat options
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
        child: Column(
          children: [
            // Welcome Message
            GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusXLarge,
              blur: 10,
              margin: const EdgeInsets.all(AppConstants.paddingMedium),
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              backgroundColor: isDark
                  ? AppColors.surfaceDark.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
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
                  GlassMorphismContainer(
                    borderRadius: 25,
                    blur: 8,
                    padding: const EdgeInsets.all(12),
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.smart_toy,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  Text(
                    'AI Health Assistant',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  Text(
                    'Ask me anything about health, fitness, and nutrition!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Workout Plan',
                      Icons.fitness_center,
                      AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Nutrition Advice',
                      Icons.restaurant,
                      AppColors.success,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Health Tips',
                      Icons.health_and_safety,
                      AppColors.info,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.paddingMedium),

            // Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),

            // Input Section
            GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusXLarge,
              blur: 10,
              margin: const EdgeInsets.all(AppConstants.paddingMedium),
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              backgroundColor: isDark
                  ? AppColors.surfaceDark.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.15),
              border: Border.all(
                color: isDark
                    ? AppColors.borderDark.withValues(alpha: 0.2)
                    : Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondary,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusMedium,
                    blur: 5,
                    padding: const EdgeInsets.all(8),
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      onPressed: _sendMessage,
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

  Widget _buildQuickActionButton(String title, IconData icon, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusMedium,
      blur: 5,
      padding: const EdgeInsets.symmetric(vertical: 8),
      backgroundColor: color.withValues(alpha: 0.1),
      border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            GlassMorphismContainer(
              borderRadius: 20,
              blur: 5,
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: Icon(Icons.smart_toy, color: AppColors.primary, size: 16),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusLarge,
              blur: 8,
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              backgroundColor: message.isUser
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : (isDark
                        ? AppColors.surfaceDark.withValues(alpha: 0.15)
                        : Colors.white.withValues(alpha: 0.15)),
              border: Border.all(
                color: message.isUser
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : (isDark
                          ? AppColors.borderDark.withValues(alpha: 0.2)
                          : Colors.white.withValues(alpha: 0.2)),
                width: 1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            GlassMorphismContainer(
              borderRadius: 20,
              blur: 5,
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.accent.withValues(alpha: 0.1),
              child: Icon(Icons.person, color: AppColors.accent, size: 16),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(
          ChatMessage(
            text: _messageController.text,
            isUser: true,
            timestamp: DateTime.now(),
          ),
        );
      });
      _messageController.clear();

      // Simulate AI response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(
            ChatMessage(
              text:
                  'Thank you for your message! I\'m here to help you with your health and fitness journey.',
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
        });
      });
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
