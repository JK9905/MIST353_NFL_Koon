from get_db_connection import get_db_connection
from datetime import date, time
import pymssql


def schedule_game(
        HomeTeamID : int,
        AwayTeamID : int,
        GameRound : str,
        GameDate : date,
        GameStartTime : time,
        StadiumID : int,
        NFLAdminID : int
    ):
    
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)

    try: #tries a procedure and if the procedure fails, it will catch the exception
        cursor.execute("exec procScheduleGame %s, %s, %s, %s, %s, %s, %s", (HomeTeamID, AwayTeamID, GameRound, GameDate, GameStartTime, StadiumID, NFLAdminID))
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


    
    
   