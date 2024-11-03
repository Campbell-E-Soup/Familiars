rare = (irandom_range(Items.HolySpear,Items.RecklessClub));
uncommon = (irandom_range(Items.Spellbook,Items.Shield));
common = (irandom_range(Items.Buckler,Items.Flail));
image_index = 0;
image_alpha = 0;

item = choose(rare,uncommon,uncommon,common,common,common);

scale = 0;

ID = 0;

if (y <= 64) {
	ID = 0;
}

tipScale = 0;

selected = false;

instance_deactivate_object(self);