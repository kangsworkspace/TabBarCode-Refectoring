//
//  ViewController.swift
//  TabBarCode
//
//  Created by Kang on 2023/08/15.
//

import UIKit

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
        
        view.backgroundColor = .white
        setAutoLayout()
    }

    // 로그인 버튼 오토 레이아웃
    func setAutoLayout() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
    }
    
    
    // 로그인 버튼이 눌렸을 때
    @objc func loginButtonTapped() {
        
        // 해당 화면을 띄우는 뷰 컨트롤러에 접근 (최종적으로 FirstViewController에 접근하기 위해)
        if let presentingVC = presentingViewController {
            // 해당 화면을 띄우는 탭 바 컨트롤러 접근
            let tabBarCon = presentingVC as! UITabBarController
            // 해당 화면을 띄우는 탭 바 컨트롤러에 있는 0번째 네비게이션 바 컨트롤러 접근
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController
            // 해당 화면을 띄우는 탭 바 컨트롤러에 있는 0번째 네비게이션 바 컨트롤러에 있는 FirstViewController에 접근
            let fitstVC = nav.viewControllers[0] as! FirstViewController
            
            // 해당 화면을 띄우는 탭 바 컨트롤러에 있는 네비게이션 바 컨트롤러에 있는 FirstViewController에 속한 isLoggedIn 변수에 접근
            fitstVC.isLoggedIn.toggle()
        }
        
        dismiss(animated: true, completion: nil)
    }
}


