import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerFirebaseService {

    CustomerFirebaseService._();
  static final CustomerFirebaseService instance = CustomerFirebaseService._();


  final FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference collection(String key) => db.collection(key);

  CollectionReference get customerCollection => collection('customer');

  DocumentReference customerRef(String id) => customerCollection.doc(id);

  CollectionReference pointCollection(String id) =>
      customerRef(id).collection('point_detail');

  DocumentReference pointRef(String customerId, String id) =>
      pointCollection(customerId).doc(id);
}
