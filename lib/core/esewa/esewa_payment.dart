import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/foundation.dart';

makeEsewaPayment() {
  try {
    EsewaFlutterSdk.initPayment(
      esewaConfig: EsewaConfig(
        environment: Environment.test,
        clientId: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretId: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      ),
      esewaPayment: EsewaPayment(
        productId: "1d71jd81",
        productName: "Product One",
        productPrice: "20",
        callbackUrl: '',
      ),
      onPaymentSuccess: (EsewaPaymentSuccessResult data) {
        debugPrint(":::SUCCESS::: => $data");
      },
      onPaymentFailure: (data) {
        debugPrint(":::FAILURE::: => $data");
      },
      onPaymentCancellation: (data) {
        debugPrint(":::CANCELLATION::: => $data");
      },
    );
  } on Exception catch (e) {
    debugPrint("EXCEPTION : ${e.toString()}");
  }
}
// esewa id:  9806800001
// mpin pin :112298
// code: 123456