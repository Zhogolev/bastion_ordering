import 'city.dart';
import 'country.dart';
import 'map_location.dart';
import 'street.dart';

/// todo
class Address {

  MapLocation location;
  /// могут быть переведены на разный язык
  City city;
  Country country;
  Street street;
  String building;
  String entrance;
  String apartments;

  Address({this.city, this.country, this.street});

  String get presentation => '';
}
