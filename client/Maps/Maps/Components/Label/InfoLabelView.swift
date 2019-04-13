//
//  InfoLabelView.swift
//  Maps
//
//  Created by Leonardo Piovezan on 13/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit

class InfoLabelView: UIView {
    lazy var infoNameLabel: UILabel = {
        let label = MapsLabel(style: .title)
        return label
    }()

    lazy var infoLabel: UILabel = {
        return MapsLabel(style: .subTitle)
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.distribution = UIStackView.Distribution.fillProportionally
        stackView.spacing = Style.Margins.smallMargin
        return stackView
    }()

    var name: String = "" {
        didSet {
            self.infoNameLabel.text = self.name
        }
    }

    var info: String = ""{
        didSet {
            self.infoLabel.text = self.info
        }
    }

    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoLabelView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.infoNameLabel)
        self.labelsStackView.addArrangedSubview(self.infoLabel)
    }

    func setupConstraints() {
        self.labelsStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let highPriority = UILayoutPriority(rawValue: 1000)
        let lowPriority = UILayoutPriority(250)
        self.infoNameLabel.setContentHuggingPriority(highPriority, for: .horizontal)
        self.infoLabel.setContentHuggingPriority(lowPriority, for:.horizontal)
    }

    func setupAdditionalConfiguration() {
        self.infoNameLabel.text = "Naruto Name"
        self.infoLabel.text = "Sasuke Info"
    }
}
