# Watch all elm files in root dir;
# if any of them change rebuild main.js from the Main.elm file

echo "Watching your Elm files..."

fswatch **/*.elm | xargs -n1 -I{} elm-make  --output main.js src/App.elm
