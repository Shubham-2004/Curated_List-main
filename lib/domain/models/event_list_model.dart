// To parse this JSON data, do
//
//     final eventList = eventListFromJson(jsonString);

import 'dart:convert';

EventList eventListFromJson(String str) => EventList.fromJson(json.decode(str));

String eventListToJson(EventList data) => json.encode(data.toJson());

class EventList {
  final int? error;
  final String? message;
  final ListClass? list;
  final List<Datum>? data;

  EventList({
    this.error,
    this.message,
    this.list,
    this.data,
  });

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        error: json["error"],
        message: json["message"],
        list: json["list"] == null ? null : ListClass.fromJson(json["list"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "list": list?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? eventId;
  final Eventname? eventname;
  final String? thumbUrl;
  final String? thumbUrlLarge;
  final String? bannerUrl;
  final int? startTime;
  final String? startTimeDisplay;
  final Eventname? location;
  final String? city;
  final String? label;
  final String? eventApi;
  final Eventname? shareUrl;
  final String? geoApi;
  final String? latitude;
  final String? longitude;
  final String? ticketUrl;
  final int? buyTicket;
  final Tickets? tickets;
  final String? timezone;

  Datum({
    this.eventId,
    this.eventname,
    this.thumbUrl,
    this.thumbUrlLarge,
    this.bannerUrl,
    this.startTime,
    this.startTimeDisplay,
    this.location,
    this.city,
    this.label,
    this.eventApi,
    this.shareUrl,
    this.geoApi,
    this.latitude,
    this.longitude,
    this.ticketUrl,
    this.buyTicket,
    this.tickets,
    this.timezone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        eventId: json["event_id"],
        eventname: json["eventname"] == null
            ? null
            : Eventname.fromJson(json["eventname"]),
        thumbUrl: json["thumb_url"],
        thumbUrlLarge: json["thumb_url_large"],
        bannerUrl: json["banner_url"],
        startTime: json["start_time"],
        startTimeDisplay: json["start_time_display"],
        location: json["location"] == null
            ? null
            : Eventname.fromJson(json["location"]),
        city: json["city"],
        label: json["label"],
        eventApi: json["event_api"],
        shareUrl: json["share_url"] == null
            ? null
            : Eventname.fromJson(json["share_url"]),
        geoApi: json["geo_api"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        ticketUrl: json["ticket_url"],
        buyTicket: json["buy_ticket"],
        tickets:
            json["tickets"] == null ? null : Tickets.fromJson(json["tickets"]),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "eventname": eventname?.toJson(),
        "thumb_url": thumbUrl,
        "thumb_url_large": thumbUrlLarge,
        "banner_url": bannerUrl,
        "start_time": startTime,
        "start_time_display": startTimeDisplay,
        "location": location?.toJson(),
        "city": city,
        "label": label,
        "event_api": eventApi,
        "share_url": shareUrl?.toJson(),
        "geo_api": geoApi,
        "latitude": latitude,
        "longitude": longitude,
        "ticket_url": ticketUrl,
        "buy_ticket": buyTicket,
        "tickets": tickets?.toJson(),
        "timezone": timezone,
      };
}

class Eventname {
  final String? cdata;

  Eventname({
    this.cdata,
  });

  factory Eventname.fromJson(Map<String, dynamic> json) => Eventname(
        cdata: json["@cdata"],
      );

  Map<String, dynamic> toJson() => {
        "@cdata": cdata,
      };
}

class Tickets {
  final bool? hasTickets;
  final String? ticketUrl;

  Tickets({
    this.hasTickets,
    this.ticketUrl,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        hasTickets: json["has_tickets"],
        ticketUrl: json["ticket_url"],
      );

  Map<String, dynamic> toJson() => {
        "has_tickets": hasTickets,
        "ticket_url": ticketUrl,
      };
}

class ListClass {
  final String? id;
  final String? title;
  final String? userId;
  final DateTime? createdOn;
  final String? slug;
  final String? active;
  final String? autofetch;
  final String? followersCount;
  final String? eventsCount;
  final String? organizersCount;
  final String? listTitle;
  final String? listKeywords;
  final String? listDescription;
  final dynamic h1Text;
  final dynamic h2Text;
  final dynamic pageDescription;
  final String? params;
  final dynamic htmlContent;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final String? location;
  final String? isFollowing;
  final String? url;

  ListClass({
    this.id,
    this.title,
    this.userId,
    this.createdOn,
    this.slug,
    this.active,
    this.autofetch,
    this.followersCount,
    this.eventsCount,
    this.organizersCount,
    this.listTitle,
    this.listKeywords,
    this.listDescription,
    this.h1Text,
    this.h2Text,
    this.pageDescription,
    this.params,
    this.htmlContent,
    this.firstName,
    this.lastName,
    this.avatar,
    this.location,
    this.isFollowing,
    this.url,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        id: json["id"],
        title: json["title"],
        userId: json["user_id"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        slug: json["slug"],
        active: json["active"],
        autofetch: json["autofetch"],
        followersCount: json["followers_count"],
        eventsCount: json["events_count"],
        organizersCount: json["organizers_count"],
        listTitle: json["list_title"],
        listKeywords: json["list_keywords"],
        listDescription: json["list_description"],
        h1Text: json["h1_text"],
        h2Text: json["h2_text"],
        pageDescription: json["page_description"],
        params: json["params"],
        htmlContent: json["html_content"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        location: json["location"],
        isFollowing: json["is_following"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "user_id": userId,
        "created_on": createdOn?.toIso8601String(),
        "slug": slug,
        "active": active,
        "autofetch": autofetch,
        "followers_count": followersCount,
        "events_count": eventsCount,
        "organizers_count": organizersCount,
        "list_title": listTitle,
        "list_keywords": listKeywords,
        "list_description": listDescription,
        "h1_text": h1Text,
        "h2_text": h2Text,
        "page_description": pageDescription,
        "params": params,
        "html_content": htmlContent,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "location": location,
        "is_following": isFollowing,
        "url": url,
      };
}
