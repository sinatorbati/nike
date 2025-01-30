import 'package:flutter/material.dart';
import 'package:nike/models/shoe.dart'; // اینجا مدل Shoe که اطلاعات مربوط به کفش رو ذخیره می‌کنه وارد میشه.
import 'package:provider/provider.dart';
import 'package:nike/models/cart.dart'; // اینجا مدل Cart که اطلاعات مربوط به سبد خرید رو ذخیره می‌کنه وارد میشه.
import '../components/shoe_tile.dart'; // این هم کامپوننت ShoeTile که برای نمایش هر کفش در صفحه استفاده میشه.

class ShopPage extends StatefulWidget {
  const ShopPage({super.key}); // ایجاد سازنده برای صفحه ShopPage

  @override
  State<ShopPage> createState() =>
      _ShopPageState(); // حالت صفحه ShopPage رو با _ShopPageState مدیریت می‌کنه.
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    // استفاده از SingleChildScrollView برای امکان اسکرول کردن محتویات صفحه
    return Consumer<Cart>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          children: [
            // سرچ بار
            Container(
              padding: const EdgeInsets.all(
                  12), // اضافه کردن padding به تمام طرف‌های سرچ بار
              margin: const EdgeInsets.symmetric(
                  horizontal: 25), // تنظیم حاشیه در دو طرف
              decoration: BoxDecoration(
                  color: Colors.grey[200]), // رنگ پس‌زمینه خاکی برای سرچ بار
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // فاصله دهی بین آیکن و متن
                children: [
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey), // رنگ خاکی برای متن
                  ),
                  Icon(Icons.search,
                      color: Colors.grey), // آیکن سرچ با رنگ خاکی
                ],
              ),
            ),

            // پیام خوش‌آمدگویی
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 25), // فاصله بالا و پایین پیام
              child: Text(
                'everyone flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey[600]), // رنگ خاکی برای متن
              ),
            ),

            // عنوان و دکمه "See All"
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 25), // فاصله‌گذاری در طرفین
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // فاصله دهی بین عنوان و دکمه
                crossAxisAlignment:
                    CrossAxisAlignment.end, // هم‌راستایی عمودی عنوان و دکمه
                children: [
                  Text(
                    'Hot Picks 🔥',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24), // تنظیمات فونت و وزن متن
                  ),
                  Text(
                    'See all',
                    style:
                        TextStyle(color: Colors.blue), // رنگ آبی برای متن دکمه
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10, // فاصله دادن بین عنوان و لیست
            ),

            // لیست افقی از کفش‌ها
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 460, // ارتفاع لیست کفش‌ها
                child: ListView.builder(
                  physics:
                      const BouncingScrollPhysics(), // برای تاثیر لمسی بهتر (در پلتفرم‌های خاص)
                  shrinkWrap: true, // لیست به اندازه محتوای خود جمع می‌شود
                  scrollDirection: Axis.horizontal, // اسکرول افقی
                  itemCount: 3, // تعداد آیتم‌ها در لیست
                  itemBuilder: (context, index) {
                    // برای هر آیتم از لیست یک شی Shoe جدید ایجاد می‌کنیم
                    Shoe shoe = value.getShoeList()[index]; // توضیح کفش
                    return ShoeTile(
                      shoe: shoe, // ارسال شی Shoe به ShoeTile برای نمایش
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
