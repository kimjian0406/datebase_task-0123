import pymysql

def find_recent_actions_by_user(conn, user_id, limit=5):
    try:
        with conn.cursor() as cur:
            # 특정 사용자의 최근 행동 검색
            sql = """
            SELECT action, timestamp
            FROM user_actions
            WHERE user_id = %s
            ORDER BY timestamp DESC
            LIMIT %s
            """
            cur.execute(sql, (user_id, limit))
            actions = cur.fetchall()
            
            # 검색 결과 출력
            for action in actions:
                print(f"Action: {action['action']}, Timestamp: {action['timestamp']}")
    except Exception as e:
        print(f"Error occurred: {e}")
        CREATE TABLE user_actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(100) NOT NULL,
    timestamp DATETIME NOT NULL
);INSERT INTO user_actions (user_id, action, timestamp)
VALUES 
    (1, 'click', '2023-04-12 08:00:00'),
    (1, 'view', '2023-04-12 09:00:00'),
    (2, 'purchase', '2023-04-12 10:00:00'),
    (1, 'add_to_cart', '2023-04-12 11:00:00'),
    (1, 'checkout', '2023-04-12 12:00:00'),
    (1, 'logout', '2023-04-12 13:00:00');