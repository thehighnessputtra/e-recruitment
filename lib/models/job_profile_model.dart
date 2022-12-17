class JobProfileModel {
  String? name;
  String? imgUrl;

  JobProfileModel({required this.name, required this.imgUrl});
}

List<JobProfileModel> listJobProfile = [
  JobProfileModel(
      name: "Developer",
      imgUrl:
          "https://suteki.co.id/wp-content/uploads/2020/04/sofware-developer.jpg"),
  JobProfileModel(
      name: "Accounting",
      imgUrl:
          "https://lh5.googleusercontent.com/AbAO13dsWJ3kee0e1RIsevkAcqc4WsV-JzXlVhIsHNjSh9RCmPFev206_3KplBUoGZBmSKL6q9x_caijPTJdUwqT9bT1STjPMc3aa8T7Tan6qo6cUL23RusTy1JV-0ODWpKL9KE"),
  JobProfileModel(
      name: "Architecture",
      imgUrl:
          "https://i0.wp.com/f1-styx.imgix.net/article/2019/07/16153022/NewDesignPhoto-768x533.jpg?resize=768%2C533&ssl=1"),
  JobProfileModel(
      name: "Receptionist",
      imgUrl:
          "https://cdn1-production-images-kly.akamaized.net/1kc6qebT-5OLiUnPCZODWC__vBo=/1200x900/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2791027/original/018716600_1556512141-resepsionis_HL.jpg"),
  JobProfileModel(
      name: "Chef",
      imgUrl:
          "https://www.shs.sch.id/wp-content/uploads/2019/04/Asisten-chef-.jpg"),
  JobProfileModel(
      name: "Photographer",
      imgUrl:
          "https://www.signupgenius.com/cms/socialMediaImages/appointment-scheduling-tips-photographers-article-1200x800.jpg"),
  JobProfileModel(
      name: "Video Editor",
      imgUrl:
          "https://www.lokerbali.info/blog/wp-content/uploads/2020/05/Video-Editor.jpg")
];
