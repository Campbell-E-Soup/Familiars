image_xscale = 2;
image_yscale = 2;
image_xscale = -image_xscale;

nearDeath = false


time = 0;

pos = -1;
familiar = irandom(Familars.Monkey);
if (sprite_index == sWitch) {
	familiar = Familars.Lucky;
}
item = irandom(Items.Flail);
name = "";
baseX = x;
baseY = y;

petX = x;
petY = y;

var itemFrame = instance_create_layer(x-8,y+56,"UI",oItem)
itemFrame.boundPC = self;
//itemFrame.ItemSprite = item;
boundFrame = itemFrame;

def = 7; defBuff = 0;
hp = 5;  /*no hp buff*/ baseHP = hp;
atk = 5; atkBuff = 0;

finDef = def+defBuff;
shake = false;

if (familiar == Familars.Cat) {
	if (hp < 9) hp = 9;
}
else if (familiar == Familars.Lucky) {
	hp += 4;
}