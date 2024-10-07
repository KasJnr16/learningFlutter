import 'package:campusstore/models/user.dart';
import 'package:campusstore/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UserWidget extends StatefulWidget {
  final int userId; // User ID is passed to fetch the user data dynamically.

  UserWidget({Key? key, required this.userId}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late Future<User?> _userFuture;
  final userService = UserService(); // Instance of UserService.

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  // Fetches the user data asynchronously.
  void _fetchUser() {
    setState(() {
      _userFuture = userService.fetchUserById(
          context, widget.userId); // Fetch updated user data.
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: _buildAppBar(),
      body: FutureBuilder<User?>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return _buildErrorCard(snapshot.error);
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return ProfileSection(
                user: user,
                onUpdate: _fetchUser); // Pass user data to ProfileSection.
          }
          return _buildNoDataCard();
        },
      ),
    );
  }

  Widget _buildErrorCard(Object? error) {
    return _buildMessageCard(
      icon: Icons.warning,
      message: "Error: $error",
      description: "User not found.",
    );
  }

  Widget _buildNoDataCard() {
    return _buildMessageCard(
      icon: Icons.warning,
      message: "Message: Check your internet",
      description: "User not found.",
    );
  }

  // Message card to show messages with an icon
  Widget _buildMessageCard(
      {required IconData icon,
      required String message,
      required String description}) {
    return Center(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.red, size: 50),
              SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Appbar
PreferredSizeWidget _buildAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Profile",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      leading: _buildIconButton(Icons.menu, onTap: () {
        // Handle the leading icon action.
      }),
      actions: [
        _buildHeartIcon(),
        _buildIconButton(Icons.notifications, onTap: () {
          // Handle notification action.
        }),
      ],
    ),
  );
}

// Reusable Icon button method.
Widget _buildIconButton(IconData icon, {required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 28,
        ),
      ),
    ),
  );
}

// Build heart icon for AppBar.
Widget _buildHeartIcon() {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.favorite_outline, // Default icon state.
          color: Colors.black,
          size: 28,
        ),
      ),
    ),
  );
}

class ProfileSection extends StatefulWidget {
  final User user;
  final VoidCallback onUpdate;

