from get_db_connection import get_db_connection
import pymssql

def get_teams_in_same_conference_division_as_specified_team(
        team_name : str
):
    
    conn = get_db_connection()
    cursor = conn.cursor(as_dict=True)
    #cursor.execute("{call procGetOtherTeamsInSameConferenceDivisionAsSpecifiedTeam (?)}", (team_name,))
    cursor.callproc("procGetOtherTeamsInSameConferenceDivisionAsSpecifiedTeam", (team_name,))
    rows = cursor.fetchall()
    conn.close()

    #Convert pyodbc.Row objects to Python dictionaries
    results = [
        {
            "TeamName": row["TeamName"],
            
        }
        for row in rows
    ]

    return {"data": results}
