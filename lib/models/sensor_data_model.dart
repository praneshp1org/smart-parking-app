class SensorData {
  final String? username;
  final Owner? owner;
  final int? id;
  final String? name;
  final String? description;
  final dynamic license;
  final bool? history;
  final bool? enabled;
  final String? visibility;
  final dynamic unitType;
  final dynamic unitSymbol;
  final String? lastValue;
  final String? createdAt;
  final String? updatedAt;
  final dynamic wipperPinInfo;
  final bool? statusNotify;
  final int? statusTimeout;
  final String? status;
  final String? key;
  final Group? group;
  final List<Groups>? groups;
  final List<dynamic>? feedWebhookReceivers;
  final List<dynamic>? feedStatusChanges;
  // final String? error;
  // final bool? isError;

  SensorData({
    this.username,
    this.owner,
    this.id,
    this.name,
    this.description,
    this.license,
    this.history,
    this.enabled,
    this.visibility,
    this.unitType,
    this.unitSymbol,
    this.lastValue,
    this.createdAt,
    this.updatedAt,
    this.wipperPinInfo,
    this.statusNotify,
    this.statusTimeout,
    this.status,
    this.key,
    this.group,
    this.groups,
    // this.error="", //here
    // this.isError=false, //here
    this.feedWebhookReceivers,
    this.feedStatusChanges,
  });
  // SensorData.withError(String error) : error = error;

  SensorData.fromJson(Map<String, dynamic> json)
    : username = json['username'] as String?,
      owner = (json['owner'] as Map<String,dynamic>?) != null ? Owner.fromJson(json['owner'] as Map<String,dynamic>) : null,
      id = json['id'] as int?,
      name = json['name'] as String?,
      description = json['description'] as String?,
      license = json['license'],
      history = json['history'] as bool?,
      enabled = json['enabled'] as bool?,
      visibility = json['visibility'] as String?,
      unitType = json['unit_type'],
      unitSymbol = json['unit_symbol'],
      lastValue = json['last_value'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      wipperPinInfo = json['wipper_pin_info'],
      statusNotify = json['status_notify'] as bool?,
      statusTimeout = json['status_timeout'] as int?,
      status = json['status'] as String?,
      key = json['key'] as String?,
      group = (json['group'] as Map<String,dynamic>?) != null ? Group.fromJson(json['group'] as Map<String,dynamic>) : null,
      groups = (json['groups'] as List?)?.map((dynamic e) => Groups.fromJson(e as Map<String,dynamic>)).toList(),
      feedWebhookReceivers = json['feed_webhook_receivers'] as List?,
      feedStatusChanges = json['feed_status_changes'] as List?;

  Map<String, dynamic> toJson() => {
    'username' : username,
    'owner' : owner?.toJson(),
    'id' : id,
    'name' : name,
    'description' : description,
    'license' : license,
    'history' : history,
    'enabled' : enabled,
    'visibility' : visibility,
    'unit_type' : unitType,
    'unit_symbol' : unitSymbol,
    'last_value' : lastValue,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'wipper_pin_info' : wipperPinInfo,
    'status_notify' : statusNotify,
    'status_timeout' : statusTimeout,
    'status' : status,
    'key' : key,
    'group' : group?.toJson(),
    'groups' : groups?.map((e) => e.toJson()).toList(),
    'feed_webhook_receivers' : feedWebhookReceivers,
    'feed_status_changes' : feedStatusChanges
  };
}

class Owner {
  final int? id;
  final String? username;

  Owner({
    this.id,
    this.username,
  });

  Owner.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      username = json['username'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'username' : username
  };
}

class Group {
  final int? id;
  final String? key;
  final String? name;
  final int? userId;

  Group({
    this.id,
    this.key,
    this.name,
    this.userId,
  });

  Group.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      key = json['key'] as String?,
      name = json['name'] as String?,
      userId = json['user_id'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'key' : key,
    'name' : name,
    'user_id' : userId
  };
}

class Groups {
  final int? id;
  final String? key;
  final String? name;
  final int? userId;

  Groups({
    this.id,
    this.key,
    this.name,
    this.userId,
  });

  Groups.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      key = json['key'] as String?,
      name = json['name'] as String?,
      userId = json['user_id'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'key' : key,
    'name' : name,
    'user_id' : userId
  };
}