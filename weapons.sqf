/* Индекс снаряжения. Обновляется сервером, используется клиентами. */
weaponSelector = 0;

/* Сервер/клиент */
if (isDedicated) then
{
    /* Таймстамп для обновления снаряжения */
    _weaponTimestamp = diag_tickTime;
    if ((diag_tickTime - _weaponTimestamp) > 10) then
    {
        weaponSelector = 0;
        _weaponTimestamp = diag_tickTime;
    };
    publicVariable "weaponSelector";
    sleep 1;
}
else
{
    /* Флаг установки прицела. Изначально активен, изменяется при сохранении
     * инвентаря, используется при выдаче снаряжения. */
    opticFlag = true;

    /* Ждем создания игрока */
    waitUntil {!isNull player};
    /* Обработчик возрождения (настраивает экипировку, телепортирует игрока */
    player addEventHandler ["Respawn",
    {
        /* TODO: Выдача снаряжения, с учетом настроек игрока */
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
}
