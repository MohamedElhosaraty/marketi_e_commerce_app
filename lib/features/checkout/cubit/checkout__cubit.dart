
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

part 'checkout__state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());


  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void openCurrentLocationOnMap() async {
    final position = await getCurrentLocation();
    final url = Uri.parse("https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      emit(OpenMapSuccess());
    } else {
      emit(MapOpenFailure("Could not open map"));
    }
  }

// void openNativeMap(double latitude, double longitude) async {
  //   final url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
  //
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url); // جرب بدون تحديد المود
  //     emit(OpenMapSuccess());
  //   } else {
  //     emit(MapOpenFailure("تعذر فتح الخريطة على هذا الجهاز"));
  //   }
  // }

}
