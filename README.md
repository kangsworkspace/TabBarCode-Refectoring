# TabBarCode

## 🖥️ 프로젝트 소개

- 인프런-강의(앨런 Swift문법 마스터 스쿨 (15개의 앱을 만들면서 근본원리부터 배우는 UIKit) 중 Tab Bar 기능을 코드로 구현한 것을 
클론 코딩한 내용입니다.
- 강의를 따라가며 앱을 한번 제작했고 현재의 프로젝트는 동일한 앱을 처음부터 가급적 혼자서 내용을 되새기며 구현해봤습니다.
<br>

## 👀 ViewController 구성
![TabBar1](https://github.com/kangsworkspace/TabBarCode/assets/141600830/5b85cc21-eabf-4844-814c-18d53e63c63a)

- 여섯개의 ViewController로 구성되어 있습니다.
- LoginViewController로 시작하여 로그인 버튼을 누르면 다섯개의 Tab Bar가 나타나는 ViewController로 전환됩니다.
<br>

## 📌 학습한 주요 내용

#### 코드로 탭 바 구현

```swift
let tabBarCon = UITabBarController()
```
코드를 통해 탭 바 컨트롤러 타입인 변수 tabBar를 생성하였고
tabBar변수에 다른 뷰 컨트롤러들을 넣고 이름, 이미지 등을 세팅하였습니다. 

#### present() 함수에 UITabBarController() 타입을 넣을 수 있었습니다.

present() 함수에 ViewController타입만 넣을 수 있을줄 알았는데
UITabBarController()타입으로 화면을 전환했습니다.
UITabBarController()타입인 tabBarCon 변수에 setViewControllers() 함수를 통해 
viewController가 담기기 때문인 것 같습니다.

## 🎬 완성된 모습

![화면 기록 2023-08-16 오후 3 49 39](https://github.com/kangsworkspace/TabBarCode/assets/141600830/aa7bbc21-4753-4dca-b146-cb8d41cfae17)

## 🙉 문제점 및 해결
백그라운드에 계속해서 LoginViewController가 남아 있습니다.
다음에 리팩토링한 내용을 정리하려고 합니다.
