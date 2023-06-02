# Shoping_Web

```프로젝트 폴더 구조
-src
	-main	
		-webapp 	- pages(페이지에 대한 jsp를 모아두는 부분 / body태그 부분만 작성 하면 된다.)
					-main.jsp : main화면을 나타내는 부분 (상단에 title을 적어준다)
					-introduce.jsp : 소개 페이지 (상단에 title을 적어준다)
				-config(footer, header와 같은 공통적인 jsp를 모아두는 부분)
					-header : body태그 위에 까지 
					-footer : body태그가 끝나고 나서
					-nav : 내비게이션바 부분
					-banner : 내비게이션바 하단에 나오는 배너 사진 부분
				

		-resources 	- assets(메인페이지에 필요한 아이콘을 저장 하는 폴더)
		   		- css(css파일들을 모아두는 폴도)
					-style.css : 메인화면에 대한 css
					-introduce.css : 소개 페이지에 대한 css
		   		- js(javascript파일들을 모아두는 폴더)
					-scripts.js : 현재 사용X
					-introduce.js : 소개 페이지에 대한 js
				-image : 이미지 파일을 모아두는 폴더
				
		-WEB-INF
			-lib
				-jstl-1.2.jar : jquery를 사용하기 위해 jar파일 추가 : 현재 문제로 인해 사용 안
```
