# git search replace push

This Dockerfile builds an image that will clone a git repo, search and replace string values provided via environment variables for specific file patterns, commit and push back the changes.

# Usage

```
docker run -ti -e GIT_REPOSITORY=https://github.com/rawlingsj/quickstarts.git -e FROM="<myversion>1.0.0</myversion>" -e TO="<myversion>2.0.0</myversion>" -e GIT_USER_NAME=joe -e GIT_USER_EMAIL=a@b.com -e GIT_PASSWORD=myp4ssword! -e FILE_PATTERN=pom.xml rawlingsj/git-search-replace-push
```

# Configuration Variables

- `FILE_PATTERN` - file pattern used to apply the search on
- `FROM` - search text
- `TO` - replace text
- `GIT_REPOSITORY_URL` - repository to clone and commit back to
- `GIT_USER_NAME` - git username
- `GIT_USER_EMAIL` - git email address
- `GIT_PASSWORD` - git password _note: password is stored as clear text inside the docker image_
- `BUILD_NUMBER` - a unique number that will be appended to the branch name that will be pushed
# Example:

```
export $FILE_PATTERN=pom.xml
export $FROM="<myversion>1.0.0</myversion>"
export $TO="<myversion>2.0.0</myversion>"

export $GIT_REPOSITORY_URL=https://github.com/rawlingsj/quickstarts.git
export $GIT_USER_NAME=joe
export $GIT_USER_EMAIL=joe.blogs@somewhere.com
export $GIT_PASSWORD=myp4ssword!
```
