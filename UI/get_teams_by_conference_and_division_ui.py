import streamlit as st
from fetch_data import get_data

def get_teams_by_conference_and_division_ui():

    st.header("Get Teams by Conference and Division")

    conference = st.selectbox("Select Conference", ["","AFC", "NFC"])
    division = st.selectbox("Select Division", ["","North", "South", "East", "West"])

    if st.button("Fetch Teams"):
        input_params = {}
        input_params["conference"] = conference
        input_params["division"] = division
        #define fetch_data function and call with input_params
        df = get_data ("get_teams_by_conference_division/", input_params)

        if df is not None and not df.empty:
            st.subheader(f"Teams in conference {conference} and division {division}:")
            st.dataframe(df, use_container_width=True, hide_index=True)
        else:
            st.info(f"No teams found in conference {conference} and division {division}. Please adjust your selection and try again.")
