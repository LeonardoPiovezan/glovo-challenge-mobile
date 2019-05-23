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
import RxSwift
import RxDataSources

class MapView: CustomViewController<MapViewScreen> {
    var viewModel: MapViewModel!

    init() {
        super.init(nibName: nil, bundle: nil)
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
        let subject = PublishSubject<Void>()
        let trigger = subject.asDriver(onErrorJustReturn: ())
        let output = self.viewModel.transform(input: MapViewModel.Input(getCitiesTrigger: trigger))

        output.cities.drive(onNext: { cities in
            print(cities)
        })

        output.polylines.drive(onNext: { [weak self] polylines in
            guard let self = self else { return }
            polylines.forEach({ polyline in
                polyline.map = self.customView.mapView
            })
        })

        subject.onNext(())

        let dataSource = RxTableViewSectionedReloadDataSource<CityCustomData> ( configureCell: { datasource, tableView, indexPath, city -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = city.name
            return cell
        })

        dataSource.titleForHeaderInSection = { datasource, index in
            return dataSource.sectionModels[index].countryName
        }

        output.citiesData.drive(
            self.customView.citiesTableView.rx.items(dataSource: dataSource)
        )
//        self.customView.citiesTableView.rx.items(<#T##source: ObservableType##ObservableType#>)
//        self.viewModel.location
//            .drive(onNext: { location in
//                let cameraPosition = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15)
//                self.customView.mapView.camera = cameraPosition
//                print(location)
//            })
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


struct CityCustomData {
    var countryName: String
    var items: [City]
}

extension CityCustomData: SectionModelType {
    init(original: CityCustomData, items: [City]) {
        self = original
        self.items = items
    }
}
