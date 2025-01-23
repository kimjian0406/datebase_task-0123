import mysql.connector
from datetime import datetime

def update_user_actions_before_date(db_config, user_id, date, old_action, new_action):
    # MySQL 데이터베이스 연결
    connection = mysql.connector.connect(
        host=db_config["host"],
        user=db_config["user"],
        password=db_config["password"],
        database=db_config["database"]
    )
    
    cursor = connection.cursor()
      cursor = connection.cursor()

    # UPDATE 쿼리 작성
    query = """
        UPDATE user_actions
        SET action = %s
        WHERE user_id = %s 
          AND action = %s
          AND timestamp < %s;
    """
    # 파라미터 값
    params = (new_action, user_id, old_action, date.strftime('%Y-%m-%d %H:%M:%S'))

    # 쿼리 실행
    cursor.execute(query, params)
    connection.commit()

    # 업데이트된 행 수 출력
    print(f"Updated {cursor.rowcount} rows.")

    # 리소스 정리
    cursor.close()
    connection.close()
    # 함수 실행 코드
db_config = {
    "host": "localhost",  # 데이터베이스 호스트
    "user": "your_username",  # MySQL 사용자 이름
    "password": "your_password",  # MySQL 비밀번호
    "database": "your_database_name"  # 데이터베이스 이름
}

update_user_actions_before_date(
    db_config,
    user_id=1,
    date=datetime(2023, 4, 13),
    old_action="view",
    new_action="seen"