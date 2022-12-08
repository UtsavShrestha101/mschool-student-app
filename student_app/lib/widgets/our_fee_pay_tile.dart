import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/pages/fee/pay_online.dart';
import '../utils/our_colors.dart';
import 'our_sized_box.dart';

class OurFeePayTile extends StatefulWidget {
  final String receptiNo;
  final String month;
  final String paymentDate;
  final String PaymentAmount;
  const OurFeePayTile(
      {Key? key,
      required this.receptiNo,
      required this.month,
      required this.paymentDate,
      required this.PaymentAmount})
      : super(key: key);

  @override
  State<OurFeePayTile> createState() => _OurFeePayTileState();
}

class _OurFeePayTileState extends State<OurFeePayTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setSp(5),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: darklogoColor,
              ),
              borderRadius: BorderRadius.circular(
                ScreenUtil().setSp(12.5),
              )),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setSp(10),
                  right: ScreenUtil().setSp(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Receipt No.",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.receptiNo,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darklogoColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Month",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.month,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    OurSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Date",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.paymentDate,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darklogoColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Pending Amount",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                         "Rs. ${widget.PaymentAmount}",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              OurSizedBox(),
              OurSizedBox(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: PayOnline(
                        PaymentAmount: widget.PaymentAmount,
                        receptiNo: widget.receptiNo,
                        month: widget.month,
                        paymentDate: widget.paymentDate,
                      ),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                  // 9806800002
                  // Nepal@123
                  // try {
                  //   EsewaFlutterSdk.initPayment(
                  //     esewaConfig: EsewaConfig(
                  //       environment: Environment.test,
                  //       clientId:
                  //           "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
                  //       secretId: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
                  //     ),
                  //     esewaPayment: EsewaPayment(
                  //       productId: widget.receptiNo,
                  //       productName: "Fee",
                  //       productPrice: widget.PaymentAmount,
                  //       callbackUrl: "www.test-url.com",
                  //     ),
                  //     onPaymentSuccess: (EsewaPaymentSuccessResult data) {
                  //       debugPrint(":::SUCCESS::: => $data");
                  //       OurToast().showErrorToast("Payment Successful");
                  //       // Get.find<CheckOutScreenController>().changeIndex(2);
                  //     },
                  //     onPaymentFailure: (data) {
                  //       debugPrint(":::FAILURE::: => $data");
                  //       OurToast().showErrorToast("Payment Failed");
                  //     },
                  //     onPaymentCancellation: (data) {
                  //       debugPrint(":::CANCELLATION::: => $data");
                  //       OurToast().showErrorToast("Payment Cancelled");
                  //     },
                  //   );
                  // } on Exception catch (e) {
                  //   debugPrint("EXCEPTION : ${e.toString()}");
                  //   OurToast().showErrorToast(e.toString());
                  // }
                },
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().setSp(35),
                  decoration: BoxDecoration(
                    color: darklogoColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        ScreenUtil().setSp(12.5),
                      ),
                      bottomRight: Radius.circular(
                        ScreenUtil().setSp(12.5),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAY NOW",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(17.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        OurSizedBox(),
      ],
    );
  }
}
