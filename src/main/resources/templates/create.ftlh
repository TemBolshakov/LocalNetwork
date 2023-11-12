<!doctype html>
<html lang="ru">
<head>

    <title>Создание схемы</title>
</head>
<body>
<h1>Создание схемы</h1>
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
    Топология сети:
    <input type="radio" id="choice1" name="topology" value="Шина" checked/>
    <label for="choice1">Шина</label>
    <input type="radio" id="choice2" name="topology" value="Кольцо"/>
    <label for="choice2">Кольцо</label>
    <input type="radio" id="choice3" name="topology" value="Звезда"/>
    <label for="choice3">Звезда</label>
    <input type="radio" id="choice4" name="topology" value="Дерево"/>
    <label for="choice4">Дерево</label>
    <br><br>
    <input type="submit" value="Добавить сеть"/>
</form>
<hr>
<h3><a href="/">На главную</a></h3>
</body>
</html>