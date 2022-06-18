IP=$(hostname -I) | awk '{ print $1 }'
sudo hugo server --bind=$IP -p 80 --liveReloadPort=80 --baseURL=http://$IP --appendPort=false