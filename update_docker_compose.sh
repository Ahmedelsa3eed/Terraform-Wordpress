# Variables
REPO_URL="https://github.com/Ahmedelsa3eed/wordpress-docker.git"
CLONE_DIR="/tmp/wordpress-docker"
DOCKER_COMPOSE_FILE="docker-compose.yaml"
BRANCH_NAME="update-db-host"

MYSQL_PRIVATE_IP=$(cat mysql_private_ip)

# Remove existing clone directory if it exists
if [ -d "$CLONE_DIR" ]; then
  rm -rf "$CLONE_DIR"
fi

# Clone the repository
git clone "$REPO_URL" "$CLONE_DIR"
cd "$CLONE_DIR" || exit

# Check if branch already exists on remote
if git ls-remote --heads "$REPO_URL" "$BRANCH_NAME" | grep -q "$BRANCH_NAME"; then
  # Branch exists, delete it
  git push --delete origin "$BRANCH_NAME"
fi

# Check out a new branch
git checkout -b "$BRANCH_NAME"

# Replace the placeholder with the actual MySQL IP in the Docker Compose template
sed -i "s/DP_HOST/$MYSQL_PRIVATE_IP/g" "$DOCKER_COMPOSE_FILE"

# Commit and push the changes
git add "$DOCKER_COMPOSE_FILE"
git commit -m "Update MySQL IP with $MYSQL_PRIVATE_IP"
git push origin "$BRANCH_NAME"

# Cleanup
cd /tmp || exit
rm -rf "$CLONE_DIR"