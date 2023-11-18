<!doctype html>
<html lang="ru">
<head>

    <title>Список сетей</title>
</head>
<body>
<h1>Список сетей</h1>
<hr>
<#list networks as network>
    <p><a href="/network/${network.id}"><b>${network.name}</b></a></p>
</#list>
<hr>
<a href="/create">Создать сеть</a>
<hr>
<h3><a href="/">На главную</a></h3>
</body>
</html>