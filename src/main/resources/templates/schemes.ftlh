<!doctype html>
<html lang="ru">
<head>
    <title>Схема ${parametrs.id}</title>
    <style>
        #drawingCanvas {
            border: 1px solid #000;
        }

    </style>
</head>
<body>
    <h1>Схема сети ${parametrs.id}</h1>
    <hr>
    <canvas id="drawingCanvas" width="1280px" height="720x"></canvas>
    <hr>
    <h3><a href="/">На главную</a></h3>
    <h3><a href="/networks">К списку сетей</a></h3>

    <script>
        const canvas = document.getElementById("drawingCanvas");
        if(canvas.getContext) {
            const ctx = canvas.getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "black";
            let offsetX, offsetY;
            let selectedObject = null;

            //Создание массивая коммутаторов доступа
            const objectAccess = [];
            //Заполнения параметров коммутатора доступа
            for (let i = 0; i < ${parametrs.switch_access}; i++) {
                const newAccess = {
                    coordX: randomCoordinate(20, 1250),
                    coordY: randomCoordinate(20, 220),
                    sizeX: 20,
                    sizeY: 20,
                    isDragging: false
                };
                objectAccess.push(newAccess);
            }

            const objectDisribution = [];
            for (let j = 0; j < ${parametrs.switch_distribution}; j++) {
                const newDistibution = {
                    coordX: randomCoordinate(30, 1240),
                    coordY: randomCoordinate(250, 450),
                    sizeX: 30,
                    sizeY: 30,
                    isDragging: false
                };
                objectDisribution.push(newDistibution);
            }

            const objectCore = [];
            for (let k = 0; k < ${parametrs.switch_core}; k++) {
                const newCore = {
                    coordX: randomCoordinate(40, 1230),
                    coordY: randomCoordinate(500, 680),
                    sizeX: 40,
                    sizeY: 40,
                    isDragging: false
                };
                objectCore.push(newCore);
            }


            function drawScheme(objectAccess, objectDisribution, objectCore) {
                ctx.clearRect(0, 0, 1280, 720);
                //Отрисовка коммутаторов доступа
                for (let i = 0; i < ${parametrs.switch_access}; i++) {
                    ctx.fillStyle = "red";
                    ctx.fillRect(objectAccess[i].coordX, objectAccess[i].coordY, objectAccess[i].sizeX, objectAccess[i].sizeY);
                }

                for (let j = 0; j < ${parametrs.switch_distribution}; j++) {
                    ctx.fillStyle = "blue";
                    ctx.fillRect(objectDisribution[j].coordX, objectDisribution[j].coordY, objectDisribution[j].sizeX, objectDisribution[j].sizeY);
                }

                for (let j = 0; j < ${parametrs.switch_core}; j++) {
                    ctx.fillStyle = "green";
                    ctx.fillRect(objectCore[j].coordX, objectCore[j].coordY, objectCore[j].sizeX, objectCore[j].sizeY);
                }

                for (let x1 = 0; x1 < ${parametrs.switch_distribution}; x1++) {
                    for (let x2 = 0; x2 < ${parametrs.switch_core}; x2++) {
                        ctx.beginPath();
                        ctx.moveTo(objectDisribution[x1].coordX + 15, objectDisribution[x1].coordY + 30);
                        ctx.lineTo(objectCore[x2].coordX + 20, objectCore[x2].coordY);
                        ctx.stroke();
                    }
                    for (let y = 0; y < ${parametrs.switch_access}; y++) {
                        ctx.beginPath();
                        ctx.moveTo(objectDisribution[x1].coordX + 15, objectDisribution[x1].coordY);
                        ctx.lineTo(objectAccess[y].coordX + 10, objectAccess[y].coordY + 20);
                        ctx.stroke();
                    }
                }

            }

            function getObjectUnderMouse(x, y) {
                for(let j1 = objectAccess.length - 1; j1 >= 0; j1--) {
                    const object = objectAccess[j1];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                for(let j2 = objectDisribution.length - 1; j2 >= 0; j2--) {
                    const object = objectDisribution[j2];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                for(let j3 = objectCore.length - 1; j3 >= 0; j3--) {
                    const object = objectCore[j3];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                return null;
            }

            //Рандомайзер
            function randomCoordinate(min, max) {
                return Math.random() * (max - min) + min;
            }

            canvas.addEventListener('mousedown', function(event) {
                const rect = canvas.getBoundingClientRect();
                const mouseX = event.clientX - rect.left;
                const  mouseY = event.clientY - rect.top;

                selectedObject = getObjectUnderMouse(mouseX, mouseY);
                if(selectedObject) {
                    selectedObject.isDragging = true;
                    offsetX = mouseX - selectedObject.coordX;
                    offsetY = mouseY - selectedObject.coordY;
                }
            });

            canvas.addEventListener('mousemove', function (event) {
                if(selectedObject.isDragging) {
                    const rect = canvas.getBoundingClientRect();
                    const mouseX = event.clientX - rect.left;
                    const  mouseY = event.clientY - rect.top;
                    selectedObject.coordX = mouseX - offsetX;
                    selectedObject.coordY = mouseY - offsetY;
                    ctx.fillRect(selectedObject.coordX, selectedObject.coordY, selectedObject.sizeX, selectedObject.sizeY);
                    drawScheme(objectAccess, objectDisribution, objectCore);
                }


            });

            canvas.addEventListener('mouseup', function () {
                selectedObject.isDragging = false;
                selectedObject = null;
            });

            drawScheme(objectAccess, objectDisribution, objectCore);
        }
    </script>
</body>
</html>