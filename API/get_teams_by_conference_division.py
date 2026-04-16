from get_db_connection import get_db_connection
import pymssql

def get_teams_by_conference_division(
        conference : str = None, 
        division : str = None                              
    ):
    #with get_db_connection() as conn
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    #cursor.execute("{call procGetTeamsByConferenceDivision (?, ?)}", (conference, division))
    cursor.callproc("procGetTeamsByConferenceDivision", (conference, division))
    #cursor.execute("exec procGetTeamsByConferenceDivision @conference=%s, division=%s", (conference, division))
    rows = cursor.fetchall()
    conn.close()

    #convert row objects to python dicts
    results = [
        {
            "TeamName": row["TeamName"],
            "Conference": row["Conference"],
            "Division": row["Division"],
            "TeamColors": row["TeamColors"]
        }
        for row in rows
    ]

    return {"data" : results}