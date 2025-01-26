import 'package:flutter/material.dart';
import 'package:nike/pages/homepage.dart'; // وارد کردن صفحه اصلی (Homepage) که در زمان کلیک روی دکمه کاربر به این صفحه هدایت می‌شود

// کلاس Intropage به عنوان یک صفحه معرفی ساخته شده و از StatelessWidget استفاده می‌کند
// چون در این صفحه نیازی به مدیریت State (وضعیت) نداریم.
class Intropage extends StatelessWidget {
  const Intropage({super.key}); // کانستراکتور صفحه که کلید (Key) را می‌پذیرد.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold پایه صفحه را فراهم می‌کند: شامل body، backgroundColor و موارد دیگر
      backgroundColor: Colors.grey[300], // تنظیم رنگ پس‌زمینه صفحه

      // محتوای اصلی صفحه داخل body تعریف می‌شود
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 25.0), // فاصله از لبه‌های چپ و راست صفحه
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // تنظیم تمام ویجت‌ها در محور عمودی (Vertical) در مرکز صفحه
          children: [
            // لوگوی اصلی برند
            Padding(
              padding: const EdgeInsets.only(
                top: 50, // فاصله از بالا
                left: 25, // فاصله از چپ
                right: 25, // فاصله از راست
                bottom: 25, // فاصله از پایین
              ),
              child: Image.asset(
                'lib/assets/images/logo.png', // مسیر تصویر لوگو که از پوشه assets فراخوانی شده
                height: 110, // ارتفاع تصویر
              ),
            ),
            const SizedBox(
              height: 60, // فاصله عمودی بین لوگو و عنوان صفحه
            ),
            // عنوان صفحه به صورت متن
            const Text(
              'Jast Do It', // متن اصلی به عنوان شعار
              style: TextStyle(
                fontWeight:
                    FontWeight.bold, // متن به صورت پررنگ نمایش داده می‌شود
                fontSize: 20, // اندازه فونت
              ),
            ),
            const SizedBox(
              height: 15, // فاصله بین عنوان و متن توضیحات
            ),
            // توضیحات مربوط به برند
            Text(
              'Brand new sneakers and custom kicks made with premium quality', // توضیحاتی در مورد کیفیت محصولات
              style: TextStyle(
                fontSize: 16, // اندازه فونت متن
                color: Colors.grey[600], // رنگ متن به صورت خاکستری ملایم
              ),
              textAlign: TextAlign.center, // متن در مرکز قرار می‌گیرد
            ),
            const SizedBox(
              height: 48, // فاصله بین متن توضیحات و دکمه
            ),
            // دکمه "Shop Now" که کاربر را به صفحه اصلی هدایت می‌کند
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900], // رنگ پس‌زمینه دکمه
                borderRadius: BorderRadius.circular(12), // گوشه‌های گرد دکمه
              ),
              child: InkWell(
                // InkWell برای افکت کلیک روی دکمه استفاده می‌شود
                borderRadius: BorderRadius.circular(
                    12), // گوشه‌های گرد دکمه برای افکت کلیک
                onTap: () {
                  // هنگام کلیک روی دکمه، کاربر به صفحه اصلی (HomePage) هدایت می‌شود
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const HomePage(), // مسیریابی به صفحه اصلی
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(25), // فاصله داخلی (Padding) در دکمه
                  child: Material(
                    color: Colors
                        .transparent, // رنگ پس‌زمینه شفاف برای سازگاری با InkWell
                    child: Center(
                      // متن در مرکز دکمه قرار می‌گیرد
                      child: Text(
                        'Shop Now', // متن دکمه
                        style: TextStyle(
                          color: Colors.white, // رنگ متن دکمه سفید است
                          fontWeight: FontWeight.bold, // متن به صورت پررنگ
                          fontSize: 16, // اندازه فونت متن دکمه
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
