class ContactList {
  final List<Contacts> contacts;

  ContactList({required this.contacts});

  factory ContactList.fromJson(List<dynamic> parsedJson) {
    List<Contacts> contacts =
        parsedJson.map((i) => Contacts.fromJson(i)).toList();

    return ContactList(
      contacts: contacts,
    );
  }
}

class Contacts {
  String id;
  String name;
  String contacts;
  String url;

  Contacts(
      {required this.id,
      required this.name,
      required this.contacts,
      required this.url});

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      id: json['id'],
      name: json['name'],
      contacts: json['Contacts'],
      url: json['url'],
    );
  }
}
