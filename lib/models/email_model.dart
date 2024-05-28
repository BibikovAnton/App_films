class EmailModal {
  String? serviceId;
  String? templateId;
  String? userId;
  String? accessToken;
  TemplateParams? templateParams;

  EmailModal(
      {this.serviceId,
      this.templateId,
      this.userId,
      this.accessToken,
      this.templateParams});

  EmailModal.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    templateId = json['template_id'];
    userId = json['user_id'];
    accessToken = json['accessToken'];
    templateParams = json['template_params'] != null
        ? new TemplateParams.fromJson(json['template_params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['service_id'] = serviceId;
    data['template_id'] = templateId;
    data['user_id'] = userId;
    data['accessToken'] = accessToken;
    if (templateParams != null) {
      data['template_params'] = templateParams!.toJson();
    }
    return data;
  }
}

class TemplateParams {
  String? fromName;
  String? toName;
  String? message;
  String? date;

  TemplateParams({this.fromName, this.toName, this.message, this.date});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    fromName = json['from_name'];
    toName = json['to_name'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_name'] = fromName;
    data['to_name'] = toName;
    data['message'] = message;
    data['date'] = date;
    return data;
  }
}
