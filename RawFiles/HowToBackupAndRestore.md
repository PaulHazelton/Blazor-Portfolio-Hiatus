# How to Backup and Restore Databases with pgAdmin

*Notes were created with version 9.4*

> [!warning] Warning
> Check if both databases have the same migrations first!

## Create a Backup

For the following steps, leave all options as default unless otherwise specified.

1. **Right click** on the **database** you want to backup, click "**Backup...**"
2. **General** Tab
    - Filename: Choose a folder and file name, ending with ".sql"
    - Format: Plain
3. **Data Options** Tab
    - Blobs: Off
    - Only Data: On
4. **Query Options** Tab
    - Use INSERT Commands: On
    - On Conflict Do Nothing To INSERT command: On
5. **Table Options** Tab
    - Use Column INSERTS: On
6. **Options** Tab
    - Disable Triggers: On
7. **Objects** Tab
    - Check all tables
    - Uncheck these 4 tables usually at the bottom:
        1. __EFMigrationsHistory
        2. application_log
        3. error_log
        4. trace_log
8. Click **Backup**

**Note:** When backing up from Dev, you may have to open the file and comment out the line about transaction_timeout.

> *"One hangup for this more recent version when we're backing up from dev, I think it's transaction_timeout. I just commented it out last time"* - Jonathan

## Restore Database

1. **Left click** on the **database** you want to restore
2. Click **Query Tool**
3. Drag and drop the backup file into the query editor
   - You may have to comment out "transaction_timeout", see above.
4. Click **Execute Script**