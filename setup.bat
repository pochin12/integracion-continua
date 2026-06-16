@echo off
echo ============================================
echo   Configurando entorno de desarrollo IC
echo ============================================

echo.
echo [1/3] Verificando Python...
python --version
if %errorlevel% neq 0 (
    echo ERROR: Python no esta instalado.
    echo Descargar desde https://www.python.org
    pause
    exit /b 1
)

echo.
echo [2/3] Instalando dependencias...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron instalar las dependencias.
    pause
    exit /b 1
)

echo.
echo [3/3] Ejecutando pruebas locales (build local)...
pytest tests/ -v
if %errorlevel% neq 0 (
    echo.
    echo ATENCION: Algunas pruebas fallaron.
    echo Revisar el codigo antes de hacer push.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   Entorno listo. Todos los tests pasaron.
echo   Ya podés comenzar a trabajar.
echo ============================================
pause