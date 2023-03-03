/* 책 대여점 데이터 베이스 실습 */
-- 1. divtbl
SELECT *
  FROM divtbl;

-- 2. bookstbl
SELECT *
  FROM bookstbl;
  
-- 3. membertbl
SELECT *
  FROM membertbl;
  
-- 4. rentaltbl
SELECT *
  FROM rentaltbl;
  
-- 책을 봅시다
SELECT REPLACE(b.Author, ',' ,'/')                   AS '저자명'
     , b.Division                                    AS '장르코드'
     , b.Names                                       AS '책제목'
     , DATE_FORMAT(b.ReleaseDate, '%Y년 %m월 %d일')  AS '출판일'
     , FORMAT(b.Price, '0,000')                      AS '금액'
  FROM bookstbl       AS b
;

-- DATEFormat 예제
SELECT DATE_FORMAT('2023-03-03 17:05:10', '%Y년 %m월 %e일 %H시 %i분 %s초') AS '일시';

-- 회원을 봅시다
SELECT m.Names   AS '회원명'
     , m.Levels  AS '회원 등급'
     , m.Addr    AS '주소'
     , m.Mobile  AS '연락처'
     -- SUBSTRING_INDEX(m.Email, '@', 1) : @를 기준으로 앞에 있는 부분만 출력됨
     -- SUBSTRING_INDEX(m.Email, '@', -1) : @를 기준으로 뒤에 있는 부분만 출력됨
     -- CONCAT (문자열1, 문자열2, 문자열3) : 문자열1문자열2문자열3 => 문자열 3개를 붙여줌 
     , CONCAT(UPPER(SUBSTRING_INDEX(m.Email, '@', 1)),
              '@', 
              LOWER(SUBSTRING_INDEX(m.Email, '@', -1)))
              AS '이메일'
  FROM membertbl AS m
 ORDER BY m.Names ASC;
 
