from get_db_connection import get_db_connection
from datetime import date, time
import pymssql


def schedule_game(
        home_team_id : int,
        away_team_id : int,
        game_round : str,
        game_date : date,
        game_start_time : time,
        stadium_id : int,
        nfl_admin_id : int
    ):
    
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)

    try: #tries a procedure and if the procedure fails, it will catch the exception
        cursor.execute("exec procScheduleGame %s, %s, %s, %s, %s, %s, %s", (home_team_id, away_team_id, game_round, game_date, game_start_time, stadium_id, nfl_admin_id))
        conn.commit() #puts change in database
        return ({"status message" : "Game scheduled successfully."})
    except Exception as e:
        conn.rollback()
        if (f"UNIQUE KEY constraint" in str(e)):
           return ({"status message" : "Game scheduling failed: Game already scheduled with the same teams and date."})
        else:
            return ({"status message" : f"Error occurred: {e}"})
    finally:
        cursor.close()
        conn.close()
        #dont put code after return


    
    
   