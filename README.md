# TabBarCode

## 🖥️ 프로젝트 소개

- [이전에 진행했던 프로젝트](https://github.com/kangsworkspace/TabBarCode) 를 리펙토링하였습니다.
- 기존에 로그인 창이 계속 백그라운드에 남아있던 문제를 해결하였습니다.  
먼저 SceneDelegate에서 willConnectTo 단계에서 탭 바를 선언한 FirstViewController를 화면에 제일 처음 표시되도록 하였습니다.  
그리고 FirstViewController에 viewDidAppear 단계에서 isLoggedIn 변수를 이용해 로그인이 되어있지 않다면. 
LoginViewController가 나타나도록 하였습니다.  
마지막으로 LoginViewController에서 Login 버튼을 누르면 Dismiss함수가 동작해서 백그라운드에 남아있지 않게 됩니다.


<br>

## 👀 프로젝트 구성

- 여섯개의 ViewController로 구성되어 있습니다.
- SceneDelegate에서 탭 바를 선언하였습니다.
- FirstViewController에 isLoggedIn 변수를 선언하였고, LoginViewController에는 Login 버튼이 있습니다.
- Login버튼을 통해 isLoggedIn 변수에 접근하였고 .toggle()을 이용하여 간단한 로그인을 구현했습니다.

<br>

## 📌 학습한 주요 내용

#### 뷰 컨트롤러, 탭 바, 네비게이션 바에 대한 접근 이해

FirstViewController를 네비게이션 바의 루트 뷰 컨트롤러로 담았고,  
그리고 네비게이션 바(FirstViewController)를 포함한 뷰 컨트롤러들을 탭 바에 담았습니다.
따라서 FirstViewController에 있는 isLoggedIn변수에 접근하기 위해 다음과 같이 탭 바 -> 네비게이션 바 -> FirstViewController -> isLoggedIn 순으로 접근해야 했습니다.
```swift
if let presentingVC = presentingViewController {
    
    let tabBarCon = presentingVC as! UITabBarController
    let nav = tabBarCon.viewControllers?[0] as! UINavigationController
    let fitstVC = nav.viewControllers[0] as! FirstViewController
    
    fitstVC.isLoggedIn.toggle()
}
``` 


#### 뷰 컨트롤러의 생명 주기와 SceneDelegate 주기에 대한 이해

viewDidAppear() 함수를 통해 실제 스크린에 뷰가 나타난 후 LoginViewController 를 띄웠습니다.  
또한 SceneDelegate에서 viewDidLoad가 호출되기 전인 willConnectTo 단계에서 탭 바를 선언하고 루트 뷰를 설정하였습니다.   
기본적인 viewDidLoad() 외의 시점들을 활용해보았습니다.


## 🎬 완성된 모습(전과 동일합니다.)
![화면 기록 2023-08-16 오후 3 49 39](https://github.com/kangsworkspace/TabBarCode/assets/141600830/aa7bbc21-4753-4dca-b146-cb8d41cfae17)


## 🙉 문제점 및 해결

처음에는 뷰 컨트롤러가 전환되는 것에 대한 이해가 부족하여 오류가 있었습니다.  
presentingViewController 없이 바로 firstVC에 FirstViewController() 할당하여 사용하였는데,
로그인 버튼을 눌러도 계속해서 로그인 창이 나타났습니다.  
오류가 난 이유는 presentingViewController를 통해 해당 창을 띄우는 뷰 컨트롤러에 접근하지 않고
계속해서 새로운 FirstViewController를 만들어 화면 위에 쌓았기 때문이었습니다.  


또한 아래와 같이 화면에 뷰가 fullScreen으로 표시되지 않는 에러가 발생하였습니다.
![errs1](https://github.com/kangsworkspace/TabBarCode-Refectoring/assets/141600830/3ca8fe42-fcca-45d9-a9ce-460b8303b929)
modalPresentationStyle = .fullScreen 코드에 오타가 있나 확인하였지만 정상이었고. 
FirstViewController를 변수에 할당하지 않고 바로 사용했기 때문에 생긴 오류였습니다.  
변수에 할당해서 .fullScreen 세팅하였고 할당한 뷰 컨트롤러를 present()하였습니다.  

