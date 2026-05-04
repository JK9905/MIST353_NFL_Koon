import streamlit as st
from fetch_data import post_data,get_data
from datetime import date,time


def schedule_game_ui():
    st.header("Schedule a Game")

    #Fetch all teams and stadiums for dropdowns
    parameters = {}
    teams_df = get_data("get_all_teams/", parameters)
    stadiums_df = get_data("get_all_stadiums/", parameters)

    GAME_ROUNDS = ["Wild Card", "Divisional", "Conference", "Super Bowl"]

    #Create dropdowns for HomeTeam, AwayTeam, and Stadiums
    team_options = dict(zip(teams_df["TeamName"], teams_df["TeamID"]))

    stadium_options = dict(zip(stadiums_df["StadiumName"], stadiums_df["StadiumID"]))

    #Create dropdowns for HomeTeam, AwayTeam, and Stadiums
    home_team_name = st.selectbox("Select Home Team", options=list(team_options.keys()))
    away_team_name = st.selectbox("Select Away Team", options=list(team_options.keys()))
    stadium_name = st.selectbox("Select Stadium", options=list(stadium_options.keys()))
    game_round = st.selectbox("Select Game Round", options=GAME_ROUNDS)

    game_date = st.date_input("Select Game Date", value=date.today())
    game_start_time = st.time_input("Select Game Start Time", value=time(13,0))

    if st.button("Schedule Game"):
        if home_team_name == away_team_name:
            st.error("Home team and away team cannot be the same.")
            return
        
        home_team_id = team_options[home_team_name]
        away_team_id = team_options[away_team_name]
        stadium_id = stadium_options[stadium_name]

        parameters = {}
        parameters["HomeTeamID"] = home_team_id
        parameters["AwayTeamID"] = away_team_id
        parameters["StadiumID"] = stadium_id
        parameters["GameRound"] = game_round
        parameters["GameDate"] = game_date.isoformat()
        parameters["GameStartTime"] = game_start_time.isoformat()
        parameters["NFLAdminID"] = st.session_state.app_user_id

        response = post_data("schedule_game/", parameters)

        if response is not None and "status message" in response:
            st.info(response["status message"])
        else:
            st.error("An error occured while scheduling the game. Please try again." )
