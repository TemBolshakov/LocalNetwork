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
            let test1 = 1280 / (${parametrs.number} + 1);
            let coordStartClient = test1;
            for(let i1 = 0; i1 < ${parametrs.number}; i1++) {
                const newClient = {
                    coordX: coordStartClient,
                    coordY: randomCoordinate(100, 150),
                    sizeX: 10,
                    sizeY: 10,
                    isDragging: false
                };
                objectClient.push(newClient);
                coordStartClient = coordStartClient + test1;
            }

            const objectAccess = [];

            let test2 = 1280 / (${parametrs.switch_access} + 1);
            let coordStartAccess = test2;
            for (let i2 = 0; i2 < ${parametrs.switch_access}; i2++) {
                const newAccess = {
                    coordX: coordStartAccess,
                    coordY: randomCoordinate(180, 300),
                    sizeX: 20,
                    sizeY: 20,
                    isDragging: false
                };
                objectAccess.push(newAccess);
                coordStartAccess = coordStartAccess + test2;
            }

            const objectDisribution = [];

            for (let i3 = 0; i3 < ${parametrs.switch_distribution}; i3++) {
                const newDistibution = {
                    coordX: randomCoordinate(30, 1250),
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
                    coordX: randomCoordinate(40, 1240),
                    coordY: randomCoordinate(540, 700),
                    sizeX: 40,
                    sizeY: 40,
                    isDragging: false
                };
                objectCore.push(newCore);
            }



            function drawScheme(objectClient, objectAccess, objectDisribution) {

                ctx.clearRect(0, 0, 1280, 720);

                objectClient.forEach((object) => {
                    ctx.fillStyle = "indigo";
                    ctx.fillRect(object.coordX, object.coordY, object.sizeX, object.sizeY);
                });

                objectAccess.forEach((object) => {
                    ctx.fillStyle = "red";
                    ctx.fillRect(object.coordX, object.coordY, object.sizeX, object.sizeY);
                });

                objectDisribution.forEach((object) => {
                    ctx.fillStyle = "blue";
                    ctx.fillRect(object.coordX, object.coordY, object.sizeX, object.sizeY);
                });

                objectCore.forEach((object) => {
                    ctx.fillStyle = "green";
                    ctx.fillRect(object.coordX, object.coordY, object.sizeX, object.sizeY);
                });


                <#--let count_clients = 24;-->

                <#--for(let g1 = 0; g1 < ${parametrs.switch_access}; g1++){-->
                <#--    const count_access_ports = ${parametrs.switch_access_ports};-->
                <#--    for(let q1 = 0; q1 < count_access_ports; q1++) {-->
                <#--        ctx.beginPath();-->
                <#--        ctx.moveTo(objectAccess[g1].coordX, objectAccess[g1].coordY);-->
                <#--        ctx.lineTo(objectClient[count_clients-1].coordX, objectAccess[count_clients-1].coordY);-->
                <#--        ctx.stroke();-->
                <#--        count_clients = count_clients - 1;-->
                <#--    }-->
                <#--}-->
                let count1 = 0;
                let tmp1 = ${parametrs.number};
                for(let n1 = 0; n1 < ${parametrs.switch_access}; n1++) {
                    if(tmp1 > ${parametrs.switch_access_ports}) {
                        for(let n2 = 0; n2 < ${parametrs.switch_access_ports}; n2++) {
                            ctx.beginPath();
                            ctx.moveTo(objectAccess[n1].coordX + 10, objectAccess[n1].coordY);
                            ctx.lineTo(objectClient[count1].coordX + 5, objectClient[count1].coordY + 10);
                            ctx.stroke();
                            count1++;
                            tmp1--;
                        }
                    }
                    else {
                        for(let n2 = 0; n2 < tmp1; n2++) {
                            ctx.beginPath();
                            ctx.moveTo(objectAccess[n1].coordX + 10, objectAccess[n1].coordY);
                            ctx.lineTo(objectClient[count1].coordX + 5, objectClient[count1].coordY + 10);
                            ctx.stroke();
                            count1++;
                        }
                    }
                }

                let count2 = 0;
                let tmp2 = ${parametrs.switch_access};
                for(let n3 = 0; n3 < ${parametrs.switch_distribution}; n3++) {
                    if(tmp2 > ${parametrs.switch_distribution_ports}) {
                        for(let n4 = 0; n4 < ${parametrs.switch_distribution_ports}; n4++) {
                            ctx.beginPath();
                            ctx.moveTo(objectDisribution[n3].coordX+15, objectDisribution[n3].coordY);
                            ctx.lineTo(objectAccess[count2].coordX+10, objectAccess[count2].coordY+20);
                            ctx.stroke();
                            count2++;
                            tmp2--;
                        }
                    }
                    else {
                        for(let n4 = 0; n4 < tmp2; n4++) {
                            ctx.beginPath();
                            ctx.moveTo(objectDisribution[n3].coordX+15, objectDisribution[n3].coordY);
                            ctx.lineTo(objectAccess[count2].coordX+10, objectAccess[count2].coordY+20);
                            ctx.stroke();
                            count2++;
                        }
                    }
                }

                let count3 = 0;
                for(let n5 = 0; n5 < ${parametrs.switch_core}; n5++) {
                    for(let n6 = 0; n6 < ${parametrs.switch_core_ports}; n6++) {
                        ctx.beginPath();
                        ctx.moveTo(objectCore[n5].coordX+20, objectCore[n5].coordY);
                        ctx.lineTo(objectDisribution[count3].coordX+15, objectDisribution[count3].coordY+30);
                        ctx.stroke();
                        count3++;
                    }
                }
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
                    drawScheme(objectClient, objectAccess, objectDisribution);
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