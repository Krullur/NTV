import 'dart:io';
import 'package:test/expect.dart';

void main() {
  Map<String, double> InnkaupaListinn = {};

  void addItemToInnkaupaListinn(String item, double price) {
    InnkaupaListinn[item] = price;
  }

  void removeItemFromInnkaupaListinn(String item) {
    if (InnkaupaListinn.containsKey(item)) {
      InnkaupaListinn.remove(item);
      print("$item Hefur verið strokað út af listanum.");
    } else {
      print("$item Er ekki á listanum.");
    }
  }

  void viewInnkaupaListinn() {
    if (InnkaupaListinn.isEmpty) {
      print("InnkaupaListinn virðist vera tómur.");
    } else {
      print("InnkaupaListinn:");
      InnkaupaListinn.forEach((item, price) {
        print('$item - \$${price.toStringAsFixed(2)}');
      });
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    InnkaupaListinn.values.forEach((price) {
      totalPrice += price;
    });
    return totalPrice;
  }

  void runInnkaupaListannProgram() {
    while (true) {
      print("InnkaupaListinn:");
      print("1. Bæta við InnkaupaListann");
      print("2. Skoða InnkaupaListann");
      print("3. Sjá Samantektina");
      print("4. Fjarlægja af listanum");
      print("5. Ganga frá Innkaupalista");

      int choice = int.parse(stdin.readLineSync()!);

      if (choice == 1) {
        print("Hér getur þú bætt við listann:");
        print("Sláðu inn vöruheiti:");
        String newItem = stdin.readLineSync()!;
        print("Sláðu inn verðið á vörunni:");
        double price = double.parse(stdin.readLineSync()!);
        addItemToInnkaupaListinn(newItem, price);
        print("$newItem Hefur verið bætt á listann.");
      } else if (choice == 2) {
        viewInnkaupaListinn();
      } else if (choice == 3) {
        double total = calculateTotalPrice();
        print("Heildarverð:");
        print("Heildarverðið á Innkaupalistanum er: \$${total.toStringAsFixed(2)}");
      } else if (choice == 4) {
        print("Sláðu inn vöruheiti til að fjarlægja það af listanum:");
        String itemToRemove = stdin.readLineSync()!;
        removeItemFromInnkaupaListinn(itemToRemove);
      } else if (choice == 5) {
        print("Innkaupalistanum hefur verið lokað.");
        break;
      } else {
        print("Úps! Það virðist hafa komið upp villa, reyndu aftur.");
      }
    }
  }

  runInnkaupaListannProgram();
}
