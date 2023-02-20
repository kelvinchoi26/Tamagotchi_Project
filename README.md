# 다마고치 앱
- [프로젝트 노션 링크](https://organized-elderberry-847.notion.site/bfa6b9d79e2f4d8a9767b27775fb3cf2)
- 진행 기간: 2022/07/22 → 2022/07/27
- 프로젝트 인원: 개인 프로젝트
- 한 줄 소개: 밥알과 물방울을 먹으며 자라는 다마고치를 키우는 앱

***

## 🛠️ 사용 기술 및 라이브러리

- Swift, iOS, UIKit, AutoLayout, Storyboard
- CollectionView, UserDefaults, Toast, LifeCycle

***

## 👾 개발 사항

- UserDefaults를 활용하여 다마고치 데이터 관리
    - 다마고치 레벨, 밥알/물방울 개수, 유저이름 관리
    - 레벨이 오를 수록 레벨에 맞는 다마고치 모습으로 변화
- **Storyboard**로 **Autolayout** 구현
- **LifeCycle** 고려하여 구현
    - 다마고치 키우기 화면에서 **viewWillAppear**마다 사용자에게 보이는 팝업 메시지가 랜덤으로 변경
- **사용자 경험**을 고려하여 구현
    - 한 번에 밥알은 최대 99개, 물방울은 최대 49까지 먹을 수 있게 구현
    - 초과하는 경우 Toast를 통해 사용자에게 알림

| <center>다마고치 선택 화면</center> | <center>다마고치 선택 후 시작</center> | <center>다마고치 키우기 화면</center>
|---|---|---|
| ![b1](https://user-images.githubusercontent.com/70970222/217821242-15813409-e43a-40b5-b97a-a2cfd6c9429a.png) | ![b2](https://user-images.githubusercontent.com/70970222/217821238-2ed83c71-4bd3-4589-8b30-a3f3f4740595.png) | ![b3](https://user-images.githubusercontent.com/70970222/217821236-5f6d6e9a-c426-4804-8726-94b36a1b443c.png)

| <center>밥과 물을 먹여 다마고치 키우기</center> | <center>설정 화면</center> | <center>다마고치 변경하기 화면</center>
|---|---|---|
| ![b4](https://user-images.githubusercontent.com/70970222/217821231-428dc9b5-7888-4502-b3ca-9db5a586b179.png) | ![b5](https://user-images.githubusercontent.com/70970222/217821225-1452aa76-4195-4437-9008-8d03a3f568a0.png) | ![b6](https://user-images.githubusercontent.com/70970222/217821218-505ca355-8083-4098-a7b0-21e13c0f87cd.png)

***

## 회고 / 트러블 슈팅

### 💌 사용자 경험을 고려하여 개발

- 밥알과 물방울 개수에 제한을 설정해 알맞지 않은 값 입력 시 Toast 띄움
- textfield에 아무 값이 입력되지 않아도 버튼 클릭 시 해당 개수 1 오르게 구현

### 🎓 LifeCycle에 대한 이해

- ViewWillAppear를 활용해 다른 뷰로 이동했다가 돌아오는 경우에도 네비게이션 바의 타이틀과 Label의 텍스트를 업데이트
- ViewDidLoad과 ViewWillAppear의 차이점에 대해 경험
    - ViewDidLoad: 화면 처음 만들어질 때 한 번만 실행
    - ViewWillAppear: 이후에도 화면 로드될 때마다 실행

***

## **📊 앱 기능 설명**

**[다마고치 선택 화면]**

- 마음에 드는 다마고치 클릭 후 설명을 확인한 다음 선택하기

**[다마고치 상세 화면]**

- 밥알과 물방울을 먹여 다마고치를 키우기
- 우측 상단의 버튼 클릭 시 설정화면으로 이동

**[설정 화면]**

- 이름 변경하기, 다마고치 변경하기, 데이터 초기화 (이름, 레벨, 밥알/물방울 개수)

**[다마고치 변경 화면]**

- 선택한 다마고치를 변경하기 (이름, 레벨, 밥알/물방울 개수 유지됨)


