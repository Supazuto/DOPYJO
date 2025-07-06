# DOPYJO Navigation Guide

## Overview
This document describes the new animated navigation system implemented in DOPYJO app with enhanced user experience and smooth animations.

## Features

### 1. Simple App Bar
- **Clean Design**: Shows only "DOPYJO" app name aligned to the left
- **Notification Icon**: Glass morphism notification button on the right
- **Theme Aware**: Automatically adapts to light/dark theme
- **Minimal Height**: Optimized 60px height for better content space

### 2. Animated Bottom Navigation
- **Smart Labels**: Labels appear when tapped and hide automatically
- **Height Animation**: Navigation bar height changes smoothly (60px ↔ 80px)
- **Icon Animations**: Icons scale and glow when selected
- **Auto-Hide**: Labels disappear after 2 seconds of inactivity
- **Toggle Function**: Tap same item to toggle label visibility

## Navigation Items

| Icon | Label | Screen |
|------|-------|--------|
| 📊 | Dashboard | DashboardScreen |
| 🍽️ | Food | FoodScreen |
| 💪 | Exercise | ExerciseScreen |
| 💬 | Chat | ChatScreen |
| ⋯ | More | MoreScreen |

## Animation Details

### Height Animation
- **Normal State**: 60px height, icons only
- **Active State**: 80px height, icons + labels
- **Duration**: 300ms with easeInOut curve

### Icon Animations
- **Scale**: Selected icons scale to 1.1x
- **Glow Effect**: Selected icons have subtle shadow
- **Color Change**: Selected icons use primary color
- **Duration**: 200ms for scale, 300ms for container

### Label Animations
- **Fade In/Out**: Smooth opacity transitions
- **Auto-Hide**: Disappears after 2 seconds
- **Toggle**: Tap same item to show/hide labels

## Usage Examples

### Using SimpleAppBar
```dart
// Basic usage
appBar: const SimpleAppBar(),

// With custom title
appBar: const SimpleAppBar(title: 'Custom Title'),

// Without notification icon
appBar: const SimpleAppBar(showNotificationIcon: false),

// With back button
appBar: const SimpleAppBar(showBackButton: true),
```

### Using AnimatedBottomNavigation
```dart
// Basic usage
bottomNavigationBar: AnimatedBottomNavigation(
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  items: navigationItems,
),

// Custom navigation items
final navigationItems = [
  BottomNavigationItem(icon: Icons.home, label: 'Home'),
  BottomNavigationItem(icon: Icons.settings, label: 'Settings'),
];
```

## Behavior Patterns

### 1. First Tap
- User taps any navigation item
- Labels appear with smooth animation
- Height increases to accommodate labels
- Auto-hide timer starts (2 seconds)

### 2. Same Item Tap
- User taps the currently selected item
- Labels toggle (show if hidden, hide if shown)
- If shown, auto-hide timer resets

### 3. Different Item Tap
- User taps a different navigation item
- Labels appear immediately
- Auto-hide timer starts (2 seconds)

### 4. Auto-Hide
- After 2 seconds of inactivity
- Labels fade out smoothly
- Height decreases to normal size

## Customization

### Colors
The navigation automatically uses theme colors:
- **Light Theme**: White background, dark text
- **Dark Theme**: Dark background, light text
- **Primary Color**: Used for selected items

### Timing
- **Animation Duration**: 300ms for height, 200ms for scale
- **Auto-Hide Delay**: 2 seconds
- **Curve**: easeInOut for smooth transitions

### Sizes
- **Normal Height**: 60px
- **Expanded Height**: 80px
- **Icon Size**: 24px (normal), 28px (selected)
- **Label Font Size**: 10px

## Performance Optimizations

### Memory Management
- **Animation Controllers**: Properly disposed
- **Timers**: Cancelled when widget disposes
- **State Management**: Efficient state updates

### Rendering
- **AnimatedBuilder**: Only rebuilds necessary parts
- **FadeTransition**: Smooth opacity changes
- **AnimatedContainer**: Hardware accelerated animations

## Accessibility

### Screen Reader Support
- **Semantic Labels**: Each item has proper label
- **Focus Management**: Proper focus handling
- **Voice Over**: Compatible with iOS VoiceOver

### Visual Accessibility
- **High Contrast**: Clear color differences
- **Large Touch Targets**: Minimum 44px touch area
- **Clear Icons**: Recognizable iconography

## Troubleshooting

### Common Issues

1. **Labels Not Appearing**
   - Check if animation controller is properly initialized
   - Verify tap handling is working
   - Ensure widget is properly mounted

2. **Animation Stuttering**
   - Check for heavy operations in build method
   - Verify animation curves are appropriate
   - Monitor frame rate in debug mode

3. **Auto-Hide Not Working**
   - Check timer implementation
   - Verify dispose method cancels timers
   - Ensure state updates are working

### Debug Tips
- Use Flutter Inspector to check animation states
- Monitor console for animation logs
- Test on different device sizes
- Verify theme switching works correctly

## Future Enhancements

1. **Haptic Feedback**: Add vibration on tap
2. **Custom Animations**: Allow custom animation curves
3. **Badge Support**: Add notification badges
4. **Gesture Support**: Swipe gestures for navigation
5. **Accessibility**: Enhanced accessibility features

## Conclusion

The new navigation system provides a modern, intuitive user experience with smooth animations and smart behavior. The auto-hide feature keeps the interface clean while providing context when needed.

For questions or issues, refer to the Flutter animation documentation or contact the development team. 