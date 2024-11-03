randomize();
if (!variable_global_exists("Bonus")) {
	globalvar Level, Bonus;
	Level = 0;
	Bonus = false;
}
if (Level > 10) {WON = true; room_goto(Menu); exit;}
	if (Bonus) {
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		layer_background_blend(back_id, make_color_rgb(56,43,30));
		var tileHide = layer_get_id("Tiles");
		var tileShow = layer_get_id("Bonus");
		layer_set_visible(tileHide,false);
		layer_set_visible(tileShow,true);
	}
	else {
		if (Level >= 4) {
			if (Level >= 7) {
				var tileHide = layer_get_id("Tiles");
				var tileShow = layer_get_id("Tiles3");
				layer_set_visible(tileShow,true);
			}
			else {
				var tileHide = layer_get_id("Tiles");
				var tileShow = layer_get_id("Tiles2");
				layer_set_visible(tileHide,false);
				layer_set_visible(tileShow,true);
				var lay_id = layer_get_id("Background");
				var back_id = layer_background_get_id(lay_id);
				layer_background_blend(back_id, make_color_rgb(27,11,11));
			}
		}
	}
	DebugMessage(Concat("Bonus: ",Bonus," ","Level: ",Level))
	globalvar PCCombatList, NPCList;
	PCCombatList = ds_list_create();
	NPCList = ds_list_create();
	//init();

fadeOut = layer_background_get_id("Fade")

fade = 1.2;
var pX = 264;
var pY = 256;
var eX = 256+128+8;
var eY = 256;


for (var i = 0; i < 4; i++) {
	var CharData = Team[i];
	if (array_length(CharData) > 0 ) {
		var PC = instance_create_layer(pX-(68*i), pY,"Characters",oPC);
		with PC {
			sprite_index = CharData[0];
			item = CharData[1];
			hp = CharData[2];
			def = CharData[3];
			atk = CharData[4];
			familiar = CharData[5];
			name = CharData[6];
			if (familiar == -1) {
				familiar = Familars.None;
			}
			pos = i;
			//TODO REMOVE REMIND REMIND!!!!
			//hp = 100;
			//def = 0
			ds_list_add(PCCombatList,self);
		}
	}
	var howMany = 4;
	if (Level < 6) {howMany = 3}
	if (i < howMany) {
		var NPC = instance_create_layer(eX+(68*i), eY,"Characters",oNPC);
		with NPC {
			
			if (Bonus) {
				sprite_index = choose(sBonusGoblin,sBonusSpider,sBonusSkel);
				switch (sprite_index) {
					case sBonusGoblin: atk=0; def=0; hp=3; item=Items.None; break;
					case sBonusSkel: atk=0; def=0; hp=3; item=Items.None; break;
					case sBonusSpider: atk=0; def=0; hp=3; item=Items.None; break;
				}
			}
			else {
				if (Level < 4) {
					sprite_index = choose(sGoblinBarb,sGoblinMage,sGoblinRanger);
					//item = choose(Items.Flail,Items.Buckler,Items.Spellbook,Items.None);
					var rare = (irandom_range(Items.HolySpear,Items.RecklessClub));
					var uncommon = (irandom_range(Items.Spellbook,Items.Shield));
					var common = (irandom_range(Items.Buckler,Items.Flail));
					switch (sprite_index) {
						case sGoblinBarb: atk=3; def=2; hp=4; item=choose(common, common,Items.None); break;
						case sGoblinMage: atk=5; def=1; hp=2; item=choose(common,Items.None); break;
						case sGoblinRanger: atk=3; def=3; hp=3; item=choose(common, common,Items.None); break;
					}
				}
				else if (Level < 7) {
					sprite_index = choose(sMonBask,sMonBeast,sMonBat);
					//item = choose(Items.Flail,Items.Buckler,Items.Spellbook,Items.None);
					var rare = (irandom_range(Items.HolySpear,Items.RecklessClub));
					var uncommon = (irandom_range(Items.Spellbook,Items.Shield));
					var common = (irandom_range(Items.Buckler,Items.Flail));
					switch (sprite_index) {
						case sMonBask: atk=4; def=3; hp=5; item=choose(common, common,uncommon); break;
						case sMonBeast: atk=5; def=6; hp=2; item=choose(common,uncommon); break;
						case sMonBat: atk=4; def=4; hp=3; item=choose(common, common,uncommon); break;
					}
				}
				else{
					sprite_index = choose(sSkelArcher,sSkelMage,sSkelThrall);
					//item = choose(Items.Flail,Items.Buckler,Items.Spellbook,Items.None);
					var rare = (irandom_range(Items.HolySpear,Items.RecklessClub));
					var uncommon = (irandom_range(Items.Spellbook,Items.Shield));
					var common = (irandom_range(Items.Buckler,Items.Flail));
					switch (sprite_index) {
						case sSkelMage: atk=5; def=5; hp=3; item=choose(rare, uncommon,uncommon); break;
						case sSkelArcher: atk=4; def=5; hp=2; item=choose(rare,uncommon); break;
						case sSkelThrall: atk=6; def=5; hp=3; item=choose(rare, uncommon,uncommon); break;
					}
				}
				for (var j = 1; j < Level; j++) {
					var n = irandom(2)
					switch (n) {
						case 0: atk+=1; break;
						case 1: hp+=1;  break;
						case 2: def+=1; break;
					}
				}
			}
			pos = i;
			ds_list_add(NPCList,self);
		}
	}
}

