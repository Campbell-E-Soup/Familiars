if (ds_exists(PCCombatList,ds_type_list)) {
	ds_list_destroy(PCCombatList);
}
if (ds_exists(NPCList,ds_type_list)) {
	ds_list_destroy(NPCList);
}