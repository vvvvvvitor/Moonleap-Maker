/// @description Insert description here
// You can write your code in this editor
time-=1
if instance_exists(oPauseMenu) {drawinfo=false}
if time<10 {drawinfo=false}

if drawinfo=true  { bright=approach(bright,3,0.25)}
if drawinfo=false and bright!=0 {bright=approach(bright,0,0.25)}

if time<0 {instance_destroy()}