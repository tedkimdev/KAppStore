# KAppStore
iTunes API를 이용한 앱스토어 구현

ScreenShots
-----------
<img width="40%" src="https://user-images.githubusercontent.com/20268356/26839230-5b0b3054-4b1d-11e7-94d4-a4409cc8894a.png"><img width="40%" src="https://user-images.githubusercontent.com/20268356/26839192-448f4afe-4b1d-11e7-8208-af5574db1e6f.png">

Description
-----------
- 앱 리스트 화면: 테이블뷰 사용
- 앱 상세 화면: 콜렉션뷰 사용

TODO
----
- 앱 상세 화면, Segmented Control 부분
- 앱 상세 화면, Content Cell 높이 더보기 부분
- 로딩 중일 때, 로딩 뷰 표현 등

소스리뷰
------
- ApiService 부분에 for 문 말고, map 쓰도록 변경
- URLSession dataTask 에 response 객체가 가지는 값들 ?
- uiwebview wkwebview 차이 -> 메모리 관리 관련
- 오토레이아웃에 마진 준 이유? -> 실수
- 유져 레이팅 뷰 값 다시 또 들어왓을때 이미지 뷰 처리 어떻게 할 것인가?
- layoutsubview drawrect 차이
- 모바일 웹이랑 앱 실행 어떻게 ? 
- 셀에 configure 함수는 왜 만들었나?
- 유져 레이팅 뷰가 rating이 외부에서 접근가능한데 위험해보이지 않은가?
- rating 값이 변경되었을 때, UIImage 어떻게 처리?
- 




그외
---
- 자료구조 힙 탐색 시간
- 정렬 문제..
- 인성
- 협업 
