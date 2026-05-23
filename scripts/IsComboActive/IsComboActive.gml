// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function IsComboActive() {
    return (atk_1_hit || atk_1_combo2_hit || atk_1_combo3_hit || 
            atk_2_hit || atk_3_hit || 
            trans1_atk_1_hit || trans1_atk_2_hit || 
            trans2_atk_1_hit || trans2_atk_2_hit ||
            atk_1_chain_hit || atk_1_chain2_hit || atk_2_chain_hit ||
            combo_1_chain_hit || trans1_atk_1_combo1_hit ||
            atk_2_to_1_chain_hit || trans3_atk_1hit);
}
