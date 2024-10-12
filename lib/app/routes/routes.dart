import 'package:project/app/modules/home/views/cart_screen.dart';
import 'package:project/app/modules/home/views/chat_detail_screen.dart';
import 'package:project/app/modules/home/views/checkout_screen.dart';
import 'package:project/app/modules/home/views/cod_info_view.dart';
import 'package:project/app/modules/home/views/faq_screen.dart';
import 'package:project/app/modules/home/views/favorite_screen.dart';
import 'package:project/app/modules/home/views/home_screen.dart';
import 'package:project/app/modules/home/views/login_screen.dart';
import 'package:project/app/modules/home/views/message_screen.dart';
import 'package:project/app/modules/home/views/order_details_screen.dart';
import 'package:project/app/modules/home/views/payments_screen.dart';
import 'package:project/app/modules/home/views/previous_order_details_screen.dart';
import 'package:project/app/modules/home/views/previous_orders_screen.dart';
import 'package:project/app/modules/home/views/product_screen.dart';
import 'package:project/app/modules/home/views/profile_screen.dart';
import 'package:project/app/modules/home/views/promo_screen.dart';
import 'package:project/app/modules/home/views/signup_screen.dart';
import 'package:project/app/modules/home/views/supprot_request_screen.dart';
import 'package:project/app/modules/home/views/transaction_success_screen.dart';
import 'package:project/app/modules/home/views/splash_screen.dart';
import 'package:project/app/modules/home/views/order_screen.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/views/user_data_screen.dart';
import 'package:project/app/routes/cod_payment_pages.dart';

abstract class AppRoutes {
  static const String codInfo = '/cod-info';
  static const String codPayment = '/cod-payment';
  static const String transactionSuccess = '/transaction-success';
  static const String splashScreen = '/splash-screen';
  static const String login = '/login';
  static const String signup = '/sign-up';
  static const String order = '/order';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String promo = '/promo';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String favorite = '/favorite';
  static const String messages = '/message';
  static const String chatDetail = '/chat-detail';
  static const String userData = '/user-data';
  static const String promoCodes = '/promo-codes';
  static const String payments = '/payments';
  static const String supportRequest = '/support-request';
  static const String faq = '/faq';
  static const String orderdetailsscreen = '/order-detail-screen';
  static const String previous_order_screen = '/previous-order-screen';
  static const String previous_order_details_screen = '/previous-order-details-screen';

  static final List<GetPage> routes = [
    GetPage(name: codInfo, page: () => const CODInfoScreen()),
    GetPage(name: codPayment, page: () => CODPaymentPage()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: transactionSuccess, page: () => const TransactionSuccessScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: order, page: () => OrderScreen()),
    GetPage(name: orderdetailsscreen, page: () => OrderDetailsScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: product, page: () => ProductScreen()),
    GetPage(name: cart, page: () => CartScreen()),
    GetPage(name: checkout, page: () => CheckoutScreen()),
    GetPage(name: favorite, page: () => FavoriteScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: userData, page: () => UserDataScreen()),
    GetPage(name: promoCodes, page: () => PromoScreen()),
    GetPage(name: payments, page: () => PaymentsScreen()),
    GetPage(name: supportRequest, page: () => SupportRequestScreen()),
    GetPage(name: faq, page: () => FAQScreen()),
    GetPage(name: chatDetail, page: () => ChatDetailScreen()),
    GetPage(name: messages, page: () => MessageScreen()),
    GetPage(name: previous_order_screen, page: () => PreviousOrdersScreen()),
  ];
}
