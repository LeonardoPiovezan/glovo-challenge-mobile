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
import RxCoreLocation

class MapView: CustomViewController<MapViewScreen> {

    private let locationManager: CLLocationManager

    private let viewModel: MapViewModeling
    init(mapViewModel: MapViewModeling) {
        self.locationManager = CLLocationManager()
        self.viewModel = mapViewModel
        super.init(nibName: nil, bundle: nil)
        self.locationManager.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureBindings()
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

    func configureBindings() {
        self.viewModel.location
            .drive(onNext: { location in
                let cameraPosition = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15)
                self.customView.mapView.camera = cameraPosition
                print(location)
            })
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
