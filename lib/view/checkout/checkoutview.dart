import 'package:app_commerce/core/view_model/checkout_view_model.dart';
import 'package:app_commerce/view/checkout/summary.dart';
import 'package:app_commerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import 'add_address.dart';
import 'constance.dart';
import 'delevery_time.dart';

class HorizontalExample extends StatelessWidget {
  HorizontalExample({super.key});

  final _processes = [
    'Order Signed',
    'Order Processed',
    'Shipped ',
    'Out for delivery ',
    'Delivered ',
  ];

  final _content = [
    '20/18',
    '20/18',
    '20/18',
    '20/18',
    '20/18',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViweModel>(
      init: CheckOutViweModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Order Status",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: 0,
              height: 0,
              child: Expanded(
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme:
                        const ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                        MediaQuery.of(context).size.width / _processes.length,
                    contentWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          _processes[index],
                          style: const TextStyle(
                            color: Colors
                                .blue, // change color with dynamic color --> can find it with example section
                          ),
                        ),
                      );
                    },
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          _content[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.teal, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  prevColor,
                                  controller.getColor(index + 1)
                                ],
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
            ),
            controller.pages == Pages.deliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.addAddress
                    ? AddAddress()
                    : SummaryScreen(),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 30,
                    
                  ),
                  width: 146,
                  height: 50,
                  child: CustomButton(text: 'NEXT', OnPress: () {
                     controller.changeIndex(controller.index + 1);
                  },
                  
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
