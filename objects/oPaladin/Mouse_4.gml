Team[0] = CharacterInfo[Characters.Paladin];
CharacterSelect.selection++;
CharacterSelect.subText = "";
instance_deactivate_object(oRogue)
instance_deactivate_object(oPaladin)
instance_deactivate_object(oWizard)

instance_activate_object(oCat);
instance_activate_object(oDog);

playSound("Click");