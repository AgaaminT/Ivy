import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/constant/assets_constants.dart';
import 'package:ivy/view/ui/screens/claim_screen.dart';
import 'package:ivy/view/ui/screens/congrats_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_appbar.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/utils/routes/widgets/custom_text_widget.dart';


class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Payment method',
        isBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextWidget(
              "Total Amount",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            customTextWidget(
              "₹899",
              fontSize: 16.sp,
            ),
            SizedBox(height: 8.h),
            customTextWidget(
              "GST @ 18.00%",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            customTextWidget(
              "₹161.82",
              fontSize: 16.sp,
            ),
            SizedBox(height: 8.h),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextWidget(
                  "Payable Amount",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                customTextWidget(
                  "₹1,060.82 INR",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
            customTextWidget(
              "(Annually)",
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 16.h),
            customTextWidget(
              "Pay directly with your favourite UPI apps",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                paymentOption("GPay", AssetsConstants.gpay, () {
                  // Handle GPay action
                }),
                paymentOption("PhonePe", AssetsConstants.phonepe, () {
                  // Handle PhonePe action
                }),
                paymentOption("BHIM", AssetsConstants.bhim, () {
                  // Handle BHIM action
                }),
                paymentOption("Paytm", AssetsConstants.paytm, () {
                  // Handle Paytm action
                }),
              ],
            ),
            SizedBox(height: 16.h),
            customTextWidget(
              "Other Payments Methods",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
            SizedBox(height: 16.h),
            paymentOptionRow("PayPal", AssetsConstants.paypal, () {
              // Handle PayPal action
            }),
            paymentOptionRow("Credit/Debit Card", AssetsConstants.credit, () {
              // Handle Credit/Debit Card action
            }),
            paymentOptionRow("Net Banking", AssetsConstants.banking, () {
              // Handle Net Banking action
            }),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context, screen: CongratulationsScreen())
                      .pushReplacement();
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: customTextWidget(
                      'Click to Pay',
                      fontSize: 14.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentOption(String title, String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            asset,
            height: 48.h,
            width: 48.w,
          ),
          SizedBox(height: 8.h),
          customTextWidget(
            title,
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget paymentOptionRow(String title, String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Image.asset(
              asset,
              height: 48.h,
              width: 48.w,
            ),
            SizedBox(width: 16.w),
            customTextWidget(
              title,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
