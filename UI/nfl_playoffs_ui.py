import streamlit as st
from get_teams_by_conference_and_division_ui import get_teams_by_conference_and_division_ui
from get_teams_in_same_conference_and_division_as_specified_team_ui import get_teams_in_same_conference_and_division_as_specified_team_ui

def nfl_playoffs_ui():
    st.title("NFL Playoffs App")
    st.write("Welcome ")

#Creating sidebar for navigation
#dropdown for ngl playoff functionalities
    with st.sidebar:
        st.title("NFL Playoff Functionalities")
        
        api_endpoint = st.selectbox
        "Select a functionality:",
        ["Get Teams by Conference and Division", "Get Teams in Same Conference and Division as Specified Team"]
        if api_endpoint == "Get Teams by Conference and Division":
            get_teams_by_conference_and_division_ui()

        elif api_endpoint == "Get Teams in Same Conference and Division as Specified Team":
            get_teams_in_same_conference_and_division_as_specified_team_ui()