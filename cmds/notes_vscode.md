-   [How to make your own VS Code theme!](https://www.youtube.com/watch?v=pGzssFNtWXw)
-   ๐๐ฌ๐๐๐ฎ๐ฅ๐ฅ ๐บ๐๐๐๐๐๐:
    -   โง โฎ โ โ โฅ + โ + โคถ ๏ฃฟ โคถ โฌ โฉ๏ธ โฒ โต โซ โญฟ โฅ โ โ โก๏ธ โฌ๏ธ โฌ๏ธ โฌ๏ธ
    -   `^ + โ + Spaces` โ get Emoji from MacOS

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Notes Link</summary>

</details>

### TWEAK SETTINGS:

-   `โ + โง + P`
    -   ๐ฅsearch: `setting`; Select: `Open Workspace Setting (JSON)` โ to create local workspace Settings? - python.terminal.activateEnvironment": true
    -   search: `key mapping`; Select: `Inspect key mapping` โ to inspect key-mapping file.
    -   search: `keyboard shortcut`; Select: `Open Default keyboard shortcut (JSON)` โ to inspect shortcut file.
    -   search: `user snippet`; Select: `configure user snippet` โ to configure user snippets.
        -   Project wise user's snippet are saved in `.vscode` folder

### USEFULL PATH OF FILES AND FOLDERS on MACOS

-   ~/Library/Application\ Support/Code/User/settings.json
-   ~/Library/Application\ Support/Code/User/keybindings.json
-   ~/Library/Application\ Support/Code/User/snippets

<details>
<summary style="font-size:25px;color:Orange;text-align:left">USEFULL SHORTCUTS</summary>

#### How to find differences between two files?

#### Shortcuts

-   `โ + โง + k` โ Delete the line of code at the cursor.
-   `โ + x` โ Cut the line of code at the cursor to paste somewhere else.
-   `โ + k + 1]` โ Fold code at the base indentation lavel
-   `โฅ + โ + ]` โ Fold code in the editor
-   `โ + k + j]` โ Unold code.
-   `โ + โง + e` โ Toggle between file explorer and editor.
-   `โ + โ` โ Collapse/Expend the folder in the file explorer
-   `โ` โ Expend the folder in the file explorer
-   `โ` โ Collapse the folder in the file explorer
-   `^ + Enter` โ Open focused file from file explorer.
-   `fn + ^ + f5` โ Run script
-   `โ + ,` โ Setting
-   `โ + โง + P` โ Open command palette
-   `โ + โง + P <file util>` โ Open command palette
-   `โ + b` โ Toggle side bar
-   `โ + โง + e` โ Jump between Editor and Explorer
-   `โ + โง + x` โ Search for Extentions
-   `โ + ,` โ Open the default settings json-file for VSCode.
-   `โ + j` โ Togle between integrated terminal and Editor.
-   `โ + k + r` โ OPEN KEYBOARD SHORTCUTS Reference.
-   `โ + k + s` โ Open shortcuts-binding.
-   `โ + k + t` โ Toggle between themes.
-   `โ + k + m` โ Options to choose among various keymaps.
-   `โ + โง + O` โ Allow open various symbol
-   To get Emoji (๐?)

    -   `โ + โง + P` โ Search: 'insert unicode'; Select: Desired Emoji: Press `โฎ`
    -   `^ + โ + Spaces` โ Open Emoji

-   Open Default Keybinding (JSON) file:
    -   `โ + โง + P` -> type 'Default Keybinding' โฆ โฎ
-   Transform to lowercase, UPPERCASE and titlecase selected text.
    -   `โ + โง + P`; Select: 'transform to UPPERCASE/lowercase/titlecase' โฆ โฎ
-   Transform indentation to Spaces.
    -   `โ + โง + P` โฆ type 'ndentationToSpaces' โฆ โฎ
-   Transform indentation to Tab. - `โ+โง+P` type 'indentationToTabs' โฆ โฎ
</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Windows OS</summary>
    
- Keyboard Shortcut (`^ + k + s`):
    - Search: `View: Open Next/Previous Editor`; Set: `โ + โ + โก๏ธ` / `โ + โ + โฌ๏ธ`.
    - Search: `cursorTop/cursorBottom`; Set: `โ + โฌ๏ธ` / `โ + โฌ๏ธ`.
    - Search: `cursorTopSelect/cursorBottomSelect`; Set: `โ + โง + โฌ๏ธ` / `โ + โง + โฌ๏ธ`.
    - Search: `cursorHomeSelect/cursorEndSelect`; Set: `โ + โง + โฌ๏ธ` / `โ + โง + โก๏ธ`.
    - 
</details>

### MANAGE EXTENSIONS FROM COMMAND LINE

-   `$ code -help` โ Print usage.
-   `$ code --install-extension <extension-id[@version] | path-to-vsix>` โ Installs or updates an extension.
    -   The argument is either an extension id or a path to a VSIX.
    -   The identifier of an extension is '${publisher}.${name}'.
    -   Use '--force' argument to update to latest version. To install a specific version provide '@${version}'. For example: 'vscode.csharp@1.2.3'.
-   `$ code --list-extensions > list_vsc_extension.txt` โ List out all the vscode extensions in the file, list_vsc_extension
-   `$ code --uninstall-extension <extension-id>` โ Uninstalls an extension.
-   `$ code --disable-extensions` โ Disable all installed extensions.
-   `$ code --disable-extension <extension-id>` โ Disable an extension.
-   `$ code --extensions-dir <dir>` โ Set the root path for extensions.
