//
// class SourceDataModel {
//   String? status;
//   List<Sources>? sources;
//
//   SourceDataModel({
//     this.status,
//     this.sources,
//   });
//
//   SourceDataModel.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['sources'] != null) {
//       sources = [];
//       json['sources'].forEach((v) {
//         sources?.add(Sources.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (sources != null) {
//       map['sources'] = sources?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
// class Sources {
//   String? id;
//   String? name;
//
//   Sources({
//     this.id,
//     this.name,
//   });
//
//   Sources.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     return map;
//   }
// }
