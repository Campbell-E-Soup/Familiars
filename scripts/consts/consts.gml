enum Familars {
	None,
	Cat,
	Dog,
	Mink,
	Turtle,
	Viper,
	Penguin,
	Monkey,
	Lucky
}

enum Items {
	None,
	//Class Items
	HolySpear,
	RingArmor,
	AmuletDisc,
	RecklessClub,
	//Uncommon
	Spellbook,
	IronHelm,
	Shield,
	//Common
	Buckler,
	Dagger,
	Flail
}

enum CombatPhase {
	MoveFoward,
	FirstStrike,
	Damage,
	LastStrike,
	MoveAway,
	MoveToBack,
	AnimateDamage,
	Done
}

enum Characters {
	Wizard,
	Witch,
	Rogue,
	Paladin,
	Barb,
	
	Cook,
	Farmer,
	Smith
}

function init() {
	globalvar CharacterInfo, Team, DescFamiliar, DescItem, FamiliarName, ItemName, CharName
	/*Format
	sprite, item, hp, def, atk, familar, name
	*/
	var array = [
		/*Wizard*/ [sWizard,Items.RingArmor,4,4,6,-1,"The Wizard"],
		/*Witch*/  [sWitch,Items.None,5,5,6,Familars.Lucky,"The Witch"],
		/*Rogue*/  [sRogue,Items.AmuletDisc,4,5,5,-1,"The Rogue"],
		/*Paladin*/[sPaladin,Items.HolySpear,4,6,4,-1,"The Paladin"],
		/*Barb*/   [sBarb,Items.RecklessClub,10,5,4,Familars.None,"The Barbarian"],
		
		//classless
		/*Cook*/  [sCook,Items.None,6,2,3,Familars.None,"The Cook"],
		/*Farmer*/[sFarmer,Items.None,3,3,4,Familars.None,"The Farmer"],
		/*Smith*/ [sSmith,Items.None,3,5,3,Familars.None,"The Smith"]
	];
	CharacterInfo = array;
	
	var a = [
		[],
		[],
		[],
		[]
	];
	
	Team = a;
	
	var FamDesc = [
		"",
		"+2 to DEF.",
		"+1 to ATK.",
		"1 in 3 chance to dodge an attack.",
		"Doubles base defense, attacks last.",
		"Half ATK, ATK ignores enemy DEF",
		"Freezes an enemy, preventing them from moving.",
		"Chance to enter a bonus room after combat.",
		"+3 to ATK, +3 to DEF, +3 to HP"
	]
	var NameDesc = [
		"",
		"Cat",
		"Dog",
		"Mink",
		"Turtle",
		"Viper",
		"Penguin",
		"Monkey",
		"Lucky"
	]
	DescFamiliar = FamDesc;
	FamiliarName = NameDesc;
	var NameItem = [
		"",
		"Holy Spear",
		"Ring of Mage Armor",
		"Amulet of Discovery",
		"Club of Recklessness",
		"Giant Spellbook",
		"Iron Helm",
		"Shield",
		"Buckler",
		"Dagger",
		"Flail"
	]
	var ItemDesc = [
		"",
		"Deals additional damage equal to 1/3rd DEF.",
		"Additional DEF equal to the first enemies ATK.",
		"Chance to level up an additional time after combat. +1 DEF, +1 ATK",
		"Deals bonus damage but take damage equal to one half bonus damage.",
		"+4 to ATK, -2 to DEF",
		"+6 to DEF, -2 to ATK",
		"+4 to DEF",
		"+2 to DEF",
		"+1 to ATK",
		"+2 to ATK"
	]
	DescItem = ItemDesc;
	ItemName = NameItem;
	
	var NameChar = [
		"The Wizard",
		"The Witch",
		"The Rogue",
		"The Paladin",
		"The Barbarian",
		"The Cook",
		"The Farmer",
		"The Smith"
	]
	
	CharName = NameChar;
}