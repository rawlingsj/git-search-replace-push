function gclonecd(){
  # clone repo and cd to git repo but removing the '.git' from the directory name
  dirname=$(basename $1)
  len=${#dirname}-4
  git clone $1 && cd $(echo "${dirname:0:$len}")
}

gclonecd $GIT_REPOSITORY


find . -name $FILE_PATTERN -exec sed -i 's@'$FROM'@'$TO'@g' {} \;

git status

git config --global push.default simple
git config --global user.email $GIT_USER_EMAIL
git config --global user.name  $GIT_USER_NAME

cat > ~/.netrc <<EOF
machine github.com
       login $GIT_USER_NAME
       password $GIT_PASSWORD
EOF



git status
git commit -a -m "fabric8 CD version update from $FROM to $TO"


git push $GIT_REPOSITORY