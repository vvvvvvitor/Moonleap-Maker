if(async_load[? "type"] == "GooglePlayServices_SignIn")
{
    if(!async_load[?"success"])
       exit

    if(async_load[?"isAuthenticated"])
    {
        show_debug_message("GoolePlayServices Player Authenticated")
    }
    else
    {
        show_debug_message("Lets continue without GooglePlayGameServices")
		//GooglePlayServices_SignIn();
    }
}