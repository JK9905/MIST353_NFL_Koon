import streamlit as st
from fetch_data import get_data

def get_all_changes_made_by_specified_admin_ui():

    st.header("Get Changes made by Specified Admin")

    input_params = {}
    nfl_admin_id_input = st.text_input("NFL Admin ID", value=st.session_state.app_user_id, disabled=True)
    #define fetch_data function and call with input_params
    input_params["nfl_admin_id"] = nfl_admin_id_input
    df = get_data("get_all_changes_made_by_specified_admin/", input_params)

    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
    else:
        st.info("No changes found for the specified admin.")