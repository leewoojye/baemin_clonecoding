//
//  ViewController.swift
//  carrotmarket
//
//  Created by Woo Jye Lee on 11/3/23.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
//    var price:String = ""
//    var size:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ViewController"
        self.view.backgroundColor = .lightGray
        self.setLayout()
    }
    
//    private func setTableViewConfig() {
//        self.tableView.register(ItemListTableViewCell.self,
//                                forCellReuseIdentifier: ItemListTableViewCell.identifier)
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//    }
    
    private func setLayout() {
        [topview, bottomview, scrollview].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(self.view)
        }
        
        NSLayoutConstraint.activate([bottomview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     bottomview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     bottomview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
                                     bottomview.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([topview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     topview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     topview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     topview.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        scrollview.addSubview(contentview)
        contentview.translatesAutoresizingMaskIntoConstraints = false
        contentview.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollview.topAnchor.constraint(equalTo: topview.bottomAnchor),
                                     scrollview.bottomAnchor.constraint(equalTo: bottomview.topAnchor),
                                     scrollview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([contentview.topAnchor.constraint(equalTo: scrollview.contentLayoutGuide.topAnchor),
                                     contentview.bottomAnchor.constraint(equalTo: scrollview.contentLayoutGuide.bottomAnchor),
                                     contentview.leadingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.leadingAnchor),
                                     contentview.trailingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([stackview.topAnchor.constraint(equalTo: contentview.topAnchor),
                                     stackview.bottomAnchor.constraint(equalTo: contentview.bottomAnchor),
                                     stackview.leadingAnchor.constraint(equalTo: contentview.leadingAnchor),
                                     stackview.trailingAnchor.constraint(equalTo: contentview.trailingAnchor)
        ])
        
        stackview.addArrangedSubview(descriptionview)
        descriptionview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([descriptionview.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
                                     descriptionview.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
                                     descriptionview.topAnchor.constraint(equalTo: stackview.topAnchor),
                                     descriptionview.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    lazy var topview: UIView = {
        let view = UIView()
        let backbutton = UIButton()
        // 이미지 처리시 항상 이미지 관련 객체 UIImage? 를 거쳐야 함?
        backbutton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let cartbutton = UIButton()
        cartbutton.setImage(UIImage(systemName: "cart"), for: .normal)
        let sharebutton = UIButton()
        sharebutton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        let homebutton = UIButton()
        homebutton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        
        // view.backgroundColor = .black
        view.isOpaque = false
        return view
    }()
    
    lazy var bottomview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let button = UIButton()
        button.backgroundColor = UIColor(named: "button_color")
        button.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "20,000원 담기"
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        
        let label1 = UILabel()
        label1.text = "배달최소주문금액"
        label1.textColor = .lightGray
        label1.font = UIFont(name: "SFProDisplay-Light", size: 12)
        
        let label2 = UILabel()
        label2.text = "17000원"
        label2.textColor = .black
        label2.font = UIFont(name: "SFProDisplay-Light", size: 12)
        
        [button, label, label1, label2].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(view)
        }
//        button.snp.makeConstraints {
//            $0.top.leading.equalToSuperview().inset(16)
//            $0.width.equalTo(300)
//        }
//        label1.snp.makeConstraints {
//            $0.top.leading.equalToSuperview().inset(16)
//            // $0.width.equalTo(300)
//        }
//        label2.snp.makeConstraints {
//            $0.bottom.leading.equalToSuperview().inset(16)
//            // $0.width.equalTo(300)
//        }
        NSLayoutConstraint.activate([label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
                                     button.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                                     button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
                                     button.widthAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: button, action: #selector(pushtoVC))
        button.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    var scrollview: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()
    
    var contentview = UIView()
    
    var stackview: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        
        return view
    }()
    
    // 피자사진
    var middleview: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "pizzaimg")
        return view
    }()
    
    var descriptionview: UIView = {
        let view = UIView()
        let label = UILabel()
        label.textColor = .black
        label.text = "[재주문1위 바싹불고기피자]"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        let label1 = UILabel()
        label1.textColor = .lightGray
        label1.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빨선명희피자의 야심작"
        label1.font = UIFont(name: "SFProDisplay-Light", size: 12)
        
        [label, label1].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addSubview(view)
        }
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     label1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                                     label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
        ])
        
        return view
    }()
    
    // TableView 안에 피자사이즈, 도우변경 부분을 tableviewcell 형태로 삽입
//    private let tableview = UITableView(frame: .zero, style: .grouped).then {
//        $0.backgroundColor = .white
//        $0.separatorColor = .lightGray
//        $0.separatorStyle = .singleLine
//    }
    
    @objc
    func pushtoVC() {
        let cartview = CartViewViewController()
        self.navigationController?.pushViewController(cartview, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }

}

//extension ViewController: UITableViewDelegate {}
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemListData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier,
//                                                       for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
//        cell.bindData(data: itemListData[indexPath.row])
//        return cell
//    }
//    
//}
