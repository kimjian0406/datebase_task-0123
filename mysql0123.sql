import pymysql
from datetime import datetime

def insert_data():
    # MySQL 서버 연결
    connection = pymysql.connect(
        host='localhost',
        user='lion@user',      # MySQL 사용자 이름
        password='Newpassword123!!'  # MySQL 비밀번호
        database='datebase_0123'   # 사용할 데이터베이스 이름
)cursor   )
    cursor = conn.cursor()

    # 테이블 생성 (필요시 실행)
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS books (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255),
        author VARCHAR(255),
        year INT
    )    cursor.execute("""
    CREATE TABLE IF NOT EXISTS movies (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255),
        director VARCHAR(255),
        year INT,
        rating FLOAT
    )
    """)
    """) 
     cursor.execute("""
    CREATE TABLE IF NOT EXISTS user_actions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        action VARCHAR(255),
        timestamp DATETIME
    )
    """)
        # 책 데이터 삽입
    books = [
        ("Kafka on the Shore", "Haruki Murakami", 2002),
        ("Norwegian Wood", "Haruki Murakami", 1987),
        ("1Q84", "Haruki Murakami", 2009)
    ]
    cursor.executemany("INSERT INTO books (title, author, year) VALUES (%s, %s, %s)", books)

    # 영화 데이터 삽입
    movies = [
        ("Inception", "Christopher Nolan", 2010, 8.8),
        ("Interstellar", "Christopher Nolan", 2014, 8.6),
        ("The Dark Knight", "Christopher Nolan", 2008, 9.0)
          cursor.executemany("INSERT INTO movies (title, director, year, rating) VALUES (%s, %s, %s, %s)", movies)

    # 사용자 행동 데이터 삽입
    user_actions = [
        (1, "click", datetime(2023, 4, 12, 8, 0)),
        (1, "view", datetime(2023, 4, 12, 9, 0)),
        (2, "purchase", datetime(2023, 4, 12, 10, 0)),
           cursor.executemany("INSERT INTO user_actions (user_id, action, timestamp) VALUES (%s, %s, %s)", user_actions)

    # 변경사항 저장
    conn.commit()

    print("Data inserted successfully")

    # 연결 종료
    cursor.close()
    conn.close()

if __name__ == "__main__":
    insert_data()