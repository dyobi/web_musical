-- MEMBERS TABLE --
DROP TABLE members;
CREATE TABLE members(
    mem_id NUMBER(3) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mem_email VARCHAR2(30) UNIQUE NOT NULL,
    mem_name VARCHAR2(20) NOT NULL,
    mem_pwd VARCHAR2(15),
    mem_tel VARCHAR2(15)
);

-- SEATS TABLE --
DROP TABLE orders;
CREATE TABLE orders(
    buy_id NUMBER(3) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mem_id NUMBER(3) REFERENCES members(mem_id),
    name VARCHAR2(20) NOT NULL,
    seat_num NUMBER(3),
    p_date DATE NOT NULL,
    buy_date DATE DEFAULT sysdate
);

-- POSTS TABLE --
DROP TABLE posts;
CREATE TABLE posts(
    posts_id NUMBER(3) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mem_id NUMBER(3) REFERENCES members(mem_id) NOT NULL,
    author VARCHAR2(20) NOT NULL,
    review VARCHAR2(4000),
    review_date DATE DEFAULT sysdate,
    views NUMBER(4) DEFAULT 0
);