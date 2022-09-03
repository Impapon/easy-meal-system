

import '../model/member_meal_details_model.dart';
import 'main_database.dart';

class MemberDetailsDbHelper {

  static Future<int> insertData(MemberMealDetails memberMealDetails) async {
    final db=await DBHelper.openDB();
    return db.insert(tabMemberDetails, memberMealDetails.toMap());
  }
  static Future<List<MemberMealDetails>>getAllMembers()async{
    final db=await DBHelper.openDB();
    final List<Map<String,dynamic>>mapList=await db.query(tabMemberDetails);
    return List.generate(mapList.length, (index) => MemberMealDetails.fromMap(mapList[index]));
  }
}
