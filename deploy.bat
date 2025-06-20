@echo off
echo 🔄 Switching to gh-pages branch...
git checkout --orphan gh-pages

echo 🧹 Cleaning files...
git rm -rf . >nul 2>&1

echo 📋 Copying build\web to root...
xcopy /E /H /Y build\web\* .\

echo 📄 Creating .nojekyll file...
type nul > .nojekyll

echo ✅ Committing changes...
git add .
git commit -m "🚀 Final deployment"

echo 🚀 Pushing to GitHub Pages...
git push origin gh-pages --force

echo 🎉 Deployment completed! Visit: https://abd0-kha1ed.github.io/portfolio_web/
pause
