# JSP 쇼핑몰 프로젝트 (shopjsp)

간단한 학습용 JSP + MySQL 기반 쇼핑몰 예제입니다.  
회원가입, 로그인(세션), 상품 목록 조회, 장바구니 기능을 포함하며 DAO 패턴으로 DB를 처리합니다. 실제 서비스 전용이 아닌 학습/데모 목적입니다.

---

## 주요 기능
- 회원가입 / 로그인 (세��� 기반)
- 상품 목록 조회
- 장바구니에 상품 추가 및 조회
- MySQL 연동을 통한 데이터 영속화

---

## 요구 사항
- Java 8 이상
- Apache Tomcat 8/9 이상 (또는 호환되는 서블릿 컨테이너)
- MySQL 5.7 이상 (권장 MySQL 8)
- MySQL Connector/J (JAR 파일을 `WebContent/WEB-INF/lib`에 추가)

---

## 설치 및 실행

1. 저장소 클론 또는 ZIP 압축 해제
```bash
git clone https://github.com/kimdaehyun89/shopjsp.git
cd shopjsp
```

2. 데이터베이스 생성 및 샘플 데이터 삽입  
   `sql/shopdb_setup.sql` 파일을 MySQL에서 실행하세요:
```sql
-- 예: MySQL 클라이언트에서
source /path/to/shopjsp/sql/shopdb_setup.sql;
```

3. DB 연결 정보 설정  
   `src/util/DBUtil.java`에서 DB 접속 정보 수정:
```java
private static final String URL = "jdbc:mysql://localhost:3306/shopdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

4. MySQL Connector/J 추가  
   `mysql-connector-java-*.jar`를 `WebContent/WEB-INF/lib/`에 넣으세요.

5. 브라우저 접속: `http://localhost:8080/shopjsp`

---

## 파일 구조
```
shopjsp/
├── sql/
│   └── shopdb_setup.sql
├── src/
│   ├── util/DBUtil.java
│   ├── user/UserDAO.java
│   ├── product/Product.java
│   ├── product/ProductDAO.java
│   └── cart/CartDAO.java, CartItem.java
├── WebContent/
│   ├── index.jsp
│   ├── jsp/
│   │   ├── login.jsp
│   │   ├── register.jsp
│   │   ├── product_list.jsp
│   │   └── cart.jsp
│   └── WEB-INF/
│       └── web.xml
└── README.md
```

---

## 사용 방법 (간단)
1. 회원가입: `/WebContent/jsp/register.jsp`
2. 로그인: `/WebContent/jsp/login.jsp`
3. 로그인 성공 후 상품 목록 확인: `/WebContent/jsp/product_list.jsp`
4. 상품 선택 → 수량 지정 → 장바구니에 담기 → `/WebContent/jsp/cart.jsp`에서 확인

---

## 보안 및 개선 권장 사항
- 비밀번호는 평문 저장 금지 — 반드시 bcrypt 등으로 해시 처리하세요.
- 입력값 검증(서버/클라이언트) 추가
- HTTPS 적용 및 세션 보안 강화(secure, HttpOnly)
- CSRF 보호 (토큰 기반)
- 예외 처리 및 로깅(로그 레벨 설정)
- SQL 트랜잭션 처리 및 커넥션 풀 사용 고려 (DB 성능/안정성)

---

## 개발 / 배포 팁
- IDE: Eclipse, IntelliJ에서 Dynamic Web Project 또는 Maven/Gradle 설정 후 Tomcat 연동
- 더 큰 프로젝트로 발전시키려면 서블릿/컨트롤러 분리, JSP 최소화, MVC 프레임워크 도입(Spring 등) 권장

---

## 라이선스
학습용 예제 — 자유롭게 사용하되 출처 표기를 권장합니다.

---

## 문의
문제가 있거나 기능 추가 요청이 있으면 이 저장소의 이슈(issues)를 사용해 주세요.
