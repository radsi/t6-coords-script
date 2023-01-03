#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/zombies/_zm_utility;

init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for( ;; )
	{
		level waittill( "connecting", player );
		player thread onplayerspawned();
	}
}

onplayerspawned(){
	self endon("disconnect");
	self thread get_pos();
	for(;;){
		self waittill("spawned_player");
	}
}

get_pos(){
    level endon( "game_ended" );
    self endon("disconnect");
    flag_wait( "initial_blackscreen_passed" );
    self.x = createfontstring( "Objective", 1.7 );
    self.x setpoint( "CENTER", "CENTER", 0, 200 );
    self.x.alpha = 1;
    self.x.hidewheninmenu = 1;
    self.x.hidewhendead = 1;
    self.x.label = &"x: ^1";
    self.y = createfontstring( "Objective", 1.7 );
    self.y setpoint( "CENTER", "CENTER", 0, 150 );
    self.y.alpha = 1;
    self.y.hidewheninmenu = 1;
    self.y.hidewhendead = 1;
    self.y.label = &"y: ^1";
    self.z = createfontstring( "Objective", 1.7 );
    self.z setpoint( "CENTER", "CENTER", 0, 100 );
    self.z.alpha = 1;
    self.z.hidewheninmenu = 1;
    self.z.hidewhendead = 1;
    self.z.label = &"z: ^1";
    for(;;){
        self.x setvalue(self.origin[0]);
        self.y setvalue(self.origin[1]);
        self.z setvalue(self.origin[2]);
        wait 0.05;
    }
}
