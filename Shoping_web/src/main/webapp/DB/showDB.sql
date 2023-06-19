show tables;


drop table categoris;


CREATE TABLE categoris (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL DEFAULT 'new category',
  parent_category_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME,
  deleted_at DATETIME
);


select * from categoris;


insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"남자", null, now(), now()
);


insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"여자", null, now(), now()
);

--남자 상하의
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"상의", 1, now(), now()
);

insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"하의", 1, now(), now()
);


--여자 상하의
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"상의", 2, now(), now()
);

insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"하의", 2, now(), now()
);


--남자 상의 종류
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"긴팔", 3, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"반팔", 3, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"셔츠", 3, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"기타", 3, now(), now()
);

--남자 하의 종류
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"청바지", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"반바지", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"슬랙스", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"카고", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"데님", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"밴딩", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"쿨", 4, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"기타", 4, now(), now()
);


--여자 상의 종류
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"긴팔", 5, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"반팔", 5, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"셔츠", 5, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"기타", 5, now(), now()
);

--여자 하의 종류
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"청바지", 6, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"반바지", 6, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"치마", 6, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"데님", 6, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"밴딩", 6, now(), now()
);
insert into categoris(name, parent_category_id, created_at, updated_at) values
(
"기타", 6, now(), now()
);


select * from products;
desc products;

--상품을 넣는 작업
insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path) values
(
8, "반팔 티셔츠 5종", 42000, 0, 100, now(), now(), "../resources/image/product1.png"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path) values
(
8, "반팔 티셔츠 5종", 42000, 0, 100, now(), now(), "../resources/image/product1.png"
);

UPDATE products SET product_introduce='main1' WHERE category_id=8;

-----------
insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
14, "카고 팬츠", 55000, 48000, 100, now(), now(), "../resources/image/product2.png", "main2"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
14, "카고 바지", 49000, 47000, 100, now(), now(), "../resources/image/product3.png", "main3"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
15, "데님 팬츠", 39000, 0, 100, now(), now(), "../resources/image/product4.png", "main4"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
8, "반팔 셔츠", 55000, 48000, 100, now(), now(), "../resources/image/product5.png", "main5"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
15, "데님 팬츠", 58000, 0, 100, now(), now(), "../resources/image/product6.png", "main6"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
16, "밴딩 팬츠 2종", 32000, 28000, 100, now(), now(), "../resources/image/product9.png", "main7"
);

insert into products(category_id, name, price, discount, amount, created_at, updated_at, main_image_path, product_introduce) values
(
17, "쿨 팬츠 2종", 32000, 0, 100, now(), now(), "../resources/image/product10.png", "main8"
);









