
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/taskes.dart';

void addtaskFirebaseFirestore(){
  FirebaseFirestore.instance.collection('taske').
  withConverter<taskedate>(
      fromFirestore: (Snapshot,_)=>taskedate.fromFirestore(Snapshot.data()!),
      toFirestore: (task,_)=>task.toFirestore());
}