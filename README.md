## Usage Instructions
https://roadmap.sh/projects/log-archive-tool

1. Save the script to a file, for example, `log_archive.sh`.

2. Make the script executable:

   ```bash
   chmod +x log_archive.sh
Move the script to a directory that is in your PATH so it can be run as log_archive:

bash
sudo mv log_archive.sh /usr/local/bin/log_archive
Run the script using the command:

bash
log_archive /var/log
Notes
Make sure to change the values for recipient@example.com, username, remote_host, and REMOTE_PATH to your own information.
Ensure that you have the necessary utilities installed, such as mailutils for sending emails, and that you have access to the remote server for using scp.