  const ProfileSection({Key? key, required this.user, required this.onUpdate})
      : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User banner and profile picture.
        Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBannerImage(),
            _buildProfilePicture(),
          ],
        ),
        SizedBox(height: 75), // Space below the profile picture.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.user.username,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showUpdateUserDialog(context, widget.user);
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.black12; // Color when pressed
                          }
                          return Colors.black; // Default color
                        },
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Display campus, email, and bio as before.
              _buildUserDetails(),
            ],
          ),
        ),
      ],
    );
  }

  // Helper to build user details.
  Widget _buildUserDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),

          // Campus Information
          Row(
            children: [
              Icon(Icons.school, color: Colors.black, size: 28),
              SizedBox(width: 10),
              Text(
                widget.user.campusName,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          // Email Information
          Row(
            children: [
              Icon(Icons.email, color: Colors.black, size: 28),
              SizedBox(width: 10),
              Text(
                widget.user.email,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
              ),
            ],
          ),

          //Phone
          SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.black, size: 28),
              SizedBox(width: 10),
              Text(
                widget.user.phone,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          // Date of Birth
          Row(
            children: [
              Icon(Icons.cake, color: Colors.black, size: 28),
              SizedBox(width: 10),
              Text(
                DateFormat("yyyy-MM").format(widget.user.dateOfBirth!),
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30),
          Divider(color: Colors.grey.shade300, thickness: 1),

          // Bio Section
          Text(
            "Bio",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Bio Card
          GestureDetector(
              onTap: () {
                _showEditBioDialog(context, widget.user.bio ?? "");
              },
              child: Card(
                color: Colors.blueGrey.shade50,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    widget.user.bio ?? "Write your bio...",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

//for the bio
  void _showEditBioDialog(BuildContext context, String currentBio) {
    final bioController = TextEditingController(text: currentBio);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width:
                MediaQuery.of(context).size.width * 0.95, // 85% of screen width
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Bio",
                  style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: bioController,
                  maxLines: 6, // More lines for a larger text area
                  decoration: InputDecoration(
                    hintText: "Enter your bio",
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(
                            context); // Close the dialog without saving
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.montserrat(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Call the service to save the bio update
                        User updatedUser = widget.user;
                        updatedUser.bio = bioController.text;
                        print(widget.user);
                        print(updatedUser);
                        print(updatedUser.bio);
                        UserService()
                            .updateUser(context, updatedUser)
                            .then((value) {
                          Navigator.pop(
                              context); // Close the dialog after saving
                          widget.onUpdate(); // Trigger the update callback
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: Text(
                        "Save",
                        style: GoogleFonts.montserrat(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build the profile picture widget.
  Positioned _buildProfilePicture() {
    return Positioned(
      bottom: -70, // Moves the profile picture halfway below the banner
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // White border around the profile image
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 15,
              offset: Offset(0, 6), // Shadow under the profile picture
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 85,
          backgroundColor: Colors.grey.shade200, // Fallback background color
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://i0.wp.com/picjumbo.com/wp-content/uploads/silhouette-of-a-guy-with-a-cap-at-red-sky-sunset-free-image.jpeg?h=800&quality=80'), // Placeholder profile image
          ),
        ),
      ),
    );
  }

  // Build banner image widget.
  Container _buildBannerImage() {
    return // Banner image
        Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'), // Placeholder banner image
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5), // Creates a shadow below the banner
          ),
        ],
      ),
    );
  }

  void _showUpdateUserDialog(BuildContext context, User user) {
    final _formKey = GlobalKey<FormState>();
    final userService = UserService();

    // Controllers for the form fields
    TextEditingController usernameController =
        TextEditingController(text: user.username);
    TextEditingController firstNameController =
        TextEditingController(text: user.firstname);
    TextEditingController lastNameController =
        TextEditingController(text: user.lastname);
    TextEditingController phoneController =
        TextEditingController(text: user.phone);
    TextEditingController emailController =
        TextEditingController(text: user.email);
    TextEditingController campusController =
        TextEditingController(text: user.campusName);
    TextEditingController dobController = TextEditingController(
      text: user.dateOfBirth != null ? _formatDate(user.dateOfBirth!) : '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Update Profile",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        )),
                    Divider(),
                    SizedBox(height: 25),
                    _buildTextField("Username", usernameController),
                    SizedBox(height: 25),
                    _buildTextField("First Name", firstNameController),
                    SizedBox(height: 25),
                    _buildTextField("Last Name", lastNameController),
                    SizedBox(height: 25),
                    _buildTextField("Phone", phoneController),
                    SizedBox(height: 25),
                    _buildTextField("Email", emailController),
                    SizedBox(height: 25),
                    _buildTextField("Campus", campusController),
                    SizedBox(height: 25),
                    _buildTextField("Date of Birth", dobController),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 21,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Update the user information
                              User updatedUser = User(
                                userId: user.userId,
                                username: usernameController.text,
                                firstname: firstNameController.text,
                                lastname: lastNameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                campusName: campusController.text,
                                dateOfBirth: dobController.text.isNotEmpty
                                    ? DateTime.parse(dobController.text)
                                    : null,
                              );

                              userService
                                  .updateUser(context, updatedUser)
                                  .then((value) {
                                Navigator.pop(context);
                                widget
                                    .onUpdate(); // Fetch the updated user data
                              });
                            }
                          },
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15)),
                            elevation: WidgetStatePropertyAll(5),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return Colors.black12; // Color when pressed
                                }
                                return Colors.black; // Default color
                              },
                            ),
                          ),
                          child: Text("Update",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildTextField(String label, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontSize: 21),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $label';
      }
      return null;
    },
    style: TextStyle(fontSize: 18),
  );
}

String _formatDate(DateTime date) {
  return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}
