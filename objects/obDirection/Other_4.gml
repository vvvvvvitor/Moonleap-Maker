/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if os_type!=os_ios and os_type!=os_android {visible=false exit;}
l=virtual_key_add(x-65,y-48,64,64,vk_left)
r=virtual_key_add(x   ,y-48,64,64,vk_right)

u=virtual_key_add(x-24,y-80,48,64,vk_up)
d=virtual_key_add(x-24,y+8, 48,64,vk_down)


/*
virtual_key_show(l)
virtual_key_show(r)
virtual_key_show(u)
virtual_key_show(d)