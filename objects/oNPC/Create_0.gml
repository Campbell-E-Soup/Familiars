image_xscale = 2;
image_yscale = 2;

item = Items.None;

def = 3; defBuff = 0;
hp = 3;  //no hp buff
atk = 3; atkBuff = 0;

baseX = x;
baseY = y;

var itemFrame = instance_create_layer(x+8,y+56,"UI",oItemNPC)
itemFrame.boundNPC = self;
itemFrame.ItemSprite = item;
boundFrame = itemFrame;

DebugMessage($"{x}")

finDef = def+defBuff;
shake = false;

freeze = false;
time = 0;