// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationResponse _$InvitationResponseFromJson(Map<String, dynamic> json) {
  return InvitationResponse()
    ..id = json['id'] as int
    ..idStudent = json['idStudent'] as int
    ..nameStudent = json['nameStudent'] as String
    ..idTutor = json['idTutor'] as int
    ..status = json['status'] as int;
}

Map<String, dynamic> _$InvitationResponseToJson(InvitationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idStudent': instance.idStudent,
      'nameStudent': instance.nameStudent,
      'idTutor': instance.idTutor,
      'status': instance.status,
    };
