//
//  CityInfoView.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit

class CityInfoView: UIView {

    lazy var nameView: InfoLabelView = {
        return InfoLabelView()
    }()

    lazy var countryView: InfoLabelView = {
        return InfoLabelView()
    }()

    lazy var countryCodeView: InfoLabelView = {
        return InfoLabelView()
    }()

    private lazy var stackView: UIStackView  = {
        let stack = UIStackView(frame: CGRect.zero)
        stack.axis = .vertical
        stack.spacing = Style.Margins.smallMargin
        return stack
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityInfoView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.nameView)
        self.stackView.addArrangedSubview(self.countryView)
        self.stackView.addArrangedSubview(self.countryCodeView)
    }

    func setupConstraints() {
        self.stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        self.nameView.name = "Name"
        self.countryView.name = "Country"
        self.countryCodeView.name = "Country Code"
    }
}
