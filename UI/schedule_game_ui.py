import streamlit as st
from fetch_data import fetch_data, post_data


def schedule_game_ui():
    print("Schedule a Game")
    home_team_id = st.text_input("Enter the home team ID: ")
    away_team_id = st.text_input("Enter the away team ID: ")
    game_round = st.text_input("Enter the game round: ")
    game_date = st.text_input("Enter the game date (YYYY-MM-DD): ")
    game_start_time = st.text_input("Enter the game start time (HH:MM:SS): ")
    stadium_id = st.text_input("Enter the stadium ID: ")
    nfl_admin_id = st.text_input("Enter the NFL admin ID: ")

    

    if st.button ("Schedule Game"):
        result = post_data(
            "schedule_game/", 
        {
            "home_team_id": home_team_id,
            "away_team_id": away_team_id,
            "game_round": game_round,
            "game_date": game_date,
            "game_start_time": game_start_time,
            "stadium_id": stadium_id,
            "nfl_admin_id": nfl_admin_id
        },
        method="POST")
    
        st.write(result)
