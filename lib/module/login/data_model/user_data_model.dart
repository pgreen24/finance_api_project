class UserDataModel {
UserDataModel({
  this.id =0,
  this.username = '',
  this.email = '',
  this.firstName='',
  this.lastName='',
  this.gender= '',
  this.image= ''
});
final int id;
final String username;
final String email;
final String firstName;
final String lastName;
final String gender;
final String image;

String get fullName => '$firstName $lastName';

factory UserDataModel.fromJson(Map<String, dynamic> data){
  return UserDataModel(
      id: data ['id']?? 0,
    username: data ['username']?? '',
    email: data ['email']?? '',
    firstName: data['firstName']??'',
    lastName: data['lastName']??'',
    gender: data['gender']??'',
    image: data['image']??''
  );
}


Map<String,dynamic> toJson(){
  return{
    'id': id,
    'username' : username,
    'email': email,
    'firstName':firstName,
    'lastName': lastName,
    'gender': gender,
    'image':image
  };
}
static List<UserDataModel> fromJsonList(List<dynamic> data) {
  return data.map((item) {
    return UserDataModel.fromJson(
      Map<String, dynamic>.from(item),
    );
  }).toList();
  }
}

