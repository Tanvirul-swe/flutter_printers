import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pos_printer/blue_pos_printer.dart';
import 'package:path_provider/path_provider.dart';

import 'printer_enum.dart';

///Test printing
class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  sample() async {
    //image max 300px X 300px

    ///image from File path
    // String filename = 'yourlogo.png';
    // ByteData bytesData = await rootBundle.load("assets/images/yourlogo.png");
    // String dir = (await getApplicationDocumentsDirectory()).path;
    // File file = await File('$dir/$filename').writeAsBytes(bytesData.buffer
    //     .asUint8List(bytesData.offsetInBytes, bytesData.lengthInBytes));

    ///image from Asset
    String prescriptionImage = 'assets/prescription.png';
    String lowPrescription = 'assets/low_prescription.png';
    String longPrescription = 'assets/long_prescription.jpg';
    String rawPrescription = 'assets/long.jpg';
    // String lowRaw = 'assets/low_raw.png';
    String finalPrescription = 'assets/final_pres.png';

    ByteData bytesAsset = await rootBundle.load(finalPrescription);
    debugPrint('bytesAsset: ${bytesAsset.lengthInBytes}');
    Uint8List imageBytesFromAsset = bytesAsset.buffer
        .asUint8List(bytesAsset.offsetInBytes, bytesAsset.lengthInBytes);
    debugPrint('imageBytesFromAsset: ${imageBytesFromAsset.length}');
    final temDir = await getTemporaryDirectory();

    final fileImage =
        File('${temDir.path}/${DateTime.now().toIso8601String()}.png');
    final locaiton = await fileImage.writeAsBytes(imageBytesFromAsset);
    debugPrint('fileImage: ${locaiton.path}');
    //  temDir.delete(recursive: true);

    ///image from Network

    // Uint8List bytesNetwork = response.bodyBytes;
    // Uint8List imageBytesFromNetwork = bytesNetwork.buffer
    //     .asUint8List(bytesNetwork.offsetInBytes, bytesNetwork.lengthInBytes);

    bluetooth.isConnected.then((isConnected) async {
      if (isConnected == true) {
//         // bluetooth.printNewLine();
        // bluetooth.printCustom("HEADER ", Size.boldMedium.val, Align.center.val);
//         // bluetooth.printNewLine();
//         // // bluetooth.printImage(file.path); //path of your image/logo
//         // bluetooth.printNewLine();
//         bluetooth.printImageBytes(imageBytesFromAsset);
        bluetooth.printImage(locaiton.path); //image from Asset
        // bluetooth.printImageBytes(bytesAsset.buffer.asUint8List(bytesAsset.offsetInBytes, bytesAsset.lengthInBytes));
// //image from Asset
//         // bluetooth.printNewLine();
//         // bluetooth.printImageBytes(imageBytesFromNetwork); //image from Networkr
//         // bluetooth.printNewLine();
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.medium.val);
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.bold.val);
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.bold.val,
//         //     format:
//         //         "%-15s %15s %n"); //15 is number off character from left or right
//         // bluetooth.printNewLine();
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.boldMedium.val);
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.boldLarge.val);
//         // bluetooth.printLeftRight("LEFT", "RIGHT", Size.extraLarge.val);
//         // bluetooth.printNewLine();
//         // bluetooth.print3Column("Col1", "Col2", "Col3", Size.bold.val);
//         // bluetooth.print3Column("Col1", "Col2", "Col3", Size.bold.val,
//         //     format:
//         //         "%-10s %10s %10s %n"); //10 is number off character from left center and right
//         // bluetooth.printNewLine();
//         // bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", Size.bold.val);
//         // bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", Size.bold.val,
//         //     format: "%-8s %7s %7s %7s %n");
//         // bluetooth.printNewLine();
//         // bluetooth.printCustom("čĆžŽšŠ-H-ščđ", Size.bold.val, Align.center.val,
//         //     charset: "windows-1250");
//         // bluetooth.printLeftRight("Številka:", "18000001", Size.bold.val,
//         //     charset: "windows-1250");
//         // bluetooth.printCustom("Body left", Size.bold.val, Align.left.val);
//         // bluetooth.printCustom("Body right", Size.medium.val, Align.right.val);
//         // bluetooth.printNewLine();
//         // bluetooth.printCustom("Thank You", Size.bold.val, Align.center.val);
//         // bluetooth.printNewLine();
//         // bluetooth.printQRcode(
//         //     "Insert Your Own Text to Generate", 200, 200, Align.center.val);
//         // bluetooth.printNewLine();
        // bluetooth.printNewLine();
        // bluetooth.printNewLine();
        // bluetooth
        //     .paperCut(); //some printer not supported (sometime making image not centered)
        //bluetooth.drawerPin2(); // or you can use bluetooth.drawerPin5();
      }
    });
  }

//   sample(String pathImage) async {
//     //SIZE
//     // 0- normal size text
//     // 1- only bold text
//     // 2- bold with medium text
//     // 3- bold with large text
//     //ALIGN
//     // 0- ESC_ALIGN_LEFT
//     // 1- ESC_ALIGN_CENTER
//     // 2- ESC_ALIGN_RIGHT
//
// //     var response = await http.get("IMAGE_URL");
// //     Uint8List bytes = response.bodyBytes;
//     bluetooth.isConnected.then((isConnected) {
//       if (isConnected == true) {
//         bluetooth.printNewLine();
//         bluetooth.printCustom("HEADER", 3, 1);
//         bluetooth.printNewLine();
//         bluetooth.printImage(pathImage); //path of your image/logo
//         bluetooth.printNewLine();
// //      bluetooth.printImageBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
//         bluetooth.printLeftRight("LEFT", "RIGHT", 0);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1, format: "%-15s %15s %n");
//         bluetooth.printNewLine();
//         bluetooth.printLeftRight("LEFT", "RIGHT", 2);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 3);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 4);
//         bluetooth.printNewLine();
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1);
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1,
//             format: "%-10s %10s %10s %n");
//         bluetooth.printNewLine();
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1);
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1,
//             format: "%-8s %7s %7s %7s %n");
//         bluetooth.printNewLine();
//         String testString = " čĆžŽšŠ-H-ščđ";
//         bluetooth.printCustom(testString, 1, 1, charset: "windows-1250");
//         bluetooth.printLeftRight("Številka:", "18000001", 1,
//             charset: "windows-1250");
//         bluetooth.printCustom("Body left", 1, 0);
//         bluetooth.printCustom("Body right", 0, 2);
//         bluetooth.printNewLine();
//         bluetooth.printCustom("Thank You", 2, 1);
//         bluetooth.printNewLine();
//         bluetooth.printQRcode("Insert Your Own Text to Generate", 200, 200, 1);
//         bluetooth.printNewLine();
//         bluetooth.printNewLine();
//         bluetooth.paperCut();
//       }
//     });
//   }
}
