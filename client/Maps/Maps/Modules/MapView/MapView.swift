//
//  MapView.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapView: CustomViewController<MapViewScreen> {

    private let service: PlaceService
    private let locationManager: CLLocationManager
    
    init(service: PlaceService) {
        self.service = service
        self.locationManager = CLLocationManager()
        super.init(nibName: nil, bundle: nil)
        self.locationManager.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var mapView: GMSMapView!
//
//    override func loadView() {
//        self.view = MapViewScreen()
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        view = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
//
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        self.service.getCities().subscribe(onSuccess: { result in
//            switch result {
//            case .success(let cities):
//                ()
//                cities.forEach({ city in
//                    let path = GMSPath(fromEncodedPath: city.working_area.first ?? "")
//                    let polyline = GMSPolyline(path: path)
//                    polyline.strokeColor = .red
//                    polyline.map = self.mapView
//                    print(path)
//                })
//            default:
//                ()
//            }
//        })
    }
}

extension MapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
//        let location: CLLocation = locations.last!
//
//        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
//                                              longitude: location.coordinate.longitude,
//                                              zoom: 15)
//        self.mapView.camera = camera
//        self.locationManager.stopUpdatingLocation()
//        let market = GMSMarker(position: location.coordinate)
//        market.title = "Narutinho"
//        market.map = self.mapView
    }
}
