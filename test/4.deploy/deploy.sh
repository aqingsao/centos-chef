if [ -d "ilegong-web" ]; then
  rm -rf ilegong-web
fi
unzip ilegong-web.zip
cp config/app/Config/database.php ilegong-web/app/Config/
cp config/manage/Config/database.php ilegong-web/manage/Config/
mkdir ilegong-web/data/cache
mkdir ilegong-web/data/cache/models
mkdir ilegong-web/data/cache/views
mkdir ilegong-web/data/cache/persistent
chmod -R 777 ilegong-web

if [ -d "3-bak" ]; then
  rm -rf 3-bak
fi
rm -r 3-bak
mv 3 3-bak
mv ilegong-web 3