part of 'services.dart';

class TransactionService {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      FlutixTransaction flutixTransaction) async {
    await transactionCollection.doc().set({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time.millisecondsSinceEpoch,
      'amount': flutixTransaction.amount,
      'picture': flutixTransaction.picture
    });
  }

  static Future<List<FlutixTransaction>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    var documents = snapshot.docs.where((element) {
      Map? data = element.data() as Map?;
      return data!['userId'] == userID;
    });
    return documents.map((e) {
      Map? data = e.data() as Map?;

      return FlutixTransaction(
          userID: data!['userID'],
          title: data['title'],
          subtitle: data['subtitle'],
          time: DateTime.fromMillisecondsSinceEpoch(data['time']),
          amount: data['amount'],
          picture: data['picture']);
    }).toList();
  }
}
