ㅡimfont pymysql
from datetime import datetime

def insert_genre(cursor):
    # 삽입할 책 정보 정의
    book = ("Harry Potter", "J.K Rowling", 1997, "fantasy")
    try:
        # 책 삽입 쿼리
        cursor.execute("INSERT INTO books (title, author, year, genre) VALUES (%s, %s, %s, %s)", book)
        print("책이 삽입되었습니다.")
    except Exception as e:
        print(f"삽입 실패: {e}")
        def find_genre(cursor):
    query = "SELECT * FROM books WHERE genre = 'fantasy'"
    try:
        cursor.execute(query)
        books = cursor.fetchall()
        print("찾은 책 목록:")
        for book in books:
            print(book)
    except Exception as e:
        print(f"조회 실패: {e}")
        def avg_author(cursor):
    query = """
    SELECT director, AVG(rating) AS average 
    FROM movies 
    GROUP BY director 
    ORDER BY average DESC
    """
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        print("감독별 평균 평점:")
        for result in results:
            print(f"감독: {result[0]}, 평균 평점: {result[1]:.2f}")
    except Exception as e:
        print(f"평균 평점 계산 실패: {e}")
        def move_user(cursor):
    query = """
    SELECT * FROM user_actions 
    WHERE user_id = 1 
    ORDER BY timestamp ASC 
    LIMIT 5
    """
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for result in results:
            print(result)
    except Exception as e:
        print(f"데이터 처리 실패: {e}")
        def publishing_trend(cursor):
    query = """
    SELECT year, COUNT(*) AS count
    FROM books
    GROUP BY year
    ORDER BY count DESC
    """
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        print("출판 연도별 책의 수:")
        for result in results:
            print(f"출판 연도: {result[0]}, 출판된 책 수: {result[1]}")
    except Exception as e:
        print(f"출판 추세 분석 실패: {e}")
        def update_action(cursor):
    query = """
    UPDATE user_actions
    SET action = 'seen'
    WHERE user_id = 1 AND action = 'view' AND timestamp < '2023-04-13 00:00:00'
    """
    try:
        cursor.execute(query)
        print(f"수정된 문서 수: {cursor.rowcount}")
    except Exception as e:
        print(f"업데이트 실패: {e}")
        def main():
    connection = pymysql.connect(
        host='localhost',
        user='your_user',  # MySQL 사용자명
        password='your_password',  # MySQL 비밀번호
        database='your_database'  # 데이터베이스 이름
    )

    try:
        with connection.cursor() as cursor:
            insert_genre(cursor)  # 장르 삽입
            find_genre(cursor)  # 장르 찾기
            avg_author(cursor)  # 감독별 평균 평점
            move_user(cursor)  # 사용자 이동 데이터 처리
            publishing_trend(cursor)  # 출판 추세 분석
            update_action(cursor)  # 사용자 행동 데이터 업데이트
        connection.commit()  # 커밋

    finally:
        connection.close()

if __name__ == "__main__":
    main()