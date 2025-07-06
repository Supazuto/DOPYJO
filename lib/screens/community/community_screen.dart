import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/glass_morphism_container.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Community',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          GlassMorphismContainer(
            borderRadius: 12,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.primary.withValues(alpha: 0.2),
            child: IconButton(
              onPressed: () {
                // Create new post
              },
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GlassMorphismContainer(
              borderRadius: 16,
              blur: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.2),
                width: 1,
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'Search posts, topics, or users...',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Tab bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GlassMorphismContainer(
              borderRadius: 16,
              blur: 8,
              padding: const EdgeInsets.all(4),
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.2),
                width: 1,
              ),
              child: Row(
                children: [
                  Expanded(child: _buildTabButton('For You', 0)),
                  Expanded(child: _buildTabButton('Trending', 1)),
                  Expanded(child: _buildTabButton('My Groups', 2)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Content
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: GlassMorphismContainer(
        borderRadius: 12,
        blur: 5,
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: isSelected
            ? AppColors.primary.withValues(alpha: 0.3)
            : Colors.transparent,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildForYouContent();
      case 1:
        return _buildTrendingContent();
      case 2:
        return _buildMyGroupsContent();
      default:
        return _buildForYouContent();
    }
  }

  Widget _buildForYouContent() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildPostCard(index);
      },
    );
  }

  Widget _buildTrendingContent() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildTrendingCard(index);
      },
    );
  }

  Widget _buildMyGroupsContent() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildGroupCard(index);
      },
    );
  }

  Widget _buildPostCard(int index) {
    final posts = [
      {
        'author': 'Sarah Johnson',
        'avatar': 'SJ',
        'time': '2 hours ago',
        'content':
            'Just completed my 30-day fitness challenge! Lost 5kg and feeling amazing. Anyone else doing similar challenges?',
        'likes': 24,
        'comments': 8,
        'shares': 3,
        'topic': 'Fitness Journey',
      },
      {
        'author': 'Mike Chen',
        'avatar': 'MC',
        'time': '4 hours ago',
        'content':
            'New healthy recipe alert! 🥗 This Mediterranean quinoa bowl is packed with protein and flavor. Recipe in comments!',
        'likes': 42,
        'comments': 15,
        'shares': 7,
        'topic': 'Healthy Recipes',
      },
      {
        'author': 'Dr. Emily Rodriguez',
        'avatar': 'ER',
        'time': '6 hours ago',
        'content':
            'Important reminder: Regular blood sugar monitoring is crucial for diabetes management. What\'s your monitoring routine?',
        'likes': 67,
        'comments': 23,
        'shares': 12,
        'topic': 'Health Tips',
      },
    ];

    final post = posts[index % posts.length];

    return GlassMorphismContainer(
      borderRadius: 20,
      blur: 8,
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header
          Row(
            children: [
              GlassMorphismContainer(
                borderRadius: 25,
                blur: 5,
                padding: const EdgeInsets.all(2),
                backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                child: CircleAvatar(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.3),
                  child: Text(
                    post['avatar'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['author'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      post['time'] as String,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              GlassMorphismContainer(
                borderRadius: 12,
                blur: 5,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
                child: Text(
                  post['topic'] as String,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Post content
          Text(
            post['content'] as String,
            style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),

          const SizedBox(height: 20),

          // Post actions
          Row(
            children: [
              _buildActionButton(
                Icons.favorite_border,
                '${post['likes']}',
                () {},
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                Icons.comment_outlined,
                '${post['comments']}',
                () {},
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                Icons.share_outlined,
                '${post['shares']}',
                () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCard(int index) {
    final trendingTopics = [
      'Diabetes Management Tips',
      'Healthy Meal Prep Ideas',
      'Exercise for Beginners',
      'Mental Health & Wellness',
      'Weight Loss Success Stories',
    ];

    return GlassMorphismContainer(
      borderRadius: 16,
      blur: 8,
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: 20,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.accent.withValues(alpha: 0.15),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trendingTopics[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${(index + 1) * 15} posts today',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.trending_up, color: AppColors.accent, size: 20),
        ],
      ),
    );
  }

  Widget _buildGroupCard(int index) {
    final groups = [
      {
        'name': 'Diabetes Support Group',
        'members': 1247,
        'description': 'A supportive community for people managing diabetes',
      },
      {
        'name': 'Fitness Enthusiasts',
        'members': 892,
        'description': 'Share workout routines and fitness tips',
      },
      {
        'name': 'Healthy Eating Community',
        'members': 1563,
        'description': 'Healthy recipes and nutrition advice',
      },
    ];

    final group = groups[index];

    return GlassMorphismContainer(
      borderRadius: 20,
      blur: 8,
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GlassMorphismContainer(
                borderRadius: 25,
                blur: 5,
                padding: const EdgeInsets.all(2),
                backgroundColor: AppColors.accent.withValues(alpha: 0.2),
                child: CircleAvatar(
                  backgroundColor: AppColors.accent.withValues(alpha: 0.3),
                  child: const Icon(Icons.group, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${group['members']} members',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              GlassMorphismContainer(
                borderRadius: 12,
                blur: 5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
                child: const Text(
                  'View',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            group['description'] as String,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
