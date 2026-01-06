@echo off
setlocal enabledelayedexpansion

echo Buscando imagenes de 2048x2048 para reducir al 50%%...
echo.

:: Busqueda recursiva
for /f "tokens=*" %%i in ('dir /s /b *.png *.jpg *.jpeg') do (
    
    :: Obtenemos dimension
    set "dim="
    for /f "tokens=*" %%a in ('magick identify -format "%%wx%%h" "%%i"') do set "dim=%%a"
    
    :: Solo procesa si la dimension es la correcta
    if "!dim!"=="2048x2048" (
        echo [REDUCIENDO] "%%~nxi"
        magick "%%i" -resize 50%% "%%i"
    )
)

echo.
echo Proceso finalizado con exito.
pause