-- 데이터베이스 및 테이블 생성 스크립트
CREATE DATABASE IF NOT EXISTS shopdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE shopdb;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  description TEXT
);

CREATE TABLE IF NOT EXISTS cart (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- 샘플 상품 데이터 (중복 삽입 방지)
INSERT INTO products (name, price, description)
SELECT * FROM (SELECT '상품1' AS name, 10000 AS price, '상품1 설명' AS description) AS tmp
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = '상품1');

INSERT INTO products (name, price, description)
SELECT * FROM (SELECT '상품2' AS name, 20000 AS price, '상품2 설명' AS description) AS tmp
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = '상품2');

INSERT INTO products (name, price, description)
SELECT * FROM (SELECT '상품3' AS name, 30000 AS price, '상품3 설명' AS description) AS tmp
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = '상품3');