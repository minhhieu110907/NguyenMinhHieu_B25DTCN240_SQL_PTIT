-- 1. TẠO DATABASE VÀ CHỌN ĐỂ SỬ DỤNG
CREATE DATABASE IF NOT EXISTS hackathon;
USE hackathon;

-- 2. TẠO CÁC BẢNG (Rút gọn các ràng buộc phức tạp, chỉ giữ lại Khóa chính & Khóa ngoại)
CREATE TABLE Creator (
    creator_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    platform VARCHAR(20)
);

CREATE TABLE Studio (
    studio_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    price_per_hour DECIMAL(10,2),
    status VARCHAR(20) -- Available hoặc Booked
);

CREATE TABLE LiveSession (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    creator_id VARCHAR(10),
    studio_id VARCHAR(10),
    duration INT,
    FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    amount DECIMAL(10,2),
    method VARCHAR(20),
    FOREIGN KEY (session_id) REFERENCES LiveSession(session_id)
);

-- 3. THÊM DỮ LIỆU MẪU (Mỗi bảng 3 dòng để dễ quan sát)
INSERT INTO Creator VALUES 
('C1', 'Nguyen Van A', 'a@gmail.com', 'Tiktok'),
('C2', 'Tran Thi B', 'b@gmail.com', 'Youtube'),
('C3', 'Le Van C', 'c@gmail.com', 'Tiktok');

INSERT INTO Studio VALUES 
('S1', 'Studio Ha Noi', 200, 'Available'),
('S2', 'Studio Sai Gon', 300, 'Available'),
('S3', 'Studio Da Nang', 250, 'Booked');

INSERT INTO LiveSession (creator_id, studio_id, duration) VALUES 
('C1', 'S1', 2),
('C2', 'S2', 3),
('C1', 'S2', 1);

INSERT INTO Payment (session_id, amount, method) VALUES 
(1, 400, 'Cash'),
(2, 900, 'Card'),
(3, 300, 'Cash');

-- 4. TRUY VẤN CƠ BẢN (Dễ ghi điểm)
-- Liệt kê Creator dùng Tiktok
SELECT * FROM Creator WHERE platform = 'Tiktok';

-- Sắp xếp Studio theo giá giảm dần
SELECT * FROM Studio ORDER BY price_per_hour DESC;

-- 5. TRUY VẤN NÂNG CAO (Để lấy điểm 10)
-- Kết hợp bảng: Xem ai đã thuê Studio nào và bao lâu
SELECT Creator.name, Studio.name, LiveSession.duration
FROM LiveSession
JOIN Creator ON LiveSession.creator_id = Creator.creator_id
JOIN Studio ON LiveSession.studio_id = Studio.studio_id;

-- Thống kê: Tính tổng tiền thu được theo từng phương thức thanh toán
SELECT method, SUM(amount) AS Total
FROM Payment
GROUP BY method;

-- Tìm Studio có giá thuê cao nhất (Sử dụng Subquery đơn giản)
SELECT * FROM Studio 
WHERE price_per_hour = (SELECT MAX(price_per_hour) FROM Studio);