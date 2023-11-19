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

            const objectClient = [];
            for(let i1 = 0; i1 < ${parametrs.number}; i1++) {
                const newClient = {
                    coordX: randomCoordinate(10, 1260),
                    coordY: randomCoordinate(10, 160),
                    sizeX: 10,
                    sizeY: 10,
                    isDragging: false
                };
                objectClient.push(newClient);
            }

            const objectAccess = [];
            for (let i2 = 0; i2 < ${parametrs.switch_access}; i2++) {
                const newAccess = {
                    coordX: randomCoordinate(10, 1250),
                    coordY: randomCoordinate(180, 330),
                    sizeX: 20,
                    sizeY: 20,
                    isDragging: false
                };
                objectAccess.push(newAccess);
            }

            const objectDisribution = [];
            for (let i3 = 0; i3 < ${parametrs.switch_distribution}; i3++) {
                const newDistibution = {
                    coordX: randomCoordinate(10, 1240),
                    coordY: randomCoordinate(360, 500),
                    sizeX: 30,
                    sizeY: 30,
                    isDragging: false
                };
                objectDisribution.push(newDistibution);
            }

            const objectCore = [];
            for (let i4 = 0; i4 < ${parametrs.switch_core}; i4++) {
                const newCore = {
                    coordX: randomCoordinate(10, 1230),
                    coordY: randomCoordinate(540, 670),
                    sizeX: 40,
                    sizeY: 40,
                    isDragging: false
                };
                objectCore.push(newCore);
            }


            function drawScheme(objectClient, objectAccess, objectDisribution, objectCore) {
                ctx.clearRect(0, 0, 1280, 720);

                for (let j1 = 0; j1 < objectClient.length; j1++) {
                    ctx.fillStyle = "indigo";
                    ctx.fillRect(objectClient[j1].coordX, objectClient[j1].coordY, objectClient[j1].sizeX, objectClient[j1].sizeY);
                }

                for (let j2 = 0; j2 < objectAccess.length; j2++) {
                    ctx.fillStyle = "red";
                    ctx.fillRect(objectAccess[j2].coordX, objectAccess[j2].coordY, objectAccess[j2].sizeX, objectAccess[j2].sizeY);
                }

                for (let j3 = 0; j3 < objectDisribution.length; j3++) {
                    ctx.fillStyle = "blue";
                    ctx.fillRect(objectDisribution[j3].coordX, objectDisribution[j3].coordY, objectDisribution[j3].sizeX, objectDisribution[j3].sizeY);
                }

                for (let j4 = 0; j4 < objectCore.length; j4++) {
                    ctx.fillStyle = "green";
                    ctx.fillRect(objectCore[j4].coordX, objectCore[j4].coordY, objectCore[j4].sizeX, objectCore[j4].sizeY);
                }

                <#--for (let x1 = 0; x1 < ${parametrs.switch_distribution}; x1++) {-->
                <#--    for (let x2 = 0; x2 < ${parametrs.switch_core}; x2++) {-->
                <#--        ctx.beginPath();-->
                <#--        ctx.moveTo(objectDisribution[x1].coordX + 15, objectDisribution[x1].coordY + 30);-->
                <#--        ctx.lineTo(objectCore[x2].coordX + 20, objectCore[x2].coordY);-->
                <#--        ctx.stroke();-->
                <#--    }-->
                <#--    for (let y = 0; y < ${parametrs.switch_access}; y++) {-->
                <#--        ctx.beginPath();-->
                <#--        ctx.moveTo(objectDisribution[x1].coordX + 15, objectDisribution[x1].coordY);-->
                <#--        ctx.lineTo(objectAccess[y].coordX + 10, objectAccess[y].coordY + 20);-->
                <#--        ctx.stroke();-->
                <#--    }-->
                <#--}-->
            }

            function getObjectUnderMouse(x, y) {
                for(let b1 = objectClient.length - 1; b1 >= 0; b1--) {
                    const object = objectClient[b1];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                for(let b2 = objectAccess.length - 1; b2 >= 0; b2--) {
                    const object = objectAccess[b2];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                for(let b3 = objectDisribution.length - 1; b3 >= 0; b3--) {
                    const object = objectDisribution[b3];
                    if(x >= object.coordX && x <= object.coordX + object.sizeX &&
                        y >= object.coordY && y <= object.coordY + object.sizeX) {
                        return object;
                    }
                }
                for(let b4 = objectCore.length - 1; b4 >= 0; b4--) {
                    const object = objectCore[b4];
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
                    drawScheme(objectClient, objectAccess, objectDisribution, objectCore);
                }

            });

            canvas.addEventListener('mouseup', function () {
                selectedObject.isDragging = false;
                selectedObject = null;
            });

            drawScheme(objectClient, objectAccess, objectDisribution, objectCore);
        }
    </script>
</body>
</html>