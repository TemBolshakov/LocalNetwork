<!doctype html>
<html lang="ru">
<head>

    <title>Расчет параметров</title>
</head>
<body>
<form action="/network/parametrs/create/${networks.id}" method="post">
    Количество портов в коммутаторе доступа:
    <input type="radio" id="choice1.1" name="access" value="8" checked/>
    <label for="choice1">8</label>
    <input type="radio" id="choice1.2" name="access" value="24"/>
    <label for="choice2">24</label>
    <input type="radio" id="choice1.3" name="access" value="32"/>
    <label for="choice3">32</label>
    <br><br>
    Количество портов в коммутаторе агрегации:
    <input type="radio" id="choice2.1" name="distribution" value="8" checked/>
    <label for="choice1">8</label>
    <input type="radio" id="choice2.2" name="distribution" value="24"/>
    <label for="choice2">24</label>
    <input type="radio" id="choice2.3" name="distribution" value="32"/>
    <label for="choice3">32</label>
    <br><br>
    Количество портов в коммутаторе ядра:
    <input type="radio" id="choice3.1" name="core" value="8" checked/>
    <label for="choice1">8</label>
    <input type="radio" id="choice3.2" name="core" value="24"/>
    <label for="choice2">24</label>
    <input type="radio" id="choice3.3" name="core" value="32"/>
    <label for="choice3">32</label>
    <br><br>
<input type="submit" value="Рассчитать параметры"/>
</form>
</body>
</html>