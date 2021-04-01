if (isServer) then
{
    /* Таймстамп для обновления снаряжения */
    _weaponTimestamp = diag_tickTime;
    /* Начальное задание индекса снаряжения */
    weaponSelector = floor (random 6);
    publicVariable "weaponSelector";
    while {true} do
    {
        /* TODO: Обновление индекса снаряжения каждые 3 минуты. Сделать через настройки */
        if ((diag_tickTime - _weaponTimestamp) > 180) then
        {
            /* TODO: Как-то объявить количество наборов экипировки */
            weaponSelector = floor (random 6);
            _weaponTimestamp = diag_tickTime;
        };
        
        /* Удаление трупов. Вынести в отдельный файл. */
        {deleteVehicle _x} forEach allDead;

        publicVariable "weaponSelector";
        sleep 1;
    };
};
