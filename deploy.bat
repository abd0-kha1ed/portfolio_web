@echo off
echo 🔄 Switching to main branch...
git checkout main

echo 🧱 Building Flutter web...
flutter build web

echo 🌿 Switching to gh-pages branch...
git checkout gh-pages

echo 🧹 Cleaning old files...
git rm -rf .

echo 📥 Copying build/web files to root...
xcopy /E /H /Y build\web\* .\

echo 🛡️ Creating .nojekyll...
type nul > .nojekyll

echo 📝 Ensuring <base href="/portfolio_web/"> is set (you must do this manually if needed)

echo ✅ Adding and committing files...
git add .
git commit -m "Deploy update"

echo 🚀 Pushing to GitHub Pages...
git push origin gh-pages --force

echo 🎉 Deployment complete! Check your site at:
echo https://abd0-kha1ed.github.io/portfolio_web/

pause