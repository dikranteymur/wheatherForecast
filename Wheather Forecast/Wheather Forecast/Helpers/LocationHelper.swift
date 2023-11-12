//
//  LocationHelper.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import CoreLocation

final class LocationHelper: NSObject {
    
    static var shared = LocationHelper()
    
    private var locationManager: CLLocationManager?
    private var currentLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
    }
    
    func getCoordinate() -> (lat: Double?, lon: Double?) {
        if let lat = locationManager?.location?.coordinate.latitude as? Double,
            let lon = locationManager?.location?.coordinate.longitude as? Double {
            return (lat, lon)
        }
        return (nil, nil)
    }
    
    func requestLocation() {
        locationManager?.requestWhenInUseAuthorization()
    }
}

extension LocationHelper: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            UserCacheHelpers.setHasLocation(value: true)
            currentLocation = locationManager?.location
        default:
            UserCacheHelpers.setHasLocation(value: false)
            return
        }
    }
}

// MARK: - Helpers
extension LocationHelper {
    
    func currentLocaleIdentifier() -> String? {
        guard let id = Locale.preferredLanguages[0].split(separator: "-").first else { return nil }
        print(id)
        return String(id)
    }
}
