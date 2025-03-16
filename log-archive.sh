#!/bin/bash

# Make sure the script is run from the correct directory.
# To run it as a command log_archive, move it to a directory that is in the PATH.

# Check for the presence of an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: log_archive <log-directory>"
    exit 1
fi

LOG_DIRECTORY=$1
ARCHIVE_DIRECTORY="$LOG_DIRECTORY/archive"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

# Check if the log directory exists
if [ ! -d "$LOG_DIRECTORY" ]; then
    echo "Error: The directory '$LOG_DIRECTORY' does not exist."
    exit 1
fi

# Create a new directory for the archive
mkdir -p "$ARCHIVE_DIRECTORY"

# Compress logs into a tar.gz file
tar -czf "$ARCHIVE_DIRECTORY/$ARCHIVE_FILE" -C "$LOG_DIRECTORY" .

echo "Archive created: $ARCHIVE_DIRECTORY/$ARCHIVE_FILE"

# Log the date and time of the archive creation in a file
echo "$ARCHIVE_FILE - $(date)" >> "$ARCHIVE_DIRECTORY/archive_log.txt"

# Sending a notification via email (if mailutils is installed)
if command -v mail &> /dev/null; then
    echo "Archive created: $ARCHIVE_FILE" | mail -s "Logs Archive" recipient@example.com
else
    echo "mailutils is not installed. Email notification cannot be sent."
fi

# Optionally: sending to a remote server (e.g., using scp)
REMOTE_USER="username"
REMOTE_HOST="remote_host"
REMOTE_PATH="/path/to/remote/directory"

scp "$ARCHIVE_DIRECTORY/$ARCHIVE_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

echo "Archive sent to remote server: $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"
