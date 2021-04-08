/* Скрипт для генерации случайной позиции для игрока. Область поиска -
 * прямоугольный маркер respawn_area. Ищет свободную позицию в отдалении от
 * остальных игроков. */

 /* Параметры области спавна */
_markerSize = getMarkerSize "respawn_area";
_markerPos = getMarkerPos "respawn_area";
_markerDir = markerDir "respawn_area";

/* Получаем новую позицию в системе координат области спавна */
_newPos = [(random (_markerSize select 0) * 2) - (_markerSize select 0),
            (random (_markerSize select 1) * 2) - (_markerSize select 1)];
/* Перевод сгенерированной точки в систему координат карты */
_newPos = [(_newPos select 0) * cos(_markerDir) + (_newPos select 1) * sin(_markerDir) + (_markerPos select 0),
            -(_newPos select 0) * sin(_markerDir) + (_newPos select 1) * cos(_markerDir) + (_markerPos select 1)];

/* Ищем ближайшее свободное место */
_newPos = [_newPos, 0, 2, 2] call BIS_fnc_findSafePos;

/* Возвращаем найденную позицию */
_newPos