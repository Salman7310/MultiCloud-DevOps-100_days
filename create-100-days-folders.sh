#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Salman7310/MultiCloud-DevOps-100_days.git"
LOCAL_DIR="MultiCloud-DevOps-100_days"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Already inside a git repo — using current folder."
elif [ -d "$LOCAL_DIR/.git" ]; then
  echo "Repo already cloned locally — entering it..."
  cd "$LOCAL_DIR"
else
  echo "Cloning repo..."
  git clone "$REPO_URL" "$LOCAL_DIR"
  cd "$LOCAL_DIR"
fi

echo "Creating Day-001 .. Day-100 folders..."
for i in $(seq -w 1 100); do
  day_folder="Day-${i}"
  mkdir -p "$day_folder"
  if [ ! -f "$day_folder/README.md" ]; then
    cat > "$day_folder/README.md" <<EOF
# Day ${i} - DevOps Learning Log

## Topics Covered
- 

## Key Takeaways
- 

## Resources
- 
EOF
  fi
done

git add .
git commit -m "Create Day-001 to Day-100 folder structure for 100 Days of DevOps challenge"
git push

echo ""
echo "Done! All 100 day folders are created and pushed to GitHub."#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Salman7310/MultiCloud-DevOps-100_days.git"
LOCAL_DIR="MultiCloud-DevOps-100_days"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Already inside a git repo — using current folder."
elif [ -d "$LOCAL_DIR/.git" ]; then
  echo "Repo already cloned locally — entering it..."
  cd "$LOCAL_DIR"
else
  echo "Cloning repo..."
  git clone "$REPO_URL" "$LOCAL_DIR"
  cd "$LOCAL_DIR"
fi

echo "Creating Day-001 .. Day-100 folders..."
for i in $(seq -w 1 100); do
  day_folder="Day-${i}"
  mkdir -p "$day_folder"
  if [ ! -f "$day_folder/README.md" ]; then
    cat > "$day_folder/README.md" <<EOF
# Day ${i} - DevOps Learning Log

## Topics Covered
- 

## Key Takeaways
- 

## Resources
- 
EOF
  fi
done

git add .
git commit -m "Create Day-001 to Day-100 folder structure for 100 Days of DevOps challenge"
git push

echo ""
echo "Done! All 100 day folders are created and pushed to GitHub."
