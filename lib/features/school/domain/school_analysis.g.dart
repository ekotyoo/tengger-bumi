// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchoolAnalysis _$$_SchoolAnalysisFromJson(Map<String, dynamic> json) =>
    _$_SchoolAnalysis(
      preventionLevel: (json['prevention_level'] as num?)?.toDouble(),
      emergencyResponseLevel:
          (json['emergency_response_level'] as num?)?.toDouble(),
      recoveryLevel: (json['recovery_level'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SchoolAnalysisToJson(_$_SchoolAnalysis instance) =>
    <String, dynamic>{
      'prevention_level': instance.preventionLevel,
      'emergency_response_level': instance.emergencyResponseLevel,
      'recovery_level': instance.recoveryLevel,
    };
