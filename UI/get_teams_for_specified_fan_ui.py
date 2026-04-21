import streamlit as st
from fetch_data import fetch_data

def get_teams_for_specified_fan_ui():

    fan_name = st.session_state.app_user_Fullname
    st.header(f"Get Teams associated with {fan_name}")

    input_params = {}
    nfl_fan_id = st.text_input("NFL Fan ID", value=st.session_state.app_user_id, disabled=True)
    #define fetch_data function and call with input_params
    input_params["nfl_fan_id"] = nfl_fan_id
    df = fetch_data ("get_teams_for_specified_fan/", input_params)

    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
    else:
        st.info(f"No teams found for {fan_name} (ID: {nfl_fan_id}). Please adjust your selection and try again.")