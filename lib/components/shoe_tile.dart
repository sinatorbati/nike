import 'package:flutter/material.dart'; // وارد کردن بسته اصلی Flutter برای استفاده از ویجت‌ها و امکانات آن
import 'package:nike/models/shoe.dart'; // وارد کردن مدل Shoe که ویژگی‌های یک کفش را در خود دارد

class ShoeTile extends StatelessWidget {
  final Shoe
      shoe; // یک شیء از مدل Shoe که اطلاعات مربوط به هر کفش را شامل می‌شود
  const ShoeTile(
      {super.key,
      required this.shoe}); // سازنده کلاس که شیء Shoe را به عنوان ورودی می‌گیرد

  @override
  Widget build(BuildContext context) {
    // ویجت اصلی که نمایی از هر کفش را با تصویر، توضیحات و قیمت آن نمایش می‌دهد
    return Container(
      margin: const EdgeInsets.only(
        // تنظیم فاصله از سمت چپ
        left: 25,
      ),
      width: 280, // عرض ثابت برای هر کارت کفش
      decoration: BoxDecoration(
        // تنظیم رنگ پس‌زمینه و گوشه‌های گرد برای کارت کفش
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12), // گرد کردن گوشه‌ها
      ),
      child: Column(
        // استفاده از یک Column برای نمایش محتوای مختلف کفش
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // تنظیم فاصله بین اجزای داخل Column
        children: [
          // بخش تصویر کفش
          Padding(
            padding: const EdgeInsets.all(8.0), // اضافه کردن پدینگ اطراف تصویر
            child: Image.asset(
              shoe.imagePath, // بارگذاری تصویر کفش از مسیر داده شده در مدل Shoe
            ),
          ),

          // بخش توضیحات کفش
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              shoe.description, // نمایش توضیحات کفش
              style:
                  TextStyle(color: Colors.grey[600]), // رنگ خاکی برای توضیحات
            ),
          ),

          // بخش قیمت و نام کفش
          Padding(
            padding: const EdgeInsets.only(
              // پدینگ از سمت چپ برای بخش قیمت و نام
              left: 25,
            ),
            child: Row(
              // استفاده از Row برای نمایش نام و قیمت کفش در کنار هم
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // فاصله‌گذاری بین اجزا در Row
              crossAxisAlignment:
                  CrossAxisAlignment.start, // تراز عمودی برای اجزای داخل Row
              children: [
                Column(
                  // استفاده از Column برای نمایش نام و قیمت کفش در یک ستون
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // تراز عمودی به سمت چپ
                  children: [
                    Text(
                      shoe.name, // نمایش نام کفش
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25), // سبک نوشتاری برای نام کفش
                    ),
                    const SizedBox(
                      // فاصله‌ای برای جدا کردن نام و قیمت
                      height: 5,
                    ),
                    Text(
                      '\$${shoe.price}', // نمایش قیمت کفش با علامت دلار
                      style: const TextStyle(
                          color: Colors.grey), // رنگ خاکی برای قیمت
                    )
                  ],
                ),

                // دکمه افزودن به سبد خرید
                Container(
                    padding: const EdgeInsets.all(20), // پدینگ اطراف دکمه
                    decoration: const BoxDecoration(
                      // تنظیم رنگ پس‌زمینه دکمه و گوشه‌های گرد
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12), // گرد کردن گوشه بالای چپ
                        bottomRight:
                            Radius.circular(12), // گرد کردن گوشه پایین راست
                      ),
                    ),
                    child: const Icon(
                      // آیکن "+" برای افزودن به سبد خرید
                      Icons.add,
                      color: Colors.white, // رنگ سفید برای آیکن
                    ))
              ],
            ),
          )
          // قیمت، نام و دکمه "افزودن به سبد خرید" نمایش داده می‌شوند
        ],
      ),
    );
  }
}
