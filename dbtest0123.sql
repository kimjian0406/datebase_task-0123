CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100)
);
INSERT INTO books (title, author, genre)
VALUES 
    ('Harry Potter', 'J.K. Rowling', 'fantasy'),
    ('The Hobbit', 'J.R.R. Tolkien', 'fantasy'),
    ('To Kill a Mockingbird', 'Harper Lee', 'classic');
    Title: Harry Potter, Author: J.K. Rowling
Title: The Hobbit, Author: J.R.R. Tolkien
import pymysql

def calculate_average_ratings(cursor):
    # 감독별 평균 평점을 계산하는 SQL 쿼리
    query = """
    SELECT director, AVG(rating) AS average_rating
    FROM movies
    GROUP BY director
    ORDER BY average_rating DESC
    """

    try:
        # 쿼리 실행
        cursor.execute(query)
        results = cursor.fetchall()

        # 결과 출력
        print("감독별 평균 평점:")
        for result in results:
            director = result[0]
            average_rating = result[1]
            print(f"감독: {director}, 평균 평점: {average_rating:.2f}")

    except Exception as e:
        print(f"평균 평점 계산 실패: {e}")
        # 함수 실행 코드
def main():
    connection = pymysql.connect(
        host='localhost',
        user='your_user',  # MySQL 사용자명
        password='your_password',  # MySQL 비밀번호
        database='your_database'  # 데이터베이스 이름
    )

    try:
        with connection.cursor() as cursor:
            calculate_average_ratings(cursor)  # 감독별 평균 평점 계산 함수 호출
        connection.commit()

    finally:
        connection.close()

if __name__ == "__main__":
    main()



