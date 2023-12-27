//
//  BaseAllEventsView.swift
//  TaskChecker
//
//  Created by admin on 21.12.2023.
//

import SwiftUI
//import MapKit
//import Foundation
//import CoreLocation
//import Combine

struct BaseAllEventsView: View {
//    @EnvironmentObject var allEventsModel: BaseAllEve
    
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea(.all)
            VStack {
//                Button(action: {
////                    locationModel.requestAuthorisation()
//                }, label: {
//                    Text("ask")
//                })
//                Text("location status: \(locationManager.statusString)")
//                 HStack {
//                     Text("latitude: \(userLatitude)")
//                     Text("longitude: \(userLongitude)")
//                 }
            }
        }
    }
    
    
}

//#Preview {
//    BaseAllEventsView()
//}

//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//
//    private let locationManager = CLLocationManager()
//    @Published var locationStatus: CLAuthorizationStatus?
//    @Published var lastLocation: CLLocation?
//
//    override init() {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//   
//    
//    var statusString: String {
//        guard let status = locationStatus else {
//            return "unknown"
//        }
//        
//        switch status {
//        case .notDetermined: return "notDetermined"
//        case .authorizedWhenInUse: return "authorizedWhenInUse"
//        case .authorizedAlways: return "authorizedAlways"
//        case .restricted: return "restricted"
//        case .denied: return "denied"
//        default: return "unknown"
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        locationStatus = status
//        print(#function, statusString)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        lastLocation = location
//        print(#function, location)
//    }
//}
