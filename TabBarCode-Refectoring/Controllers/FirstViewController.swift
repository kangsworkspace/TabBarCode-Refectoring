//
//  FirstViewController.swift
//  TabBarCode
//
//  Created by Kang on 2023/08/15.
//

import UIKit

class FirstViewController: UIViewController {

    // 로그인 여부 확인 변수
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 로그인이 false일 시 로그인 뷰 컨트롤러로 띄우기
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }
    
    func makeUI() {
        
        view.backgroundColor = .gray
        
        // 네비게이션 바 UI 코드로 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로 설정
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
