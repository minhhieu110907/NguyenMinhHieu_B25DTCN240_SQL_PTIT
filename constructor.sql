
USE sql_qlct;

-- EXERCISE 03: TRUY VẤN CƠ BẢN VÀ SẮP XẾP

-- 1. Hiển thị toàn bộ nội dung của bảng Architect
SELECT * FROM architect;

-- 2. Hiển thị danh sách gồm họ tên và giới tính của kiến trúc sư
SELECT name, sex FROM architect;

-- 3. Hiển thị những năm sinh có thể có của các kiến trúc sư (không trùng lặp)
SELECT DISTINCT birthday FROM architect;

-- 4. Sắp xếp năm sinh tăng dần
SELECT name, birthday FROM architect ORDER BY birthday ASC;

-- 5. Sắp xếp năm sinh giảm dần
SELECT name, birthday FROM architect ORDER BY birthday DESC;

-- 6. Công trình có chi phí từ thấp đến cao, sau đó đến thành phố theo bảng chữ cái
SELECT * FROM building ORDER BY cost ASC, city ASC;


-- EXERCISE 04: TRUY VẤN CÓ ĐIỀU KIỆN 

-- 1. Kiến trúc sư "le thanh tung"
SELECT * FROM architect WHERE name = 'le thanh tung';

-- 2. Công nhân có chuyên môn hàn hoặc điện
SELECT name, birthday FROM worker WHERE skill = 'han' OR skill = 'dien';

-- 3. Công nhân hàn/điện và năm sinh lớn hơn 1948
SELECT name FROM worker WHERE (skill = 'han' OR skill = 'dien') AND birthday > 1948;

-- 4. Công nhân vào nghề khi dưới 20 tuổi
SELECT * FROM worker WHERE (year - birthday) < 20;

-- 5. Công nhân sinh năm 1945, 1940, 1948
SELECT * FROM worker WHERE birthday IN (1945, 1940, 1948);

-- 6. Công trình có chi phí từ 200 đến 500 triệu
SELECT * FROM building WHERE cost BETWEEN 200 AND 500;

-- 7. Kiến trúc sư họ "nguyen"
SELECT * FROM architect WHERE name LIKE 'nguyen%';

-- 8. Kiến trúc sư có tên đệm là "anh"
SELECT * FROM architect WHERE name LIKE '% anh %';

-- 9. Kiến trúc sư tên bắt đầu bằng "th" và có đúng 3 ký tự
SELECT * FROM architect WHERE name LIKE 'th_';

-- 10. Chủ thầu không có số điện thoại
SELECT * FROM contractor WHERE phone IS NULL;