/*
Navicat PGSQL Data Transfer

Source Server         : Project
Source Server Version : 90603
Source Host           : localhost:5432
Source Database       : TestProject
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2018-06-15 03:19:25
*/


-- ----------------------------
-- Sequence structure for Authors_id_author_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Authors_id_author_seq";
CREATE SEQUENCE "public"."Authors_id_author_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;
SELECT setval('"public"."Authors_id_author_seq"', 7, true);

-- ----------------------------
-- Sequence structure for Books_book_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Books_book_id_seq";
CREATE SEQUENCE "public"."Books_book_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."Books_book_id_seq"', 10, true);

-- ----------------------------
-- Sequence structure for Genres_id_genre_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Genres_id_genre_seq";
CREATE SEQUENCE "public"."Genres_id_genre_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;
SELECT setval('"public"."Genres_id_genre_seq"', 7, true);

-- ----------------------------
-- Sequence structure for OrderList_order_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."OrderList_order_id_seq";
CREATE SEQUENCE "public"."OrderList_order_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for Authors
-- ----------------------------
DROP TABLE IF EXISTS "public"."Authors";
CREATE TABLE "public"."Authors" (
"id" int4 DEFAULT nextval('"Authors_id_author_seq"'::regclass) NOT NULL,
"author_name" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Authors
-- ----------------------------
INSERT INTO "public"."Authors" VALUES ('1', 'Роберт Хайнлайн');
INSERT INTO "public"."Authors" VALUES ('2', 'Дэн Симмонс');
INSERT INTO "public"."Authors" VALUES ('3', 'Анджей Сапковский');
INSERT INTO "public"."Authors" VALUES ('4', 'Б. Оксендаль');
INSERT INTO "public"."Authors" VALUES ('5', 'В. З. Партон');
INSERT INTO "public"."Authors" VALUES ('6', 'Станислав Бересь');
INSERT INTO "public"."Authors" VALUES ('7', 'Е. М. Морозов');

-- ----------------------------
-- Table structure for AuthorsOfBooks
-- ----------------------------
DROP TABLE IF EXISTS "public"."AuthorsOfBooks";
CREATE TABLE "public"."AuthorsOfBooks" (
"id_author" int4,
"id_book" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of AuthorsOfBooks
-- ----------------------------
INSERT INTO "public"."AuthorsOfBooks" VALUES ('1', '1');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('1', '7');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('2', '2');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('2', '3');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('3', '4');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('3', '8');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('3', '9');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('4', '5');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('5', '6');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('5', '10');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('6', '9');
INSERT INTO "public"."AuthorsOfBooks" VALUES ('7', '10');

-- ----------------------------
-- Table structure for Books
-- ----------------------------
DROP TABLE IF EXISTS "public"."Books";
CREATE TABLE "public"."Books" (
"book_title" varchar(255) COLLATE "default",
"description" varchar(255) COLLATE "default",
"price" float4,
"id" int4 DEFAULT nextval('"Books_book_id_seq"'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Books
-- ----------------------------
INSERT INTO "public"."Books" VALUES ('История Будущего', 'Цикл художественных произведений в жанре научной фантастики, описывающий предполагаемое будущее человечества с середины 20-го века до начала 23 века.', '429.98', '1');
INSERT INTO "public"."Books" VALUES ('Иллион', 'Терраформированный Марс второго тысячелетия нашей эры. Могущественные игроки, представляющиеся олимпийскими богами, воссоздают Троянскую войну. Профессор Хокенберри из ХХ века, воскрешенный в чужом мире. ', '254.91', '2');
INSERT INTO "public"."Books" VALUES ('Олимп', 'Окончание знаменитой дилогии Дэна Симмонса, истории, накал страстей в которой превосходит экшн большинства голливудских блокбастеров!', '327.99', '3');
INSERT INTO "public"."Books" VALUES ('Геральт', 'Сапковский - писатель, обладающий талантом творить абсолютно оригинальные фэнтези, полностью свободные от влияния извне, однако связанные с классической мифологической традицией.', '546.12', '4');
INSERT INTO "public"."Books" VALUES ('Стохастические дифференциальные уравнения. Введение в теорию и приложения', 'Учебник по теории и приложениям случайных процессов известного норвежского математика, написанный простым, четким и ясным языком. Для его усвоения достаточно сведений по теории вероятностей в объеме вузовского курса.', '451.27', '5');
INSERT INTO "public"."Books" VALUES ('Механика разрушения: от теории к практике', 'В книге в доступной популярной форме изложены представления о механике разрушения - новом разделе механики твердого деформируемого тела. Содержанием книги охвачен широкий круг вопросов', '348.16', '6');
INSERT INTO "public"."Books" VALUES ('Дверь в лето', 'Каждое живое существо на Земле стремится найти Дверь в Лето. Где тепло, нет холода, нет войны, ненависти, обиды. Где тебя не предаст друг, не обманет невеста. В романе такую Дверь в Лето ищут Дэниел Бун Дэвис и его кот Петроний Арбитр', '223.59', '7');
INSERT INTO "public"."Books" VALUES ('Цири ', 'Заключительные три романа из цикла «Ведьмак Геральт», а также два рассказа из цикла и эссе.', '546.12', '8');
INSERT INTO "public"."Books" VALUES ('История и фантастика', 'Все, что вы хотели узнать об Анджее Сапковском в потрясающем сборнике интервью Анджея Сапковского!', '150.88', '9');
INSERT INTO "public"."Books" VALUES ('Механика упругопластического разрушения. Специальные задачи механики разрушения', 'В данной книге, состоящей из двух частей, изложены современные представления и оригинальные исследования по теории магистральных трещин, способных распространяться в твердых деформируемых телах, приводя к частичному или полному разрушению.', '394.11', '10');

-- ----------------------------
-- Table structure for Genres
-- ----------------------------
DROP TABLE IF EXISTS "public"."Genres";
CREATE TABLE "public"."Genres" (
"id" int4 DEFAULT nextval('"Genres_id_genre_seq"'::regclass) NOT NULL,
"genre" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Genres
-- ----------------------------
INSERT INTO "public"."Genres" VALUES ('1', 'Научные издания, теории, монографии, статьи, лекции');
INSERT INTO "public"."Genres" VALUES ('2', 'Фантастика');
INSERT INTO "public"."Genres" VALUES ('3', 'Сказочная фантастика (фэнтези)');
INSERT INTO "public"."Genres" VALUES ('4', 'Художественная литература');
INSERT INTO "public"."Genres" VALUES ('5', 'Мистическая фантастика');
INSERT INTO "public"."Genres" VALUES ('6', 'Научная фантастика');
INSERT INTO "public"."Genres" VALUES ('7', 'Биографии писателей и поэтов');

-- ----------------------------
-- Table structure for GenresOfBooks
-- ----------------------------
DROP TABLE IF EXISTS "public"."GenresOfBooks";
CREATE TABLE "public"."GenresOfBooks" (
"id_genre" int4,
"id_book" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of GenresOfBooks
-- ----------------------------
INSERT INTO "public"."GenresOfBooks" VALUES ('1', '5');
INSERT INTO "public"."GenresOfBooks" VALUES ('1', '6');
INSERT INTO "public"."GenresOfBooks" VALUES ('1', '10');
INSERT INTO "public"."GenresOfBooks" VALUES ('2', '1');
INSERT INTO "public"."GenresOfBooks" VALUES ('2', '2');
INSERT INTO "public"."GenresOfBooks" VALUES ('2', '3');
INSERT INTO "public"."GenresOfBooks" VALUES ('3', '2');
INSERT INTO "public"."GenresOfBooks" VALUES ('3', '3');
INSERT INTO "public"."GenresOfBooks" VALUES ('3', '8');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '1');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '2');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '3');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '4');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '7');
INSERT INTO "public"."GenresOfBooks" VALUES ('4', '8');
INSERT INTO "public"."GenresOfBooks" VALUES ('5', '4');
INSERT INTO "public"."GenresOfBooks" VALUES ('6', '1');
INSERT INTO "public"."GenresOfBooks" VALUES ('6', '7');
INSERT INTO "public"."GenresOfBooks" VALUES ('7', '9');

-- ----------------------------
-- Table structure for OrderList
-- ----------------------------
DROP TABLE IF EXISTS "public"."OrderList";
CREATE TABLE "public"."OrderList" (
"order_id" int2 DEFAULT nextval('"OrderList_order_id_seq"'::regclass) NOT NULL,
"customer_name" text COLLATE "default" NOT NULL,
"customer_surname" text COLLATE "default" NOT NULL,
"customer_address" text COLLATE "default" NOT NULL,
"number_of_books" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of OrderList
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."Authors_id_author_seq" OWNED BY "Authors"."id";
ALTER SEQUENCE "public"."Books_book_id_seq" OWNED BY "Books"."id";
ALTER SEQUENCE "public"."Genres_id_genre_seq" OWNED BY "Genres"."id";
ALTER SEQUENCE "public"."OrderList_order_id_seq" OWNED BY "OrderList"."order_id";

-- ----------------------------
-- Primary Key structure for table Authors
-- ----------------------------
ALTER TABLE "public"."Authors" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Books
-- ----------------------------
ALTER TABLE "public"."Books" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Genres
-- ----------------------------
ALTER TABLE "public"."Genres" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."AuthorsOfBooks"
-- ----------------------------
ALTER TABLE "public"."AuthorsOfBooks" ADD FOREIGN KEY ("id_author") REFERENCES "public"."Authors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."AuthorsOfBooks" ADD FOREIGN KEY ("id_book") REFERENCES "public"."Books" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."GenresOfBooks"
-- ----------------------------
ALTER TABLE "public"."GenresOfBooks" ADD FOREIGN KEY ("id_genre") REFERENCES "public"."Genres" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."GenresOfBooks" ADD FOREIGN KEY ("id_book") REFERENCES "public"."Books" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
