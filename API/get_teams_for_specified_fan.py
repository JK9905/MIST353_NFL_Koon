from get_db_connection import get_db_connection
import pymssql


def get_teams_for_specified_fan(
        nfl_fan_id : int
    ):
    #with get_db_connection() as conn
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    #cursor.execute("{call procGetTeamsForSpecifiedFan (?)}", (nfl_fan_id,))
    cursor.execute("exec procGetTeamsForSpecifiedFan %s", (nfl_fan_id,))
    rows = cursor.fetchall()
    conn.close()

    #convert row objects to python dicts
    results = [
        {
            "PrimaryTeam" : row["PrimaryTeam"],
            "TeamName" : row["TeamName"]
        }
        for row in rows
    ]

    return {"data" : results}