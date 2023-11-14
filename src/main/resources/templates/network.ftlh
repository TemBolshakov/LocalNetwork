<!doctype html>
<html lang="ru">
<head>

    <title>Сеть</title>
</head>
<body>
<h1>Сеть ${networks.id}</h1>
<hr>
<b>Название сети:</b>${networks.name}<br>
<b>Описание:</b>${networks.description}<br>
<b>Количество пользователей:</b>${networks.number}<br>
<b>Топология сети:</b>${networks.topology}<br>

<form action="/network/delete/${networks.id}" method="post">
    <input type="submit" value="Удалить сеть"/>
</form>
<hr>
<a href="/create_parametrs/${networks.id}">Расчитать оборудование</a><br>
<a href="/network/parametrs/${networks.id}">Рассчитанное оборудование</a>
<hr>
<h3><a href="/">На главную</a></h3>
<h3><a href="/networks">К списку сетей</a></h3>
</body>
</html>