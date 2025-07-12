# DOPYJO - Smart Health & Fitness App

## 📱 ภาพรวมโปรเจกต์

**DOPYJO** เป็นแอปพลิเคชันสุขภาพและฟิตเนสอัจฉริยะที่ออกแบบมาเพื่อผู้ที่มีความเสี่ยงด้านสุขภาพ โดยใช้เทคโนโลยี Flutter ในการพัฒนา

### 🎯 วัตถุประสงค์
- ให้คำแนะนำด้านโภชนาการและออกกำลังกายที่เหมาะสม
- ติดตามสุขภาพและความคืบหน้า
- สร้างชุมชนสำหรับผู้ที่สนใจสุขภาพ
- ให้คำปรึกษาและสนับสนุนผ่านระบบแชท

## 🏗️ สถาปัตยกรรมโปรเจกต์

### โครงสร้างโฟลเดอร์
```
lib/
├── constants/          # ค่าคงที่และธีม
├── gen/               # ไฟล์ที่ generate อัตโนมัติ
├── l10n/              # การแปลภาษา (Localization)
├── models/            # โมเดลข้อมูล
├── providers/         # State Management (Provider)
├── screens/           # หน้าจอต่างๆ
├── services/          # บริการต่างๆ
├── utils/             # ฟังก์ชันช่วยเหลือ
└── widgets/           # Widget ที่ใช้ร่วมกัน
```

### หน้าจอหลัก
- **Dashboard**: หน้าหลักแสดงข้อมูลสรุป
- **Food**: จัดการโภชนาการและอาหาร
- **Exercise**: ติดตามการออกกำลังกาย
- **Chat**: ระบบแชทและคำปรึกษา
- **More**: ตั้งค่าและฟีเจอร์เพิ่มเติม

## 🛠️ เทคโนโลยีที่ใช้

### Dependencies หลัก
```yaml
# State Management
provider: ^6.1.1

# Navigation
go_router: ^13.0.1

# Database & Storage
sqflite: ^2.3.0
shared_preferences: ^2.2.2
hive: ^2.2.3

# UI Components
flutter_svg: ^2.0.9
cached_network_image: ^3.3.0
lottie: ^2.7.0

# Charts & Analytics
fl_chart: ^0.66.0

# Localization
flutter_localizations
flutter_gen_runner: ^5.4.0

# Notifications
flutter_local_notifications: ^17.2.0

# Camera & Image
image_picker: ^1.0.4
camera: ^0.10.5+5

# Biometric Authentication
local_auth: ^2.1.7
```

## 🎨 ระบบ UI/UX

### ธีมและการออกแบบ
- **Light Theme**: ธีมสว่างสำหรับการใช้งานทั่วไป
- **Dark Theme**: ธีมมืดสำหรับการใช้งานในที่มืด
- **Glass Morphism**: เอฟเฟกต์แก้วสำหรับ UI ที่ทันสมัย
- **Responsive Design**: รองรับหน้าจอขนาดต่างๆ

### Navigation System
- **Animated Bottom Navigation**: แท็บนำทางแบบเคลื่อนไหว
- **Smart Labels**: ป้ายกำกับที่ปรากฏเมื่อแตะและหายไปอัตโนมัติ
- **Height Animation**: ความสูงของแท็บเปลี่ยนแบบเคลื่อนไหว (60px ↔ 80px)
- **Auto-Hide**: ป้ายกำกับหายไปหลัง 2 วินาที

### Performance Optimizations
- **Memory Optimizer**: จัดการหน่วยความจำอย่างมีประสิทธิภาพ
- **Performance Monitor**: ติดตามประสิทธิภาพในโหมด debug
- **Optimized ListView**: ListView ที่ปรับปรุงประสิทธิภาพ
- **Cached Images**: ภาพที่แคชไว้เพื่อความเร็ว

## 📊 ฟีเจอร์หลัก

