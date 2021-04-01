/* Индекс снаряжения. Обновляется сервером, используется клиентами. */
weaponSelector = -1;

/* Флаг установки прицела. Изначально активен, изменяется при сохранении
 * инвентаря, используется при выдаче снаряжения. */
opticFlag = true;
equipFunction = compile preprocessFile "equip.sqf";

/* Ждем создания игрока */
waitUntil {!isNull player};
/* Ждем, пока сервер установит индекс снаряжения */
waitUntil {-1 != weaponSelector};
/* Обработчик возрождения (настраивает экипировку, телепортирует игрока */
player addEventHandler ["Respawn",
{
    /* Выдача снаряжения, с учетом настроек игрока */
    [weaponSelector, opticFlag] call equipFunction;
}];
/* Обработчик инвенторя (сохраняет параметры экипировки) */
player addEventHandler ["InventoryClosed",
{
    /* Получаем снаряжение игрока */
    _items = weaponsItems player;
    /* Проверяем количество элементов в массиве */
    if (count _items > 0) then
    {
        _item = _items select 0;
        if (count _item > 3) then
        {
            /* Обновляем флаг установленного прицела */
            if ("" == _item select 3) then
            {
                opticFlag = false;
            }
            else
            {
                opticFlag = true;
            };
        }
    };
}];
[weaponSelector, opticFlag] call equipFunction;
