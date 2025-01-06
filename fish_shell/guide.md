# A Comprehensive Guide to Fish Shell

## Table of Contents

- [Introduction](#introduction)
- [Why Fish Shell?](#why-fish-shell)
  - [1. User-Friendly Features](#1-user-friendly-features)
  - [2. Simplified Syntax](#2-simplified-syntax)
    - [Variable Assignment](#variable-assignment)
    - [Conditional Statements](#conditional-statements)
    - [Function Definitions](#function-definitions)
  - [3. No Configuration Required](#3-no-configuration-required)
  - [4. Web-Based Configuration](#4-web-based-configuration)
    - [Using `fish_config`](#using-fish_config)
  - [5. Universal Variables](#5-universal-variables)
- [Fish vs. Bash vs. Zsh](#fish-vs-bash-vs-zsh)
- [Getting Started with Fish](#getting-started-with-fish)
  - [Basic Commands](#basic-commands)
    - [Setting Variables](#setting-variables)
    - [Exporting Variables](#exporting-variables)
  - [Configuration](#configuration)
    - [Using `fish_config` for Configuration](#using-fish_config-for-configuration)
  - [Functions](#functions)
  - [Aliases and Abbreviations](#aliases-and-abbreviations)
    - [Aliases (Using Functions in Fish)](#aliases-using-functions-in-fish)
    - [Abbreviations](#abbreviations)
  - [Command Substitutions](#command-substitutions)
  - [Loops and Conditionals](#loops-and-conditionals)
    - [For Loop](#for-loop)
    - [While Loop](#while-loop)
    - [If Statement](#if-statement)
  - [Interactive Features](#interactive-features)
    - [Autosuggestions](#autosuggestions)
    - [History Search](#history-search)
  - [Prompt Customization](#prompt-customization)
    - [Using Built-in Themes](#using-built-in-themes)
    - [Manual Customization (Optional)](#manual-customization-optional)
  - [Plugin Management](#plugin-management)
    - [Using Fisher](#using-fisher)
    - [Using Oh My Fish (OMF)](#using-oh-my-fish-omf)
- [Common Key Bindings in Fish Shell](#common-key-bindings-in-fish-shell)
  - [Navigation and Editing](#navigation-and-editing)
  - [Command History and Search](#command-history-and-search)
  - [Autosuggestions and Completions](#autosuggestions-and-completions)
  - [Clipboard Operations](#clipboard-operations)
  - [Miscellaneous](#miscellaneous)
  - [Fish-Specific Bindings](#fish-specific-bindings)
  - [Key Bindings Graphic (Quick Reference)](#key-bindings-graphic-quick-reference)
- [Tips on Using Key Bindings](#tips-on-using-key-bindings)
- [Advanced Features](#advanced-features)
  - [Custom Key Bindings](#custom-key-bindings)
    - [Example: Binding `Ctrl+Space` to Accept Autosuggestion](#example-binding-ctrlspace-to-accept-autosuggestion)
    - [Steps to Add Custom Key Bindings](#steps-to-add-custom-key-bindings)
- [Resources for Further Learning](#resources-for-further-learning)
- [Conclusion](#conclusion)
- [Installing Fish Shell on macOS](#installing-fish-shell-on-macos)
- [Installing Fish Shell on Windows](#installing-fish-shell-on-windows)
  - [Using Windows Subsystem for Linux (WSL)](#using-windows-subsystem-for-linux-wsl)
    - [Steps](#steps)
    - [Troubleshooting](#troubleshooting)
  - [Using Cygwin on Windows (Alternative Method)](#using-cygwin-on-windows-alternative-method)
- [Additional Tips for Both Platforms](#additional-tips-for-both-platforms)

---

## Introduction

Fish (Friendly Interactive SHell) is a modern command-line shell focused on user-friendliness and interactive use. It offers powerful features out of the box without the need for extensive configuration, making it an excellent choice for both beginners and experienced users.

---

## Why Fish Shell?

### 1. User-Friendly Features

- **Autosuggestions**: Fish suggests commands as you type based on your history and available commands, similar to how search engines autocomplete queries.

- **Syntax Highlighting**: Valid commands are highlighted in one color, while invalid ones are highlighted in another, helping you catch errors before execution.

- **Tab Completion**: Intelligent and context-aware tab completions for commands, options, and file paths without additional setup.

### 2. Simplified Syntax

Fish shell simplifies the syntax for scripting and interactive use, making it more readable and easier to write.

#### Variable Assignment

In **Bash**, variable assignment uses the `=` operator without spaces, and variables are accessed with a `$` prefix.

```bash
# Bash
variable="value"
echo $variable  # Output: value
```

In **Fish**, you use the `set` command for variable assignment, and you still use `$` to access variable values.

```fish
# Fish
set variable value
echo $variable  # Output: value
```

**Key Differences:**

- **Assignment Syntax**:

  - **Bash**: `variable="value"` (no spaces around `=`)
  - **Fish**: `set variable value` (spaces are acceptable)

- **Accessing Variables**:
  - **Both**: Use `$variable` to access the value

#### Conditional Statements

**Bash** uses `[ ]` or `[[ ]]` for conditionals, requires `then`, and ends with `fi`.

```bash
# Bash
if [ "$variable" -eq 5 ]; then
    echo "Variable is 5"
else
    echo "Variable is not 5"
fi
```

**Fish** uses the `test` command directly, does not require `then`, and uses `end` to close the block.

```fish
# Fish
if test $variable -eq 5
    echo "Variable is 5"
else
    echo "Variable is not 5"
end
```

**Key Differences:**

- **Syntax Simplicity**:
  - **Bash**: Uses `then` and `fi`, and conditionals are enclosed in `[ ]`.
  - **Fish**: Directly uses `test`, no `then`, and closes with `end`.

#### Function Definitions

In **Bash**, functions are defined with `function_name()` and enclosed in `{ }`.

```bash
# Bash
function greet() {
    echo "Hello, $1!"
}
greet "Alice"  # Output: Hello, Alice!
```

In **Fish**, functions are defined using the `function` keyword and closed with `end`.

```fish
# Fish
function greet
    echo "Hello, $argv[1]!"
end
greet "Alice"  # Output: Hello, Alice!
```

**Key Differences:**

- **Definition Keywords**:

  - **Bash**: Uses `function_name()` and `{ }`.
  - **Fish**: Uses `function` and `end`.

- **Argument Access**:
  - **Bash**: `$1`, `$2`, etc.
  - **Fish**: `$argv[1]`, `$argv[2]`, etc.

### 3. No Configuration Required

- **Works Out of the Box**: Fish provides a rich feature set without needing to install plugins or extensively modify configuration files.

### 4. Web-Based Configuration

Fish offers a web-based configuration interface for easy customization.

#### Using `fish_config`

1. **Launch the Configuration Interface**:

   ```fish
   fish_config
   ```

   - Opens a web server on `http://localhost:8000` and launches your default web browser.

2. **Customize Your Shell**:

   - **Prompts**: Choose and preview different prompt themes.
   - **Functions**: View and edit shell functions.
   - **Variables**: Manage environment and universal variables.
   - **History**: Browse and search your command history.
   - **Color**: Customize syntax highlighting colors.
   - **Abbreviations**: Create and manage command abbreviations.

3. **Apply Changes**:

   - Changes are applied immediately and saved in your Fish configuration files.

### 5. Universal Variables

- **Shared Across Sessions**: Set universal variables that persist across all Fish sessions, simplifying environment management.

---

## Fish vs. Bash vs. Zsh

| Feature             | Fish                                        | Bash                  | Zsh                            |
| ------------------- | ------------------------------------------- | --------------------- | ------------------------------ |
| Autosuggestions     | Built-in                                    | Requires plugins      | Requires plugins               |
| Syntax Highlighting | Built-in                                    | Limited (with tweaks) | Requires plugins               |
| Tab Completion      | Advanced, context-aware                     | Basic                 | Advanced with plugins          |
| Configuration       | Minimal, user-friendly                      | Extensive             | Extensive                      |
| Scripting Syntax    | Different from POSIX shell (non-compatible) | POSIX-compliant       | POSIX-compliant                |
| Plugin Ecosystem    | Growing (Fisher, Oh My Fish)                | Extensive (bash-it)   | Extensive (Oh My Zsh, Antigen) |

---

## Getting Started with Fish

### Basic Commands

#### Setting Variables

- **Local Variable**:

  ```fish
  set variable_name value
  ```

- **Global Variable**:

  ```fish
  set -g variable_name value
  ```

- **Universal Variable**:

  ```fish
  set -U variable_name value
  ```

#### Exporting Variables

- **To Environment**:

  ```fish
  set -x variable_name value
  ```

- **Global Export**:

  ```fish
  set -gx variable_name value
  ```

### Configuration

While Fish works well out of the box, you can customize it to suit your preferences.

#### Using `fish_config` for Configuration

Instead of manually editing configuration files, you can use `fish_config` for an interactive, web-based configuration experience.

1. **Launch `fish_config`**:

   ```fish
   fish_config
   ```

2. **Customize Settings**:

   - **Prompts**: Choose from various prompt themes or create your own.
   - **Functions**: Add or edit shell functions.
   - **Variables**: Manage environment and universal variables.
   - **Abbreviations**: Create shortcuts for longer commands.
   - **Colors and Fonts**: Adjust syntax highlighting and terminal appearance.

3. **Save Changes**:

   - All changes are saved automatically in your Fish configuration directory (`~/.config/fish/`).

### Functions

- **Defining a Function**:

  ```fish
  function greet
      echo "Hello, $argv[1]!"
  end
  ```

- **Calling the Function**:

  ```fish
  greet World  # Output: Hello, World!
  ```

- **Function with Arguments**:

  ```fish
  function sum
      math $argv[1] + $argv[2]
  end

  sum 5 10  # Output: 15
  ```

### Aliases and Abbreviations

#### Aliases (Using Functions in Fish)

In Fish, it's recommended to use functions for aliases, especially for more complex commands.

- **Creating an Alias**:

  ```fish
  function ll
      ls -lah $argv
  end
  ```

#### Abbreviations

- **Creating an Abbreviation**:

  ```fish
  abbr -a gc 'git commit'
  ```

- **Using Abbreviations**:

  - Type `gc`, and it auto-expands to `git commit` when you press space or enter.

### Command Substitutions

- **Using Parentheses**:

  ```fish
  echo (date)
  ```

- **Capturing Command Output**:

  ```fish
  set current_date (date)
  ```

### Loops and Conditionals

#### For Loop

```fish
for file in *.txt
    echo $file
end
```

#### While Loop

```fish
set count 1
while test $count -le 5
    echo $count
    set count (math $count + 1)
end
```

#### If Statement

```fish
if test -e "myfile.txt"
    echo "File exists"
else
    echo "File does not exist"
end
```

### Interactive Features

#### Autosuggestions

- **Accept Suggestion**: Press the **Right Arrow** key to accept the autosuggestion.

#### History Search

- **Search Backward**: Press `Ctrl + R` and start typing to search your command history.

### Prompt Customization

#### Using Built-in Themes

```fish
fish_config prompt
```

- Opens a web browser where you can select and customize prompts.

#### Manual Customization (Optional)

If you prefer manual control, you can edit the prompt function directly.

- **Edit the Prompt Function**:

  ```fish
  functions fish_prompt
  ```

- **Modify and Save**:

  ```fish
  funced fish_prompt
  # Make your changes
  funcsave fish_prompt
  ```

### Plugin Management

#### Using Fisher

Fish has a plugin manager called Fisher that allows you to easily install and manage plugins.

- **Install Fisher**:

  ```fish
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
  ```

- **Install Plugins**:

  ```fish
  fisher install ilancosman/tide  # Interactive prompt theme
  fisher install jethrokuan/z     # Directory jumping
  fisher install jethrokuan/fzf   # Fuzzy finder integration
  ```

- **List Installed Plugins**:

  ```fish
  fisher list
  ```

#### Using Oh My Fish (OMF)

- **Install OMF**:

  ```fish
  curl -L https://get.oh-my.fish | fish
  ```

- **Install Themes and Plugins**:

  ```fish
  omf install bobthefish  # Theme
  omf install pj          # Plugin
  ```

---

## Common Key Bindings in Fish Shell

Understanding and utilizing key bindings can greatly enhance your efficiency in the Fish shell. Below is a quick reference to the most commonly used key bindings, along with their use cases.

### Navigation and Editing

| Action                                 | Key Binding               | Description                                                  |
| -------------------------------------- | ------------------------- | ------------------------------------------------------------ |
| **Move cursor forward one character**  | `Right Arrow` or `Ctrl+f` | Moves the cursor to the right.                               |
| **Move cursor backward one character** | `Left Arrow` or `Ctrl+b`  | Moves the cursor to the left.                                |
| **Move forward one word**              | `Alt+f`                   | Moves the cursor forward by one word.                        |
| **Move backward one word**             | `Alt+b`                   | Moves the cursor backward by one word.                       |
| **Go to beginning of line**            | `Ctrl+a` or `Home`        | Moves the cursor to the start of the line.                   |
| **Go to end of line**                  | `Ctrl+e` or `End`         | Moves the cursor to the end of the line.                     |
| **Clear the screen**                   | `Ctrl+l`                  | Clears the terminal display.                                 |
| **Delete character before cursor**     | `Backspace` or `Ctrl+h`   | Deletes the character to the left of the cursor.             |
| **Delete character under cursor**      | `Delete` or `Ctrl+d`      | Deletes the character under the cursor.                      |
| **Delete to beginning of line**        | `Ctrl+u`                  | Deletes from the cursor to the start of the line.            |
| **Delete to end of line**              | `Ctrl+k`                  | Deletes from the cursor to the end of the line.              |
| **Transpose characters**               | `Ctrl+t`                  | Swaps the character before the cursor with the one under it. |
| **Undo last edit**                     | `Ctrl+z`                  | Undoes the last text modification.                           |

### Command History and Search

| Action                              | Key Binding              | Description                                   |
| ----------------------------------- | ------------------------ | --------------------------------------------- |
| **Previous command**                | `Up Arrow` or `Ctrl+p`   | Navigates to the previous command in history. |
| **Next command**                    | `Down Arrow` or `Ctrl+n` | Navigates to the next command in history.     |
| **Search command history backward** | `Ctrl+r`                 | Incremental search backward through history.  |
| **Search command history forward**  | `Ctrl+s`                 | Incremental search forward through history.   |

### Autosuggestions and Completions

| Action                                  | Key Binding       | Description                                   |
| --------------------------------------- | ----------------- | --------------------------------------------- |
| **Accept autosuggestion**               | `Right Arrow`     | Accepts the autosuggested text.               |
| **Trigger completion**                  | `Tab`             | Triggers completion suggestions.              |
| **Cycle through completions**           | `Tab` repeatedly  | Cycles through the list of completions.       |
| **Cancel completion or autosuggestion** | `Ctrl+c` or `Esc` | Cancels the current completion or suggestion. |

### Clipboard Operations

| Action                            | Key Binding | Description                                         |
| --------------------------------- | ----------- | --------------------------------------------------- |
| **Cut text to end of line**       | `Ctrl+k`    | Cuts text from the cursor to the end of the line.   |
| **Cut text to beginning of line** | `Ctrl+u`    | Cuts text from the cursor to the start of the line. |
| **Paste text from clipboard**     | `Ctrl+y`    | Pastes the last cut text at the cursor position.    |
| **Swap last two words**           | `Alt+t`     | Transposes the two words before the cursor.         |

### Miscellaneous

| Action                           | Key Binding         | Description                              |
| -------------------------------- | ------------------- | ---------------------------------------- |
| **Cancel current command/input** | `Ctrl+c`            | Aborts the current command line input.   |
| **Execute command**              | `Enter` or `Return` | Executes the entered command.            |
| **Suspend current process**      | `Ctrl+z`            | Suspends the current foreground process. |
| **Re-execute last command**      | `!!` + `Enter`      | Runs the last executed command again.    |

### Fish-Specific Bindings

| Action                           | Key Binding           | Description                                          |
| -------------------------------- | --------------------- | ---------------------------------------------------- |
| **Open web-based configuration** | `fish_config` command | Opens Fish's web-based configuration in a browser.   |
| **Insert a token from history**  | `Alt+.`               | Inserts the last argument from the previous command. |
| **Expand abbreviations**         | `Alt+Enter`           | Expands any abbreviations at the cursor position.    |

### Key Bindings Graphic (Quick Reference)

Below is a visual quick reference of the most commonly used key bindings in Fish Shell:

```
+------------------------+-------------------------+-----------------------------------+
|       Navigation       |       Key Binding       |            Description            |
+------------------------+-------------------------+-----------------------------------+
| Move cursor right      | Right Arrow or Ctrl+f   | Move cursor forward one character |
| Move cursor left       | Left Arrow or Ctrl+b    | Move cursor backward one character|
| Move forward one word  | Alt+f                   | Move cursor forward one word      |
| Move backward one word | Alt+b                   | Move cursor backward one word     |
| Beginning of line      | Ctrl+a or Home          | Move to start of the line         |
| End of line            | Ctrl+e or End           | Move to end of the line           |
+------------------------+-------------------------+-----------------------------------+

+--------------------------+-------------------------+------------------------------------+
|         Editing          |       Key Binding       |             Description            |
+--------------------------+-------------------------+------------------------------------+
| Delete previous char     | Backspace or Ctrl+h     | Delete character before cursor     |
| Delete next char         | Delete or Ctrl+d        | Delete character under cursor      |
| Cut to end of line       | Ctrl+k                  | Cut text to end of line            |
| Cut to start of line     | Ctrl+u                  | Cut text to beginning of line      |
| Undo last edit           | Ctrl+z                  | Undo the last text modification    |
+--------------------------+-------------------------+------------------------------------+

+------------------------+-------------------------+-----------------------------------+
|        History         |       Key Binding       |            Description            |
+------------------------+-------------------------+-----------------------------------+
| Previous command       | Up Arrow or Ctrl+p      | Navigate to previous command      |
| Next command           | Down Arrow or Ctrl+n    | Navigate to next command          |
| Search history backward| Ctrl+r                  | Search backward through history   |
| Search history forward | Ctrl+s                  | Search forward through history    |
+------------------------+-------------------------+-----------------------------------+

+-------------------------+------------------------+------------------------------------+
|      Autosuggestions    |      Key Binding       |            Description             |
+-------------------------+------------------------+------------------------------------+
| Accept autosuggestion   | Right Arrow            | Accept the suggested text          |
| Trigger completions     | Tab                    | Show completion suggestions        |
+-------------------------+------------------------+------------------------------------+

+-----------------------+----------------------+------------------------------------+
|     Miscellaneous     |     Key Binding      |            Description             |
+-----------------------+----------------------+------------------------------------+
| Clear the screen      | Ctrl+l               | Clear the terminal display         |
| Cancel command/input  | Ctrl+c               | Abort the current command line     |
| Execute command       | Enter or Return      | Execute the typed command          |
| Open config in browser| fish_config          | Launch web-based configuration     |
+-----------------------+----------------------+------------------------------------+
```

---

## Tips on Using Key Bindings

- **Practice Makes Perfect**: Regularly use these key bindings to become more efficient in the shell.
- **Customize Bindings**: You can customize key bindings by defining them in your configuration.
- **Explore More Bindings**: Use `fish_key_reader` to discover what keys correspond to which bindings.

---

## Advanced Features

### Custom Key Bindings

Fish allows you to customize or create new key bindings to suit your workflow.

#### Example: Binding `Ctrl+Space` to Accept Autosuggestion

```fish
function fish_user_key_bindings
    bind \c@ 'commandline -f accept-autosuggestion'
end
```

- **Explanation**: `\c@` represents `Ctrl+Space`. This binding will accept the current autosuggestion when you press `Ctrl+Space`.

#### Steps to Add Custom Key Bindings

1. **Launch `fish_config`**:

   ```fish
   fish_config
   ```

2. **Navigate to the Functions Tab**:

   - Find or create the `fish_user_key_bindings` function.

3. **Add Your Custom Bindings**:

   - Insert the `bind` command with your desired key sequence and command.

4. **Apply Changes**:

   - The changes take effect immediately.

---

## Resources for Further Learning

- **Official Documentation**: [Fish Shell Documentation](https://fishshell.com/docs/current/)
- **Key Bindings Reference**: [Fish Bindings](https://fishshell.com/docs/current/index.html#bind)
- **Community Forums**:

  - [Fish Shell Reddit](https://www.reddit.com/r/fishshell/)
  - [Fish Shell Gitter](https://gitter.im/fish-shell/fish-shell)

- **Tutorials**:

  - [Awesome Fish (awsm.fish)](https://github.com/jorgebucaran/awsm.fish)

---

## Conclusion

Fish shell offers a modern, user-friendly command-line experience that enhances productivity and makes the terminal more approachable. Its intelligent features, intuitive syntax, and powerful customization options set it apart from traditional shells like Bash and Zsh.

By adopting Fish, you'll benefit from:

- **Enhanced Autocompletion**: Saves time and reduces errors.
- **Readable Syntax**: Easier to write and maintain scripts.
- **Out-of-the-Box Features**: Minimal setup required to get started.

---

## Installing Fish Shell on macOS

1. **Install Homebrew (if not installed)**:

   Homebrew is a package manager for macOS that simplifies software installation.

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Fish using Homebrew**:

   ```bash
   brew install fish
   ```

3. **Set Fish as Your Default Shell**:

   - **Find the Fish Installation Path**:

     ```bash
     which fish
     ```

     - Commonly returns `/opt/homebrew/bin/fish` on Apple Silicon Macs or `/usr/local/bin/fish` on Intel Macs.

   - **Add Fish to the List of Shells**:

     ```bash
     echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
     ```

     - Replace `/opt/homebrew/bin/fish` with the path from `which fish`.

   - **Change the Default Shell**:

     ```bash
     chsh -s /opt/homebrew/bin/fish
     ```

4. **Restart Terminal**:

   - Close and reopen your terminal to start using Fish.

---

## Installing Fish Shell on Windows

### Using Windows Subsystem for Linux (WSL)

#### Steps

1. **Enable WSL**:

   Open **PowerShell** as Administrator and run:

   ```powershell
   wsl --install
   ```

   - Installs WSL and the default Linux distribution (usually Ubuntu).

2. **Install a Linux Distribution**:

   - If not automatically installed, get one from the Microsoft Store (e.g., Ubuntu).

3. **Update Your Linux Distribution**:

   ```bash
   sudo apt update
   ```

4. **Install Fish in the WSL Environment**:

   ```bash
   sudo apt install fish
   ```

5. **Set Fish as Your Default Shell in WSL**:

   - **Method 1: Update WSL Configuration**:

     - **Create or Edit `/etc/wsl.conf`**:

       ```bash
       sudo nano /etc/wsl.conf
       ```

       - Add:

         ```
         [user]
         default=your_username

         [boot]
         command=/usr/bin/fish
         ```

       - Replace `your_username` with the output of `whoami`.

     - **Save and Exit**:

       - Press `CTRL + O`, then `Enter` to save.
       - Press `CTRL + X` to exit.

   - **Method 2: Modify `.bashrc`**:

     ```bash
     echo "exec fish" >> ~/.bashrc
     ```

     - Fish will start whenever you launch Bash.

6. **Restart WSL**:

   - Close and reopen your WSL terminal.

7. **Verify Fish is Running**:

   ```fish
   echo $SHELL  # Should output /usr/bin/fish
   ```

#### Troubleshooting

- **`chsh` Command Issues**:

  - `chsh` may not work in WSL due to PAM limitations.
  - Use the methods above to set Fish as the default shell.

### Using Cygwin on Windows (Alternative Method)

1. **Download and Install Cygwin**:

   - Get the installer from [Cygwin’s website](https://www.cygwin.com/).
   - During setup, select the `fish` package.

2. **Launch Fish**:

   ```bash
   fish
   ```

---

## Additional Tips for Both Platforms

- **Customizing Fish**:

  - Use `fish_config` for a web-based configuration interface to customize your shell.
  - You can add aliases, change the prompt, and more.

- **Fish Plugins**:

  - Use Fisher or Oh My Fish to manage plugins and themes.
  - **Installing Fisher**:

    ```fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    ```

  - **Using Fisher to Install Plugins**:

    ```fish
    fisher install <plugin_name>
    ```

    - Replace `<plugin_name>` with the name of the plugin you wish to install.

---

By integrating Fish shell into your workflow, you'll unlock a more efficient and enjoyable command-line experience. Whether you're on macOS or Windows, getting started with Fish is straightforward, and the community support is excellent.

If you have any questions or need further assistance, feel free to explore the resources provided or reach out to the Fish shell community.

**Happy Fishing!**

---
