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

### 깃허브 브랜치 

개발중인 로컬 브랜치는 origin에 푸쉬 후, develop 브랜치에 merge를 PR을 날립니다. 이 때 release 브랜치에 merge요청을 날리지 않도록 주의해야 합니다.

- main
  - 배포 완료된 브랜치
- release
  - 테스트 플라잇에배포, 심사 대기중인 브랜치
- develop
  - 개발 중인 브랜치
- hotfix
  - 배포 후 급하기 생긴 에러 처리 브랜치
