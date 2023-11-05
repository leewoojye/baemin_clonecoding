//
//  CartViewViewController.swift
//  carrotmarket
//
//  Created by Woo Jye Lee on 11/3/23.
//

import UIKit
import Then
import SnapKit

class CartViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CartViewViewController"
        self.setLayout()
    }
    
    private func setLayout() {
        [topview, bottomview].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(self.view)
        }
        
        NSLayoutConstraint.activate([topview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     topview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     topview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     topview.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([bottomview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     bottomview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     bottomview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     bottomview.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    lazy var topview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let backbutton = UIButton()
        backbutton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        let homebutton = UIButton()
        homebutton.setImage(UIImage(systemName: "house_fill"), for: .normal)
        let peoplebutton = UIButton()
        peoplebutton.setImage(UIImage(named: "person.3.sequence.fill"), for: .normal)
        let label = UILabel()
        label.textColor = .black
        label.text = "장바구니"
        label.font = UIFont(name: "SFProDisplay-Light", size: 24)
        
        [backbutton, homebutton, peoplebutton, label].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(view)
        }
        NSLayoutConstraint.activate([backbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     backbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([peoplebutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
                                     peoplebutton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([homebutton.trailingAnchor.constraint(equalTo: peoplebutton.leadingAnchor, constant: 20),
                                     homebutton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // 거꾸로화살표 버튼을 누르면 이전화면으로 화면전환
        let tapGesture = UITapGestureRecognizer(target: backbutton, action: #selector(popVC))
        backbutton.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    lazy var bottomview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let button = UIButton()
        button.backgroundColor = UIColor(named: "button_color")
        button.layer.cornerRadius = 10
        
        let label = UILabel()
        label.textColor = .white
        label.text = "배달 주문하기"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        
        let label1 = UILabel()
        label1.textColor = .white
        label1.text = "47,200원"
        label1.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        
        let icon = UIImageView()
        icon.image = UIImage(named: "2.circle")
        
        [label, button, label1].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(view)
        }
        NSLayoutConstraint.activate([label1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     label1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
                                     button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                                     label.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        NSLayoutConstraint.activate([icon.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                                     icon.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 20)
        ])
        
        return view
    }()
    
    @objc
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

}
