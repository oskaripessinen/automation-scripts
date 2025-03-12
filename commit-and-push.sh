
if [ -z "$1" ]; then
  echo "Usage: ./commit-and-push.sh <repository>"
  exit 1
fi

repo=$1


cd "$repo" || { echo "Error: Repository '$repo' not found!"; exit 1; }


folder_name=$(basename "$PWD")


git add .


files_changed=$(git diff --cached --name-only | wc -l)


changed_dirs=$(git diff --cached --name-only | grep -o '^[^/]\+' | sort | uniq)


git commit -m "$folder_name commit - $files_changed files changed in $changed_dirs"


git push -u origin main


echo "Changed directories:"
echo "$changed_dirs"


cd - > /dev/null
