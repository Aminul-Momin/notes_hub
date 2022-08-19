-   [How to make your own VS Code theme!](https://www.youtube.com/watch?v=pGzssFNtWXw)

-   𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔
    ⮐ ⎇ ⬆︎ ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ ## &

### USEFULL PATH OF FILES AND FOLDERS

-   ~/Library/Application\ Support/Code/User/settings.json
-   ~/Library/Application\ Support/Code/User/keybindings.json
-   ~/Library/Application\ Support/Code/User/snippets

### SETTINGS

-   `⌘+⇧+P`
    -   type `setting`, select `open workspace setting`
    -   python.terminal.activateEnvironment": true

### Notes:

-   🔥 How to get usr Snippet?
    -   Setting $→$ User Snippet

🔥 Project wise user's snippet are saved in .vscode folder

## USEFULL SHORTCUTS

-   `⌘ + ⇧ + k`

    -   Delete the line of code at the cursor.

-   `⌘ + x`

    -   Cut the line of code at the cursor to paste somewhere else.

-   `⌘ + k + 1]`

    -   Fold code at the base indentation lavel

-   `⌥ + ⌘ + ]`

    -   Fold code in the editor

-   `⌘ + k + j]`

    -   Unold code.

-   `⌘ + ⇧ + e`

    -   Toggle between file explorer and editor.

-   `⌘ + ↓`

    -   Collapse/Expend the folder in the file explorer

-   `→`

    -   Expend the folder in the file explorer

-   `←`

    -   Collapse the folder in the file explorer

-   `^ + Enter`

    -   Open focused file from file explorer.

-   `fn + ^ + f5`

    -   Run script

-   `⌘+,`

    -   Setting

-   `⌘+⇧+P`

    -   Open command palette

-   `⌘+⇧+P <file util>`

    -   Open command palette

-   `⌘+b`

    -   Toggle side bar

-   `⌘+⇧+e`

    -   Jump between Editor and Explorer

-   `⌘+⇧+x`

    -   Search for Extentions

-   `⌘+,`

    -   Open the default settings json-file for VSCode.

-   `⌘+j`

    -   Togle between integrated terminal and Editor.

-   `$ ⌘+k+r`

    -   OPEN KEYBOARD SHORTCUTS Reference.

-   `$ ⌘+k+s`

    -   Open shortcuts-binding.

-   `$ ⌘+k+t`

    -   Toggle between themes.

-   `$ ⌘+k+m`

    -   Options to choose among various keymaps.

-   `⌘ + ⇧ + O`

    -   Allow open various symbol

-   To get Emoji (🏠)

    -   `⌘ + ⇧ + P`
        -   type 'insert unicode' ↦ ⮐
    -   `^ + ⌘ + Spaces`
        -   Open Emoji

-   Open Default Keybinding (JSON) file:

    -   `⌘+⇧+P` -> type 'Default Keybinding' ↦ ⮐

-   Transform to lowercase, UPPERCASE and titlecase selected text.

    -   `⌘+⇧+P` type 'transform to uppencase' ↦ ⮐

-   Transform indentation to Spaces.

    -   `⌘+⇧+P` ↦ type 'ndentationToSpaces' ↦ ⮐

-   Transform indentation to Tab.
    -   `⌘+⇧+P` type 'indentationToTabs' ↦ ⮐

### MANAGE EXTENSIONS FROM COMMAND LINE

-   `$ code -help`

    -   Print usage.

-   `$ code --list-extensions > list_vsc_extension.txt`

    -   List out all the vscode extensions in the file, list_vsc_extension

-   `$ code --install-extension <extension-id[@version] | path-to-vsix>`

    -   Installs or updates the extension. The identifier of an extension is always `${publisher}.${name}`. Use `--force` argument to update to latest version. To install a specific version provide `@${version}`. For example: 'vscode.csharp@1.2.3'.

-   `$ code --uninstall-extension <extension-id>`

    -   Uninstalls an extension.

-   `$ code --disable-extensions`

    -   Disable all installed extensions.

-   `$ code --disable-extension <extension-id>`

    -   Disable an extension.

-   `$ code --extensions-dir <dir>`
    -   Set the root path for extensions.
