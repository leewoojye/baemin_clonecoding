//
//  ItemListTableViewCell.swift
//  baemin
//
//  Created by Woo Jye Lee on 11/3/23.
//

import UIKit
import SnapKit
import Then

class ItemListTableViewCell: UITableViewCell {
    static let identifier: String = "ItemListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindData(data: ItemListData) {
        self.selectbutton.isSelected = data.isLike
        self.sizeLabel.text = data.size
        self.priceLabel.text = data.price
    }
    
    // tableview안에는 컨텐츠 뷰가 기본적으로 내제?
    private func setLayout() {
        [sizeLabel, priceLabel, selectbutton].forEach {
            self.contentView.addSubview($0)
        }
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([selectbutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     selectbutton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([sizeLabel.leadingAnchor.constraint(equalTo: selectbutton.trailingAnchor, constant: 10),
                                     sizeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
                                     priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private var sizeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray
    }
    
    private var priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray
    }
    
    private let selectbutton = UIButton().then {
        $0.setImage(UIImage(systemName: "circle"), for: .normal)
        $0.setImage(UIImage(systemName: "record.circle"), for: .selected)
    }
}
