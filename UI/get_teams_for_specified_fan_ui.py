import streamlit as st
from fetch_data import fetch_data

def get_teams_for_specified_fan_ui():

    st.header("Get Teams for Specified Fan")

    nfl_fan_id = st.number_input("Enter NFL Fan ID", min_value=1, step=1)

    if st.button("Fetch Teams"):
        input_params = {}
        #nfl_fan_id = 
        input_params["nfl_fan_id"] = nfl_fan_id
        #define fetch_data function and call with input_params
        df = fetch_data ("get_teams_for_specified_fan/", input_params)

        if df is not None and not df.empty:
            st.subheader(f"Teams for NFL Fan ID {nfl_fan_id}:")
            st.dataframe(df, use_container_width=True, hide_index=True)
        else:
            st.info(f"No teams found for NFL Fan ID {nfl_fan_id}. Please adjust your selection and try again.")