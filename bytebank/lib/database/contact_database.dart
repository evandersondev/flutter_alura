import '../models/contact_model.dart';
import 'database_app.dart';

class ContactDatabase {
  static const table = 'CREATE TABLE IF NOT EXISTS contacts ('
      'id INTERGER PRIMARY KEY, '
      'name TEXT, '
      'agency INTEGER, '
      'account INTEGER)';

  static Future<int> save(ContactModel contact) async {
    final db = await createDatabase();

    return db.insert(
      'contacts',
      contact.toMap(),
    );
  }

  static Future<List<ContactModel>> findAll() async {
    final db = await createDatabase();
    final response = await db.query('contacts');

    return response.map((e) => ContactModel.fromMap(e)).toList();
  }
}
