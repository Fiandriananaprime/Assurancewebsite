@echo off
REM Assurance MAMA Backend Setup Script for Windows
echo.
echo ========================================
echo   Assurance MAMA Backend Setup
echo ========================================
echo.

REM Check if .env exists
if not exist .env (
    echo Creating .env file from .env.example...
    copy .env.example .env
    echo .env file created. Please update the database credentials in .env file.
    echo.
) else (
    echo .env file already exists.
    echo.
)

REM Create necessary directories
echo Creating directories...
if not exist uploads mkdir uploads
if not exist logs mkdir logs
echo Directories created.
echo.

REM Install dependencies
echo Installing dependencies...
call npm install
echo Dependencies installed.
echo.

echo ========================================
echo   Database Setup Instructions
echo ========================================
echo.
echo 1. Create PostgreSQL database:
echo    createdb assurance_mama
echo.
echo 2. Run the database initialization script:
echo    psql -U postgres -d assurance_mama -f database\init.sql
echo.
echo    Or manually run the SQL commands in database\init.sql
echo.

set /p DB_READY="Have you set up the database? (y/n): "
if /i "%DB_READY%"=="y" (
    echo.
    echo ========================================
    echo   Setup Complete!
    echo ========================================
    echo.
    echo To start the server:
    echo   npm run dev    ^(development mode^)
    echo   npm start      ^(production mode^)
    echo.
    echo Default admin credentials:
    echo   Email: admin@assurance-mama.com
    echo   Password: password123
    echo.
    echo WARNING: Please change the admin password after first login!
    echo.
) else (
    echo Please set up the database first before starting the server.
    pause
    exit /b 1
)

pause