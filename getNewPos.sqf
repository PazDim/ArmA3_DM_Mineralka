/* Скрипт для генерации случайной позиции для игрока. Область поиска -
 * прямоугольный маркер respawn_area. Ищет свободную позицию в отдалении от
 * остальных игроков. */

/* Минимальная дистация до всех игроков */
#define MIN_PLAYER_DISTANCE 20
 
 /* Параметры области спавна */
_markerSize = getMarkerSize "respawn_area";
_markerPos = getMarkerPos "respawn_area";
_markerDir = markerDir "respawn_area";

_newPos = position player;
_cycleFlag = true;
while {_cycleFlag} do
{
    /* Получаем новую позицию в системе координат области спавна */
    _newPos = [(random (_markerSize select 0) * 2) - (_markerSize select 0),
                (random (_markerSize select 1) * 2) - (_markerSize select 1)];
    /* Перевод сгенерированной точки в систему координат карты */
    _newPos = [(_newPos select 0) * cos(_markerDir) + (_newPos select 1) * sin(_markerDir) + (_markerPos select 0),
                -(_newPos select 0) * sin(_markerDir) + (_newPos select 1) * cos(_markerDir) + (_markerPos select 1)];

    /* Ищем ближайшее свободное место */
    _freePos = [_newPos, 0, 2, 2] call BIS_fnc_findSafePos;
    /* Проверяем дистанцию между найденной точкой и сгенерированной (бывают
     * ошибки) */
    if ((_freePos distance2d _newPos) < 10) then
    {
        _newPos = _freePos;
        /* Проверяем дистацию до всех игроков */
        _cycleFlag = false;
        {
            /* Если это другой игрок и дистанция до него меньше допустимой -
             * продолжаем поиск точки */
            if ((_x != player) && ((_newPos distance2D _x) < MIN_PLAYER_DISTANCE)) then
            {
                _cycleFlag = true;
            };
        } forEach allPlayers;
    };
};

/* Возвращаем найденную позицию */
_newPos