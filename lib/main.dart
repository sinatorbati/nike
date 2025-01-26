import 'package:flutter/material.dart'; // وارد کردن بسته flutter برای استفاده از امکانات آن
import 'pages/intro_page.dart'; // وارد کردن صفحه معرفی (intro_page.dart) که به عنوان صفحه اول برنامه نمایش داده می‌شود

// نقطه شروع برنامه
void main() {
  runApp(const MyApp()); // اجرای اپلیکیشن با MyApp به عنوان ریشه (root) اپ
}

// تعریف کلاس MyApp به عنوان اپلیکیشن اصلی
class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // اینجا از super.key برای ایجاد کلید برای widget استفاده می‌کنیم که به کارکرد بهینه و به‌خصوص برای مدیریت state کمک می‌کنه.

  @override
  Widget build(BuildContext context) {
    // ساختار ویجت اصلی اپلیکیشن
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,  // این خط برای غیرفعال کردن بنر دیباگ در بالای اپلیکیشن هست. اگر می‌خواهید در زمان دیباگ بنر نباشه، می‌توانید این خط رو از کامنت خارج کنید.
      home:
          Intropage(), // در اینجا صفحه شروع اپ که Intropage هست به عنوان صفحه اصلی تنظیم می‌شود. (اولین صفحه ای که بعد از اجرای برنامه نمایش داده می‌شود)
    );
  }
}
