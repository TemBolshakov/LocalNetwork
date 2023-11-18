<!doctype html>
<html lang="ru">
<head>

    <title>Параметры сети</title>
</head>
<body>
<h1>Параметры сети ${parametrs.id}</h1>
<hr>
<b>Количество пользователей:</b>${parametrs.number}<br>
<b>Количество коммутаторов доступа:</b>${parametrs.switch_access}<br>
<b>Количество коммутаторов агрегации:</b>${parametrs.switch_distribution}<br>
<b>Количество коммутаторов ядра:</b>${parametrs.switch_core}<br>
<hr>
<a href="/schemes/${parametrs.id}">Создать схему сети</a>
<hr>
<h3><a href="/">На главную</a></h3>
<h3><a href="/network/${parametrs.id}">Сеть ${parametrs.id}</a></h3>
<h3><a href="/networks">К списку сетей</a></h3>
</body>
</html>