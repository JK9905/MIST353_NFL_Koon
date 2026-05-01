import streamlit as st
from fetch_data import get_data

def get_teams_for_specified_fan_ui():

    fan_name = st.session_state.app_user_fullname
    st.header(f"Get Teams associated with {fan_name}")

    input_params = {}
    nfl_fan_id = st.text_input("NFL Fan ID", value=st.session_state.app_user_id, disabled=True)
    #define fetch_data function and call with input_params
    input_params["nfl_fan_id"] = nfl_fan_id
    df = get_data ("get_teams_for_specified_fan/", input_params)

    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
    else:
        st.info("No teams found for the specified fan.")