class profile{
  profile({this.firstName,this.lastName,this.region,this.country,this.bio,this.post,this.followers,this.following,this.profilePic});
  String ? firstName;
  String ? lastName;
  String? region;
String? country;
String? bio;
num ?post;
num ?followers;
num ?following;
String ?profilePic;

factory profile.fromJson(Map<String,dynamic>parsedJson){
  return profile(
    firstName: parsedJson['first_name'],
    lastName: parsedJson['last_name'],
    region: parsedJson['region'],
    country: parsedJson['country'],
    bio: parsedJson['bio'],
    post: parsedJson['post'],
    followers: parsedJson['followers'],
    following: parsedJson['following'],
    profilePic: parsedJson['profile_pic'],
  );
}

}