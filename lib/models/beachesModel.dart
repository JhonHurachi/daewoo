class BeachesModel {
  String title;
  String desc;
  String img;
  bool isActive;

  BeachesModel({
    this.title,
    this.desc,
    this.img,
    this.isActive
  });

}

List<BeachesModel> beaches = [

   BeachesModel(
    title: "Arroz con Pollo",
    desc: "Plato tradicional limeño",
    img: "https://firebasestorage.googleapis.com/v0/b/daewoochef.appspot.com/o/platos%2Ffondo%2FArroz%20con%20pollo.jpg?alt=media&token=3eed48c8-6275-4fa7-9f0e-946e6cd38258",
    isActive: false
  ),
  BeachesModel(
    title: "Lorem Ipsum",
    desc: "Contrary to popular belief",
    img: "https://firebasestorage.googleapis.com/v0/b/daewoochef.appspot.com/o/platos%2Ffondo%2FArroz%20con%20pollo.jpg?alt=media&token=3eed48c8-6275-4fa7-9f0e-946e6cd38258",
    isActive: true
  ),
  BeachesModel(
    title: "What is Lorem",
    desc: "Contrary to popular belief",
    img: "https://firebasestorage.googleapis.com/v0/b/daewoochef.appspot.com/o/platos%2Ffondo%2FArroz%20con%20pollo.jpg?alt=media&token=3eed48c8-6275-4fa7-9f0e-946e6cd38258",
    isActive: true
  ),
  BeachesModel(
    title: "Where does it",
    desc: "Contrary to popular belief",
    img: "https://firebasestorage.googleapis.com/v0/b/daewoochef.appspot.com/o/platos%2Ffondo%2FArroz%20con%20pollo.jpg?alt=media&token=3eed48c8-6275-4fa7-9f0e-946e6cd38258",
    isActive: false
  )

];