//This object is used to manage the application_surface

//high depth to avoid interfering with anything being drawn in draw gui begin
depth = 15000;

#macro GAME_SCREEN_WIDTH 320
#macro GAME_SCREEN_HEIGHT 180

#macro EDITOR_VIEW_WIDTH 426
#macro EDITOR_VIEW_HEIGHT 240

current_application_display_width = 320;
current_application_display_height = 180;

application_surface_draw_enable(false);
surface_resize(application_surface, GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT);
