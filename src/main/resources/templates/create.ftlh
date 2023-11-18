<!doctype html>
<html lang="ru">
<head>

    <title>Создание сети</title>
</head>
<body>
<h1>Создание сети</h1>
<hr>
<form action="/network/create" method="post">
    Имя сети:<label>
        <input type="text" name="name"/>
    </label>
    <br><br>
    Описание сети:<label>
        <input type="text" name="description"/>
    </label>
    <br><br>
    Количество пользователей:<label>
        <input type="text" name="number"/>
    </label>
    <br><br>

    <input type="submit" value="Добавить сеть"/>
</form>
<hr>
<h3><a href="/">На главную</a></h3>
</body>
</html>