# PowerShell-Skript zum Starten des Browsers und Navigieren zur Anmeldeseite der Zeiterfassung
$website = "https://www.zeitstempel.de/html"
$process = Start-Process "msedge.exe" -ArgumentList $website -PassThru

# Warte eine Weile, bis die Seite vollständig geladen ist
Start-Sleep -Seconds 10

# Füge den SendKeys-Mechanismus hinzu
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class SendKeysUnique {
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);

    public static void SendWait(string keys) {
        foreach (char c in keys) {
            byte key = (byte)c;
            keybd_event(key, 0, 0, UIntPtr.Zero);  // Use UIntPtr.Zero for dwExtraInfo
            System.Threading.Thread.Sleep(50);  // Add a slight delay to simulate typing
        }
    }
}
"@

# Wenn das Fenster im Hintergrund läuft, stelle sicher, dass es in den Vordergrund kommt
if (-not [System.Management.Automation.PSTypeName]'WindowFocusUnique') {
    Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class WindowFocusUnique {
    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    public static void FocusWindow(IntPtr hWnd) {
        SetForegroundWindow(hWnd);
    }
}
"@
}

# Fokussiere das Microsoft Edge-Fenster (wichtig, damit SendKeys funktioniert)
$edgeWindow = Get-Process msedge | Where-Object { $_.MainWindowHandle -ne 0 }

if ($edgeWindow) {
    # Access the first valid MainWindowHandle (if multiple)
    $hwnd = $edgeWindow[0].MainWindowHandle
    
    if ($hwnd) {
        # Pass the single IntPtr value to FocusWindow
        [WindowFocusUnique]::FocusWindow([IntPtr]$hwnd)
    } else {
        Write-Host "Kein Hauptfenster gefunden."
    }
} else {
    Write-Host "Microsoft Edge läuft nicht oder kein Fenster gefunden."
}

# Stelle sicher, dass der Wert als IntPtr übergeben wird
[WindowFocusUnique]::FocusWindow([IntPtr]$hwnd)

# Definiere den Text, den du eingeben möchtest
$username = "******"
$password = "******"

# Sende den Text in das aktive Edge-Fenster
[SendKeysUnique]::SendWait($username)
Start-Sleep -Seconds 5

# Springe zum nächsten Eingabefeld
[SendKeysUnique]::SendWait("{TAB}")
Start-Sleep -Seconds 5

# Schreibe das Passwort ins zweite Textfeld
[SendKeysUnique]::SendWait($password)
Start-Sleep -Seconds 5

# Bestätige mit der Eingabetaste
[SendKeysUnique]::SendWait("{ENTER}")
Start-Sleep -Seconds 5

# Beende das Skript
exit
