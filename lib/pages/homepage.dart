import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

/// ویجت اصلی صفحه خانه که یک [StatefulWidget] است.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// وضعیت صفحه خانه
class _HomePageState extends State<HomePage> {
  // ذخیره‌سازی ایندکس انتخاب‌شده از Bottom Navigation Bar
  int _selectedIndex = 0;

  /// متدی برای تغییر ایندکس انتخاب‌شده در Bottom Navigation Bar
  /// این متد وقتی کاربر یکی از گزینه‌های نوار نویگیشن را انتخاب کند، فراخوانی می‌شود.
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // لیستی از صفحات مختلف که هنگام تغییر ایندکس نمایش داده می‌شوند.
  final List<Widget> _pages = [
    const ShopPage(), // صفحه فروشگاه
    const CartPage(), // صفحه سبد خرید
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تنظیم رنگ پس‌زمینه صفحه
      backgroundColor: Colors.grey[300],

      // تعریف Bottom Navigation Bar
      bottomNavigationBar: MyBottomNavBar(
        // انتقال ایندکس انتخاب‌شده به متد navigateBottomBar
        onTabChange: (index) => navigateBottomBar(index),
      ),

      // تعریف AppBar برای صفحه
      appBar: AppBar(
        backgroundColor: Colors.transparent, // پس‌زمینه شفاف
        elevation: 0, // حذف سایه زیر AppBar
        leading: Builder(
          builder: (context) => IconButton(
              // باز کردن Drawer با استفاده از آیکون منو
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 12), // فاصله از سمت چپ
                child: Icon(
                  Icons.menu,
                  color: Colors.black, // رنگ آیکون منو
                ),
              )),
        ),
      ),

      // تعریف Drawer (منوی کناری)
      drawer: Drawer(
        width: 250, // عرض Drawer
        backgroundColor: Colors.grey[900], // رنگ پس‌زمینه Drawer
        child: Column(
          children: [
            // لوگو در بالای Drawer
            Container(
              color: Colors.grey[900], // رنگ پس‌زمینه لوگو
              padding: const EdgeInsets.symmetric(horizontal: 40), // فاصله افقی
              margin: const EdgeInsets.only(top: 50), // فاصله از بالا
              child: Image.asset(
                'lib/assets/images/logo.png', // مسیر تصویر لوگو
                color: Colors.white, // رنگ تصویر (در صورت نیاز به تغییر رنگ)
                fit: BoxFit.contain, // نحوه نمایش تصویر
              ),
            ),

            // آیتم‌های موجود در Drawer
            const Padding(
              padding: EdgeInsets.only(
                top: 25, // فاصله از بالا
                left: 25, // فاصله از سمت چپ
              ),
              child: ListTile(
                // آیکون Home
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                // متن Home
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white, // رنگ متن
                    fontWeight: FontWeight.w600, // ضخامت متن
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 25, // فاصله از سمت چپ
              ),
              child: ListTile(
                // آیکون About
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                // متن About
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white, // رنگ متن
                    fontWeight: FontWeight.w600, // ضخامت متن
                  ),
                ),
              ),
            ),

            // Spacer برای جدا کردن آیتم‌های بالا و Logout
            const Spacer(),

            // آیتم Logout در انتهای Drawer
            const Padding(
              padding: EdgeInsets.only(
                left: 25, // فاصله از سمت چپ
                bottom: 25, // فاصله از پایین
              ),
              child: ListTile(
                // آیکون Logout
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                // متن Logout
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white, // رنگ متن
                    fontWeight: FontWeight.w600, // ضخامت متن
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // بدنه اصلی صفحه، شامل صفحه‌ای که مطابق با ایندکس انتخاب‌شده نمایش داده می‌شود.
      body: _pages[_selectedIndex],
    );
  }
}