mouse_sprite = pointer_null;
mouse_object = pointer_null;

win = false;
lose = false;

roundTimer = 30;

clear = false;
itemSelected = pointer_null;

draw_set_font(fntDefault);
global.CombatStarted = false;

//animation variables
globalvar combat;
combat = CombatPhase.Done;
combatX = room_width div 2;
combatTimer = 60*2; //2 seconds

function DealDamage(phase) {
	var PC = PCCombatList[| 0];
	var NPC = NPCList[| 0];
	var PHP = PC.hp;
	var NHP = NPC.hp;
	var PCATK = PC.atk + PC.atkBuff;
	var NPCATK = NPC.atk + NPC.atkBuff;
	var TempATK = 0;
	if (PC.item == Items.RecklessClub) {
		var d = irandom_range(3,6);
		PCATK+=d
		NPCATK+= floor(d/2);
	}
	
	if (NPC.item == Items.RecklessClub) {
		var d = irandom_range(3,6);
		NPCATK+=d
		PCATK+= floor(d/2);
	}
	
	if (phase == CombatPhase.Damage) {
		NPC.freeze = false;
		if (NHP > 0) { 
			if (PC.familiar == Familars.Mink) {
				DebugMessage("Mink")
				if (irandom(1) != 1) {
					if (NPCATK >= PC.finDef) {
						TempATK = NPCATK
						NPCATK -= PC.finDef;
						PC.finDef = 0;
						PC.hp -= NPCATK;
					}
					else {
						TempATK = NPCATK
						PC.finDef -= NPCATK;
					}
				}
				else {
					DebugMessage("Dodged!");
				}
			}
			else {
				if (NPCATK >= PC.finDef) {
						TempATK = NPCATK
						NPCATK -= PC.finDef;
						PC.finDef = 0;
						PC.hp -= NPCATK;
					}
					else {
						TempATK = NPCATK
						PC.finDef -= NPCATK;
					}
			}
		}
		if (TempATK > 0) {
			var d  = instance_create_depth(PC.x,PC.y,-1,oDamage)
			d.dmg = TempATK;
		}
		TempATK = 0;
		switch PC.familiar {
			case (Familars.Viper):
				PCATK = floor(PCATK/2)
				TempATK = PCATK;
				NPC.hp -= PCATK
				DebugMessage("Viper")
				break;
			case (Familars.Penguin): TempATK = PCATK;
				if (PCATK >= NPC.finDef) {
					PCATK -= NPC.finDef;
					NPC.finDef = 0;
					NPC.hp -= PCATK;
				}
				else {
					NPC.finDef -= PCATK;
				}
				NPC.freeze = true
				DebugMessage("Penguin")
				break;
			case (Familars.Turtle): DebugMessage("Turtle"); break;
			default: TempATK = PCATK; 
				if (PCATK >= NPC.finDef) {
					
					PCATK -= NPC.finDef;
					NPC.finDef = 0;
					NPC.hp -= PCATK;
				}
				else {
					NPC.finDef -= PCATK;
				}
				DebugMessage("EE")
				
		}
		
		if (TempATK > 0) {
			var d  = instance_create_depth(NPC.x+16,NPC.y,-1,oDamage)
			d.dmg = TempATK;
		}
		
	}
	else if (phase == CombatPhase.LastStrike) {
		if (PC.familiar == Familars.Turtle) {
			if (PCATK >= NPC.finDef) {
				PCATK -= NPC.finDef;
				NPC.finDef = 0;
				NPC.hp -= PCATK;
			}
			else {
				NPC.finDef -= PCATK;
			}
			DebugMessage("Attacked Last")
		}
	}
	else if (phase == CombatPhase.FirstStrike) {
		if (PC.item == Items.HolySpear) {
			TempATK = 0;
			var ATK = ceil(PC.def / 3);
			TempATK = ATK;
			if (NPC.finDef >= ATK) {
				NPC.finDef -= ATK
			}
			else {
				ATK -= NPC.finDef;
				NPC.finDef = 0;
				NPC.hp -= ATK;
			}
			if (TempATK > 0) {
				var d  = instance_create_depth(NPC.x-16,NPC.y,-1,oDamage)
				d.dmg = TempATK;
			}
		}
		
		if (NPC.item == Items.HolySpear) {
			TempATK = 0;
			var ATK = ceil(NPC.def / 3);
			TempATK = ATK;
			if (PC.finDef >= ATK) {
				PC.finDef -= ATK
			}
			else {
				ATK -= PC.finDef;
				PC.finDef = 0;
				PC.hp -= ATK;
			}
			if (TempATK > 0) {
				var d  = instance_create_depth(PC.x+16,PC.y,-1,oDamage)
				d.dmg = TempATK;
			}
		}
	}
}