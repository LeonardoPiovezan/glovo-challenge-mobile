//
//  MapViewScreen.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMaps

final class MapViewScreen: UIView {
    lazy var mapView: GMSMapView = {
        return GMSMapView(frame: CGRect.zero)
    }()

    lazy var cityInfoView: CityInfoView = {
        return CityInfoView()
    }()

    lazy var citiesTableView: UITableView = {
        return UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MapViewScreen: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.mapView)
        self.addSubview(self.cityInfoView)
        self.addSubview(self.citiesTableView)
    }

    func setupConstraints() {
        self.mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        self.cityInfoView.snp.makeConstraints { make in
            make.top.equalTo(self.mapView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        self.citiesTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }

    func setupAdditionalConfiguration() {
        self.citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
