class PlatoModel {
  String descripcion;
  String id;
  String imagen;
  String video;
  String tipo;
  String subtipo;
  String tiempo;
  String nombre;
  int personas;
  int favoritos;
  List<dynamic> ingredientes;
  List<dynamic> preparacion;

  PlatoModel({
    this.descripcion,
    this.id,
    this.imagen,
    this.video,
    this.tipo,
    this.subtipo,
    this.tiempo,
    this.nombre,
    this.personas,
    this.favoritos,
    this.ingredientes,
    this.preparacion
  });

}