-- 顧客テーブル (customers)
INSERT INTO customers (name, email, password, created_at, updated_at) VALUES
('John Doe', 'john@example.com', 'password123', NOW(), NOW()),
('Alice Smith', 'alice@example.com', 'password456', NOW(), NOW());

-- いいねテーブル (likes)
INSERT INTO likes (customer_id, target_id, target_type, reaction_type, created_at, updated_at) VALUES
(1, 2, 'profile', 'good', NOW(), NOW()),
(2, 1, 'message', 'bad', NOW(), NOW());

-- マッチングテーブル (matchings)
INSERT INTO matchings (customer1_id, customer2_id, status, created_at, updated_at) VALUES
(1, 2, 'matched', NOW(), NOW()),
(2, 1, 'unmatched', NOW(), NOW());

-- チャット部屋テーブル (chat_rooms)
INSERT INTO chat_rooms (name, created_at, updated_at) VALUES
('Room 1', NOW(), NOW()),
('Room 2', NOW(), NOW());

-- 顧客とチャット部屋の関連テーブル (chat_room_users)
INSERT INTO chat_room_users (customer_id, chat_room_id, created_at, updated_at) VALUES
(1, 1, NOW(), NOW()),
(2, 2, NOW(), NOW());

-- チャットテーブル (chat_messages)
INSERT INTO chat_messages (chat_room_id, sender_id, message, created_at) VALUES
(1, 1, 'Hello, how are you?', NOW()),
(2, 2, 'I am fine, thank you!', NOW());

-- ログインテーブル (logins)
INSERT INTO logins (customer_id, login_time, logout_time) VALUES
(1, '2024-03-24 10:00:00', '2024-03-24 12:00:00'),
(2, '2024-03-24 11:00:00', '2024-03-24 13:00:00');

-- プロフィール情報テーブル (profiles)
INSERT INTO profiles (customer_id, bio, age, gender, created_at, updated_at) VALUES
(1, 'I love hiking and reading.', 30, 'male', NOW(), NOW()),
(2, 'I enjoy painting and cooking.', 25, 'female', NOW(), NOW());

-- 画像テーブル (images)
INSERT INTO images (customer_id, url, created_at, updated_at) VALUES
(1, 'https://example.com/john.jpg', NOW(), NOW()),
(2, 'https://example.com/alice.jpg', NOW(), NOW());
