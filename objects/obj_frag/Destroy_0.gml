/// @description destroy event

//disperse particles
if lifespan<=0
switch(f) {
case 0:
if e!=2 disperse_particles(global.part_system[5],x,x,y,y,irandom_range(3,5),c_orange);
else disperse_particles(global.part_system[5],x,x,y,y,irandom_range(3,5),rgb(82,0,255))
break;
case 2:
if e==0 or e==2 disperse_particles(global.part_system[5],x,x,y,y,irandom_range(3,5),c_yellow);
else if e==1 or e==3 disperse_particles(global.part_system[5],x,x,y,y,irandom_range(3,5),c_red);
break;
default:
disperse_particles(global.part_system[5],x,x,y,y,irandom_range(3,5),global.color[boss.chrsel]);
break;
}

///destroy the afterimage grid
draw_afterimage_remove();

