-- 顧客テーブル (customers)
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- いいねテーブル (likes)
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    target_id INT NOT NULL,
    target_type VARCHAR(50) NOT NULL,
    reaction_type ENUM('good', 'bad') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- マッチングテーブル (matchings)
CREATE TABLE matchings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer1_id INT NOT NULL,
    customer2_id INT NOT NULL,
    status ENUM('matched', 'unmatched') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer1_id) REFERENCES customers(id),
    FOREIGN KEY (customer2_id) REFERENCES customers(id)
);

-- チャット部屋テーブル (chat_rooms)
CREATE TABLE chat_rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 顧客とチャット部屋の関連テーブル (chat_room_users)
CREATE TABLE chat_room_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    chat_room_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (chat_room_id) REFERENCES chat_rooms(id)
);

-- チャットテーブル (chat_messages)
CREATE TABLE chat_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chat_room_id INT NOT NULL,
    sender_id INT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_room_id) REFERENCES chat_rooms(id),
    FOREIGN KEY (sender_id) REFERENCES customers(id)
);

-- ログインテーブル (logins)
CREATE TABLE logins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    login_time TIMESTAMP NOT NULL,
    logout_time TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- プロフィール情報テーブル (profiles)
CREATE TABLE profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    bio TEXT,
    age INT,
    gender ENUM('male', 'female', 'other'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 画像テーブル (images)
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- ブロックリストテーブル (block_list)
CREATE TABLE block_list (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    blocked_customer_id INT NOT NULL,
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (blocked_customer_id) REFERENCES customers(id)
);

-- 通報テーブル (reports)
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reporter_id INT NOT NULL,
    reported_customer_id INT NOT NULL,
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reporter_id) REFERENCES customers(id),
    FOREIGN KEY (reported_customer_id) REFERENCES customers(id)
);
