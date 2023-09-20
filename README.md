# PetsCommando : 애완동물특공대

### 적용 기술

| Skill     | Explain                                    |
| --------- | ------------------------------------------ |
| 아키텍쳐  | MVVM - C                                   |
| 네트워크  | URLSession / Router Pattern / Asnyc, Await |
| 적용 기술 | RxSwift, CodebaseUI                        |
| etc       | 접근 제어자 / Final 적용시키기             |

### Code Convention

| Target   | Explain                              |
| -------- | ------------------------------------ |
| 함수     | 주어 + 동사 + 목적어                 |
| 변수     | Bool Type : is*** / 간결 + 직관적    |
| 네트워크 | 요청 : request ** / 응답 : respond** |

### Commit Convention

| Convention | Explain                             |
| ---------- | ----------------------------------- |
| [Feat]     | 새로운 기능 추가                    |
| [Fix]      | 버그 수정                           |
| [Design]   | UI 작업 변경                        |
| [Refactor] | 코드 리팩토링                       |
| [Comment]  | 주석 추가 및 변경                   |
| [Remove]   | 파일을 삭제하는 작업만 수행 한 경우 |
| [Setting]  | 기본 구성요소들을 작업한 경우|
| [Docs]   | Readme 수정작업                     |

### UI
<img width="931" alt="스크린샷 2023-09-19 오후 8 45 37" src="https://github.com/https-github-com-qudgus1984/PetsCommando/assets/81552265/6c53cd38-a6ab-4757-b1b5-4ec6f151ef53">

### 주요 기능

- 회원가입 : 아이디 중복 체크 및 거주 지역에 대한 정보를 서버에 저장하고 이에 따른 데이터를 보여주도록 구성하였습니다.
- 유기 동물 조회 : 자신이 설정한 위치 정보를 기반으로 지역구의 유기동물을 확인해 볼 수 있으며, 셀 클릭 시 유기 동물에 대한 자세한 정보 및 보호소 이름, 위치 정보, 전화번호, 특징 등을 제공합니다.
- 지도 : 지도를 통해 서울시의 동물 병원들을 조회해 볼 수 있으며, pin 클릭 시 동물 병원에 대한 정보를 확인해 볼 수 있습니다.
- 내 정보 수정 : 사용자가 설정한 닉네임 및 자신의 지역구를 수정할 수 있으며, 변경 시 이에 따른 새로운 지역구의 유기동물 및 커뮤니티에서의 이름이 변경되도록 설정하였습니다.
- 커뮤니티 : 커뮤니티 탭에서 글 작성 및 댓글 달기가 가능합니다.

### 사용 기술

- BottomSheet을 적용하여 댓글달기 기능을 구현하였으며, TextField 클릭 시 함께 화면이 올라가도록 Keyboard Event를 처리하였습니다.
- Coordinator Pattern을 활용하여 화면 전환 Logic 을 분리하였고, 데이터가 필요한 경우 ViewModel에서 init으로 데이터를 주입받고, Coordinator에서 데이터가 전달 되도록 구성하였습니다.
- 지역구를 변경하였을 때 발생하는 Event를 다른 Coordinator를 가지고 있는 ViewModel에서 이벤트를 받기 위해 Notification을 사용하여 구독하고, 필요한 곳에서 통신이 이루어지도록 설계하였습니다.
- Multipartform Data 형식을 사용해서 이미지를 서버에게 보내 이미지를 등록할 수 있도록 구성하였습니다.

### 회고
- Data / Domain의 Layer를 구분하여 ViewModel의 코드 재사용성 및 유지보수성 증가
- 도메인 설계를 지향하면서 각 객체의 의존 방향에 대한 고민
- Rx를 적용하면서 데이터 바인딩에 대한 흐름 이해 및 반응형 프로그래밍 구성
- MVVM 구조로 설계하면서 Logic 분리에 대한 고민
- Coordinator Pattern을 적용하면서 화면 전환 로직에 대해 분리하면서, Navigation을 관리하도록 구성하면서 Data의 전달 부분에 대한 처리 적용
- 각 디자인 패턴 / 아키텍처 등 OOP를 지향하면서 설계했을 때의 지점들에 대한 앞으로의 개발 방향성


