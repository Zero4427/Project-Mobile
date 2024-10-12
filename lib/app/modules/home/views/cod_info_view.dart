import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class CODInfoScreen extends StatelessWidget {
  const CODInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('About COD', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProgressBar(),
              const SizedBox(height: 20),
              const Text(
                'For an easy and guaranteed safe payment method, you can pay for orders in cash on the spot via COD (Pay on Delivery)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'How COD Works',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildCODSteps(),
              const SizedBox(height: 20),
              const Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum vavis poliga. Euhuvis ontocism pasm och intrass. Ten kopreck. Aspedat elektrocentrism, i e-demokrati. Farade rer i infravis aska, falig.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Agree to use COD', style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE91E63),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Are you sure you are using the COD method?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel', style: TextStyle(color: Colors.black)),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          ElevatedButton(
                            child: Text('Sure'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed(AppRoutes.transactionSuccess);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.black),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Icon(Icons.credit_card, color: Colors.black),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Icon(Icons.check_circle, color: Colors.black),
      ],
    );
  }

  Widget _buildCODSteps() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFE91E63),
                radius: 25,
                child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Image.asset('assets/payment.png'),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              const Text(
                'Pay the order in cash to the courier before the package is opened',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFE91E63),
                radius: 25,
                child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Image.asset('assets/box.png'),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              const Text(
                'If the order does not meet expectations, the buyer can request a refund/goods via the Uswah Shop application and not ask the courier for a loss',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ); 
  }

  Widgetbuild(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      )
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uswah Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}
