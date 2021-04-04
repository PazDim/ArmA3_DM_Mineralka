/* Скрипт настройки снаряжения. Параметры:
 * index - Номер экипировки. Если выходит за пределы допустимого, то выбирается
 * набор 0
 * opticFlag - Если true, то прицел(в случае наличия) устанавливается на оружие,
 * иначе кладется в инвентарь) */

index = param[0, 0];
scopeFlag = param[1, false];

/* Удаляем всю экипировку */
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

/* Наборы экипировки */
switch (index) do
{
    /* ЕМР лес, АК-74 */
    case 0:
    {
        player forceAddUniform "rhs_uniform_emr_patchless";
        player addVest "rhs_6b23_digi";
        
        player addWeapon "rhs_weap_ak74m";
        player addPrimaryWeaponItem "rhs_acc_dtk";
        player addPrimaryWeaponItem "rhs_acc_perst1ik";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhs_acc_ekp1";
        }
        else
        {
            player addItemToUniform "rhs_acc_ekp1";
        };
        player addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";

        for "_i" from 1 to 3 do {player addItemToUniform "rhs_30Rnd_545x39_7N10_AK";};
        for "_i" from 1 to 2 do {player addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
        player addHeadgear "rhs_6b28";
    };
    case 1:
    {
        /* MARPAT, M4 */
        player forceAddUniform "rhs_uniform_FROG01_wd";
        player addVest "rhsusf_spc";

        player addWeapon "rhs_weap_m4a1_blockII";
        player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_compm4";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_compm4";
        };
        player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        player addPrimaryWeaponItem "rhsusf_acc_kac_grip";

        for "_i" from 1 to 3 do {player addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        player addHeadgear "rhsusf_lwh_helmet_marpatwd";
        player addGoggles "rhs_googles_clear";
    };
    case 2:
    {
        /* ACUPAT, Mk17 */
        player forceAddUniform "rhs_uniform_abu";
        player addVest "rhsusf_iotv_ucp_Grenadier";
        
        player addWeapon "rhs_weap_SCARH_FDE_LB";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_RX01";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_RX01";
        };
        player addPrimaryWeaponItem "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk";
        player addPrimaryWeaponItem "rhsusf_acc_grip2_tan";

        for "_i" from 1 to 2 do {player addItemToUniform "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk";};
        for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk";};
        player addHeadgear "rhsusf_patrolcap_ucp";
        player addGoggles "G_Aviator";
    };
    case 3:
    {
        /* РФ ЧВК, АК-103 */
        player forceAddUniform "rhs_uniform_gorka_r_g";
        player addVest "rhs_6sh92_digi_headset";
        
        player addWeapon "rhs_weap_ak103_zenitco01";
        player addPrimaryWeaponItem "rhs_acc_dtk3";
        player addPrimaryWeaponItem "rhs_acc_perst3";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_mrds_fwd";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_mrds_fwd";
        };
        player addPrimaryWeaponItem "rhsusf_acc_grip3";
        player addPrimaryWeaponItem "rhs_30Rnd_762x39mm_polymer";

        for "_i" from 1 to 2 do {player addItemToUniform "rhs_30Rnd_762x39mm_polymer";};
        for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_762x39mm_polymer";};
        player addHeadgear "rhs_fieldcap_khk";
        player addGoggles "rhs_googles_black";
    };
    case 4:
    {
        /* Бомж, АКМ */
        player addWeapon "rhs_weap_akm";
        player addPrimaryWeaponItem "rhs_acc_dtkakm";
        player addPrimaryWeaponItem "rhs_30Rnd_762x39mm_bakelite";

        player forceAddUniform "U_BG_Guerilla3_1";
        player addVest "V_BandollierB_khk";

        for "_i" from 1 to 3 do {player addItemToUniform "rhs_30Rnd_762x39mm_bakelite";};
        for "_i" from 1 to 2 do {player addItemToVest "rhs_30Rnd_762x39mm_bakelite";};
        player addHeadgear "H_Bandanna_sand";
        player addGoggles "G_Bandanna_tan";
    };
    case 5:
    {
        /* US ЧВК, М4 */
        player forceAddUniform "U_BG_Guerilla2_1";
        player addVest "V_TacVest_brn";
        
        player addWeapon "rhs_weap_m4a1_blockII_wd";
        player addPrimaryWeaponItem "rhsusf_acc_SF3P556";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_M2A1";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_M2A1";
        };
        player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        player addPrimaryWeaponItem "rhsusf_acc_grip2";

        for "_i" from 1 to 3 do {player addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        player addHeadgear "rhsusf_bowman_cap";
    };
    case 6:
    {
        /* Woodland, M16 */
        player forceAddUniform "rhs_uniform_bdu_erdl";
        
        player addWeapon "rhs_weap_m16a4_carryhandle";
        player addPrimaryWeaponItem "rhsusf_acc_SFMB556";
        player addPrimaryWeaponItem "acc_flashlight";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_compm4";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_compm4";
        };
        player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        
        for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        player addHeadgear "rhs_Booniehat_m81";
    };
    case 7:
    {
        /* СПН РФ, АК-74, дозвук */
        player forceAddUniform "rhs_uniform_gorka_1_b";
        
        player addWeapon "rhs_weap_ak74m";
        player addPrimaryWeaponItem "rhs_acc_tgpa";
        player addPrimaryWeaponItem "rhs_acc_2dpZenit";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhs_acc_1p63";
        }
        else
        {
            player addItemToUniform "rhs_acc_1p63";
        };
        player addPrimaryWeaponItem "rhs_30Rnd_545x39_7U1_AK";
        
        for "_i" from 1 to 4 do {player addItemToUniform "rhs_30Rnd_545x39_7U1_AK";};
        player addHeadgear "rhs_altyn_novisor_bala";
    };
    case 8:
    {
        /* СПН US, HK416 */
        player forceAddUniform "rhs_uniform_g3_blk";
        
        player addWeapon "rhs_weap_hk416d10";
        player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
        player addPrimaryWeaponItem "rhsusf_acc_M952V";
        if (scopeFlag) then
        {
            player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
        }
        else
        {
            player addItemToUniform "rhsusf_acc_eotech_552";
        };
        player addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        player addPrimaryWeaponItem "rhsusf_acc_grip2";
        
        for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
        player addHeadgear "rhsusf_opscore_bk";
        player addGoggles "rhs_googles_clear";
    };
    default
    {
        hint "DEFAUILT";
    }
};

/* Обязательная экипировка */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
