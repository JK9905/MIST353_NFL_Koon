from get_db_connection import get_db_connection
import pymssql


def get_all_changes_made_by_specified_admin(
        nfl_admin_id : int
    ):
    #with get_db_connection() as conn
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    #cursor.execute("{call procGetTeamsForSpecifiedFan (?)}", (nfl_fan_id,))
    cursor.execute("exec procGetAllChangesMadeBySpecifiedAdmin %s", (nfl_admin_id,))
    rows = cursor.fetchall()
    conn.close()

    #convert row objects to python dicts
    results = [
        {
            "ChangeType" : row["ChangeType"],
            "ChangeDescription" : row["ChangeDescription"],
            "ChangeDateTime" : row["ChangeDateTime"]
        }
        for row in rows
    ]

    return {"data" : results}
