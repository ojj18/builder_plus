import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertBox(double height, IconData? icon, Color iconColor, String? title,
    String? message, VoidCallback onTap,
    {String? payPalLink}) {
  var timer = Timer(const Duration(seconds: 2), onTap);
  Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(Get.context!);
                  },
                  icon: const Icon(
                    Icons.close,
                  )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 48,
                    color: iconColor,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    message ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ).then((value) {
    if (payPalLink == null) {
      if (timer.isActive) {
        timer.cancel();
      }
    }
  });
}
