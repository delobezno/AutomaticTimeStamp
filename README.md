# 🕒 Automatic TimeStamp (PowerShell)
A precision-focused PowerShell utility designed to automatically rename or tag files with standardized timestamps. This tool eliminates manual naming errors and ensures that project versions and logs are organized chronologically.

🌟 Features
Native & Lightweight: Runs as a pure PowerShell script, utilizing built-in Windows functionality—no installation required.

Format Consistency: Enforces a standard naming convention (e.g., YYYY-MM-DD_HH-MM), making files easily searchable and sortable.

Hands-Off Operation: Can be integrated into scheduled tasks or folder watchers to handle file tagging silently in the background.

Audit-Ready: Perfect for log files, report exports, or any scenario where knowing "exactly when" a file was generated is critical.

🛠️ How it Works
The script targets a specific directory or file type and applies a naming transformation:

Identification: Scans for new or existing files based on defined extensions.

Metadata Retrieval: Extracts the creation or last-modified date from the file system.

Renaming: Appends the timestamp to the filename while preserving the original extension.

💡 Why This Project?
Efficiency often comes from the things we don't have to think about. I built this to remove the friction of manual bookkeeping. By automating the "boring" task of timestamping, I ensure that my colleagues and I always have an accurate, chronological record of our work without ever having to discuss naming conventions.

🤝 Collaborative Growth (The "API" Approach)
While I enjoy working independently on technical logic, I design my tools to be robust interfaces for the whole team. I am actively practicing tact and diplomacy by:

Providing Clarity: Writing clean, self-documenting code that others can trust.

Listening to Needs: If a different timestamp format or a specific filtering logic would help your workflow, I am open to collaborating and adjusting the script.

Valuing Feedback: I believe that even the best "lone" developer grows faster through peer review. Please share your thoughts!

🚀 Usage
Open the script and set your $targetFolder path.

Run the script via PowerShell: .\AutomaticTimeStamp.ps1.

Watch your files align into a perfect, organized timeline.
