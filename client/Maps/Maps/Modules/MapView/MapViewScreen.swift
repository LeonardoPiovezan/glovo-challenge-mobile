//
//  MapViewScreen.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit
import SnapKit

final class MapViewScreen: UIView {
    lazy var mapView: UIView = {
        return UIView(frame: CGRect.zero)
    }()

    lazy var infoView: UIView = {
        return UIView(frame: CGRect.zero)
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
        self.addSubview(self.infoView)
    }

    func setupConstraints() {
        self.mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        self.infoView.snp.makeConstraints { make in
            make.top.equalTo(self.mapView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    func setupAdditionalConfiguration() {
        self.mapView.backgroundColor = .black
        self.infoView.backgroundColor = .purple
    }
}