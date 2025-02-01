import 'package:flutter/material.dart'; // وارد کردن بسته اصلی Flutter برای دسترسی به ویجت‌ها و امکانات آن
// ignore: depend_on_referenced_packages
import 'package:google_nav_bar/google_nav_bar.dart'; // وارد کردن بسته Google Nav Bar که برای ایجاد نوار ناوبری پایین با تم گوگلی استفاده می‌شود

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)?
      onTabChange; // یک تابع که پارامتر آن عددی است که نشان دهنده اندیس تب انتخاب شده می‌باشد (برای کنترل تغییر تب‌ها)

  // سازنده کلاس که تابع onTabChange را به عنوان ورودی می‌گیرد تا امکان تغییر تب‌ها فراهم باشد
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    // این ویجت نوار ناوبری پایین (Bottom Navigation Bar) را نمایش می‌دهد.
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 20), // اضافه کردن فاصله عمودی در بالای و پایین نوار
      child: GNav(
          // استفاده از ویجت GNav که از پکیج google_nav_bar می‌آید
          color: Colors.grey[500], // رنگ آیکن‌ها در حالت معمولی
          activeColor: Colors.grey[800], // رنگ آیکن‌ها زمانی که تب فعال است
          tabActiveBorder:
              Border.all(color: Colors.white), // حاشیه سفید رنگ برای تب فعال
          tabBackgroundColor: Colors.grey
              .shade100, // رنگ پس‌زمینه تب فعال (موقعی که تب انتخاب شده باشد)
          mainAxisAlignment:
              MainAxisAlignment.center, // قرار دادن تب‌ها در مرکز نوار
          tabBorderRadius: 16, // گرد کردن گوشه‌های تب‌ها
          gap: 8, // فاصله بین تب‌ها
          onTabChange: (value) => onTabChange!(
              value), // ارسال اندیس تب فعال به تابع onTabChange که از والد گرفته شده است
          tabs: const [
            // تعریف تب‌های نوار ناوبری (تعداد و محتوای تب‌ها)
            GButton(
              icon: Icons.home, // آیکن خانه برای تب Shop
              text: 'Shop', // نام تب "Shop"
            ),
            GButton(
              icon: Icons.shopping_bag_rounded, // آیکن سبد خرید برای تب Cart
              text: 'Cart', // نام تب "Cart"
            ),
          ]),
    );
  }
}
