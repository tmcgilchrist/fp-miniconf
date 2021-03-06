export GIT_INDEX_FILE=$PWD/.git/index-deploy
export GIT_WORK_TREE=$PWD/_site
REF=refs/heads/gh-pages
git read-tree "$REF"
git diff --quiet && exit
git add --all
TREE=$(git write-tree)
COMMIT=$(git commit-tree "$TREE" -p "$REF" -m "snapshot $(date '+%y-%m-%d %H:%M')")
git update-ref "$REF" "$COMMIT"
