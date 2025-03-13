
class Contact {
  final String name;
  final String? profilePic; // Nullable to handle missing images

  Contact({required this.name, this.profilePic});
}

class NewContact {
  final String name;
  final String phone;
  final String imageUrl;
  NewContact({required this.name, required this.phone, required this.imageUrl});
}
