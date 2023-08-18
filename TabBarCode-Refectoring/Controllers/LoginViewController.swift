//
//  ViewController.swift
//  TabBarCode
//
//  Created by Kang on 2023/08/15.
//

import UIKit
// git checking

class LoginViewController: UIViewController {

    // 로그인 버튼 생성
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAutoLayout()
    }

    // 로그인 버튼 오토 레이아웃
    func setAutoLayout() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            loginButton.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0)
        ])
    }
    
    
    // 로그인 버튼이 눌렸을 때
    @objc func loginButtonTapped() {
        
        // 탭 바 컨트롤러 생성
        let tabBarCon = UITabBarController()
        
        // 네이게이션 바 코드로 생성(루트 뷰) + 변수에 뷰 컨트롤러 담기
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        
        // 변수에 뷰 컨트롤러 담기
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        // 뷰 컨트롤러 -> 탭 바 설정
        tabBarCon.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarCon.modalPresentationStyle = .fullScreen
        tabBarCon.tabBar.backgroundColor = .white
        
        // 탭 바 이름
        vc1.title = "Main"
        vc2.title = "Search"
        vc3.title = "File"
        vc4.title = "Me"
        vc5.title = "Doc"
        
        // 탭 바 이미지
        guard let items = tabBarCon.tabBar.items else { return }
        items[0].image = UIImage(systemName: "trash")
        items[1].image = UIImage(systemName: "folder")
        items[2].image = UIImage(systemName: "paperplane")
        items[3].image = UIImage(systemName: "doc")
        items[4].image = UIImage(systemName: "note")
        
        // 프레젠트로 탭 바로 전환
        present(tabBarCon, animated: true, completion: nil)

    }
}