### 1. ระบบสุขภาพ
- **Health Assessment**: ประเมินสุขภาพเบื้องต้น
- **Progress Tracking**: ติดตามความคืบหน้า
- **Health Metrics**: วัดค่าสุขภาพต่างๆ

### 2. ระบบโภชนาการ
- **Food Tracking**: บันทึกอาหารที่รับประทาน
- **Nutrition Analysis**: วิเคราะห์โภชนาการ
- **Meal Planning**: วางแผนมื้ออาหาร

### 3. ระบบออกกำลังกาย
- **Exercise Library**: คลังแบบฝึกหัด
- **Workout Tracking**: ติดตามการออกกำลังกาย
- **Progress Charts**: กราฟแสดงความคืบหน้า

### 4. ระบบชุมชน
- **Community Features**: ฟีเจอร์ชุมชน
- **Chat System**: ระบบแชท
- **Social Features**: ฟีเจอร์สังคม

### 5. ระบบการตั้งค่า
- **Profile Management**: จัดการโปรไฟล์
- **Theme Settings**: ตั้งค่าธีม
- **Language Settings**: ตั้งค่าภาษา

## 🌐 การรองรับหลายภาษา

### ภาษาที่รองรับ
- **English (en)**: ภาษาอังกฤษ
- **Thai (th)**: ภาษาไทย

### ไฟล์ Localization
```
l10n/
├── app_en.arb          # ภาษาอังกฤษ
├── app_th.arb          # ภาษาไทย
└── app_localizations.dart
```

## 🔧 การพัฒนา

### การติดตั้ง
```bash
# Clone โปรเจกต์
git clone [repository-url]

# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run
```

### การ Build
```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## 📱 การรองรับ Platform

### Mobile
- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+

### Desktop
- **Windows**: Windows 10+
- **macOS**: macOS 10.14+
- **Linux**: Ubuntu 18.04+

### Web
- **Chrome**: เวอร์ชันล่าสุด
- **Firefox**: เวอร์ชันล่าสุด
- **Safari**: เวอร์ชันล่าสุด

## 🧪 การทดสอบ

### Unit Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

## 📈 Performance

### การปรับปรุงประสิทธิภาพ
- **Memory Management**: จัดการหน่วยความจำอย่างมีประสิทธิภาพ
- **Image Optimization**: ปรับปรุงการโหลดภาพ
- **Lazy Loading**: โหลดข้อมูลเมื่อจำเป็น
- **Caching**: แคชข้อมูลเพื่อความเร็ว

### การติดตามประสิทธิภาพ
- **Build Time Tracking**: ติดตามเวลาสร้าง widget
- **Memory Usage**: ติดตามการใช้หน่วยความจำ
- **Function Execution**: ติดตามการทำงานของฟังก์ชัน

## 🔒 ความปลอดภัย

### การยืนยันตัวตน
- **Biometric Authentication**: การยืนยันตัวตนด้วยไบโอเมตริก
- **Local Authentication**: การยืนยันตัวตนในเครื่อง

### การจัดเก็บข้อมูล
- **Secure Storage**: การจัดเก็บข้อมูลอย่างปลอดภัย
- **Encryption**: การเข้ารหัสข้อมูล

## 📚 เอกสารเพิ่มเติม

### คู่มือการใช้งาน
- [Navigation Guide](NAVIGATION_GUIDE.md): คู่มือระบบ Navigation
- [Performance Optimization](PERFORMANCE_OPTIMIZATION.md): คู่มือการปรับปรุงประสิทธิภาพ
- [Theme Fixes](THEME_FIXES.md): การแก้ไขธีม

### การพัฒนา
- **Flutter Documentation**: https://docs.flutter.dev/
- **Provider Package**: https://pub.dev/packages/provider
- **Hive Database**: https://pub.dev/packages/hive

**DOPYJO** - Smart Health & Fitness App for People with Health Risks

*Built with ❤️ using Flutter*
