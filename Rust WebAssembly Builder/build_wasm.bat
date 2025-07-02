@echo off
setlocal enabledelayedexpansion

REM ===========================================
REM Dockerイメージ名
set IMAGE_NAME=rust-wasm-pack

REM コンテナ名
set CONTAINER_NAME=wasm_out

echo.
echo ===========================================
echo [1/4] Dockerイメージをビルド中...
echo ===========================================
docker build -t %IMAGE_NAME% .

if errorlevel 1 (
    echo ビルドに失敗しました。
    exit /b 1
)

echo.
echo ===========================================
echo [2/4] 一時コンテナを作成中...
echo ===========================================
docker create --name %CONTAINER_NAME% %IMAGE_NAME%

if errorlevel 1 (
    echo コンテナの作成に失敗しました。
    exit /b 1
)

echo.
echo ===========================================
echo [3/4] pkgフォルダを取得中...
echo ===========================================
if exist pkg (
    echo 既存のpkgフォルダを削除します。
    rmdir /s /q pkg
)
docker cp %CONTAINER_NAME%:/app/pkg ./pkg

if errorlevel 1 (
    echo ファイルコピーに失敗しました。
    exit /b 1
)

echo.
echo ===========================================
echo [4/4] 一時コンテナを削除中...
echo ===========================================
docker rm %CONTAINER_NAME%

echo.
echo ***********************************
echo ビルドとファイルコピーが完了しました。
echo ./pkg フォルダに成果物があります。
echo ***********************************

endlocal
pause
