# Neovim Config (Kickstart-based, VSCode-friendly)

## Overview
This is a modular, easy-to-read Neovim configuration inspired by Kickstart.nvim, but split into logical files for maintainability. It is tailored for users coming from VSCode, with familiar keybinds, modern code completion, LSP, formatting, and AI code suggestions.

### About Kickstart.nvim (The Foundation)
This configuration was originally based on `kickstart.nvim`. The key principles from its introductory guide are:

*   **Purpose of Kickstart.nvim**: It's a starting point, not a full distribution, designed for users to understand and customize their Neovim setup.
*   **Learning Lua**: It's recommended to get familiar with Lua. A quick guide can be found at `https://learnxinyminutes.com/docs/lua/`. For Neovim's specific Lua integration, refer to `:help lua-guide`.
*   **Essential First Steps for New Neovim Users**:
    *   Run the command `:Tutor` in Neovim to learn the basics.
    *   Read the output of `:help` to understand how to navigate and use Neovim's extensive built-in documentation.
    *   A helpful keymap `<space>sh` is often provided to search the help documentation.
*   **Guidance within the Configuration**: The original `kickstart.nvim` `init.lua` (and this adapted version) contains comments like `:help X` which point to documentation for specific settings or plugins, as well as general explanatory notes.
*   **Troubleshooting**: If you encounter issues, especially during initial setup, running `:checkhealth` in Neovim can provide useful diagnostic information.

## Quick Start

### Requirements (keep from Kickstart)
- Neovim (latest stable or nightly recommended)
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)
- Language-specific tools (e.g., `npm` for TypeScript, `go` for Golang, etc.)

> See [Install Recipes](#Install-Recipes) for platform-specific notes and quick install snippets.

### Where to Put This Config
| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

---

## Major Plugins & Features
- **LSP**: Full support for C++, Rust, Python, Lua (via `nvim-lspconfig`, `mason.nvim`)
- **Autoformatting**: Python (`black`, `isort`), Rust (`rustfmt`), Lua (`stylua`)
- **Treesitter**: Modern syntax highlighting and code navigation
- **Fuzzy Finder**: Telescope
- **AI Completion**: Codeium (accept with `<C-g>`)
- **Autocompletion**: nvim-cmp
- **Git Integration**: gitsigns
- **File Explorer**: neo-tree

---

## Keybinds (VSCode User Friendly)

| Action                          | Keybinding             | Plugin/Feature        |
|----------------------------------|------------------------|-----------------------|
| Accept Codeium Suggestion        | `<C-g>` (in insert)    | Codeium               |
| Completion Menu (LSP/cmp)        | `<Tab>`, `<S-Tab>`     | nvim-cmp/LSP/snippet  |
| Next/Prev Completion             | `<Tab>`, `<S-Tab>`     | nvim-cmp              |
| Confirm Completion               | `<CR>`                 | nvim-cmp              |
| Format Buffer                    | `<leader>f`            | conform.nvim          |
| Go to Definition                 | `gd`                   | LSP/Telescope         |
| Find References                  | `gr`                   | LSP/Telescope         |
| Go to Implementation             | `gI`                   | LSP/Telescope         |
| Go to Type Definition            | `<leader>D`            | LSP/Telescope         |
| Document Symbols                 | `<leader>ds`           | LSP/Telescope         |
| Workspace Symbols                | `<leader>ws`           | LSP/Telescope         |
| Rename Symbol                    | `<leader>rn`           | LSP                   |
| Code Action                      | `<leader>ca`           | LSP                   |
| Toggle Inlay Hints               | `<leader>th`           | LSP                   |
| File Explorer                    | `<leader>e`            | neo-tree              |
| Fuzzy Find Files                 | `<leader><space>`      | Telescope             |
| Fuzzy Find in Files (grep)       | `<leader>/`            | Telescope             |
| Git Status/Signs                 | (see gitsigns docs)    | gitsigns              |
| **CMake: Generate (configure)**  | `<leader>cg`           | cmake-tools.nvim      |
| **CMake: Build**                 | `<leader>cb`           | cmake-tools.nvim      |
| **CMake: Clean**                 | `<leader>cc`           | cmake-tools.nvim      |
| **CMake: Test**                  | `<leader>ct`           | cmake-tools.nvim      |
| **CMake: Run target**            | `<leader>cx`           | cmake-tools.nvim      |
| **CMake: Select Build Type**     | `<leader>cs`           | cmake-tools.nvim      |
| **Harpoon: Add current file**  | `<leader>a`            | Harpoon               |
| **Harpoon: Toggle quick menu** | `<leader>hm`           | Harpoon               |
| **Harpoon: Go to file 1**      | `<leader>h1`           | Harpoon               |
| **Harpoon: Go to file 2**      | `<leader>h2`           | Harpoon               |
| **Harpoon: Go to file 3**      | `<leader>h3`           | Harpoon               |
| **Harpoon: Go to file 4**      | `<leader>h4`           | Harpoon               |
| **Neogit: Open Git Status**    | `<leader>gs`           | Neogit                |

- `<leader>` is usually mapped to `\` or `,` (see your `init.lua` if unsure)
- Most LSP/Telescope bindings work in normal mode
- Codeium accept is only in insert mode

---

## CMake Integration (VSCode-like)

- **CMake syntax highlighting**: Provided by Treesitter (`cmake` parser enabled)
- **CMake workflow**: Powered by [Civitasv/cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim)
- **Key features:**
  - Run CMake configure/generate (`<leader>cg`)
  - Build your project (`<leader>cb`)
  - Clean build files (`<leader>cc`)
  - Run tests (`<leader>ct`)
  - Run selected target (`<leader>cx`)
  - Select build type (`<leader>cs`)
- **Build directory**: Defaults to `build` inside your project (like VSCode CMake Tools)
- **Status bar**: (Optional) See plugin docs for statusline integration
- **Debugging**: Integrates with `nvim-dap` (optional, see plugin docs)

This setup gives you a VSCode-like CMake experience inside Neovim, with all major actions available via easy keybinds.

---

## How to Install Language Servers & Formatters
- Open Neovim and run `:Mason` to install/update LSPs and formatters.
- LSPs auto-install for C++, Rust, Python, Lua.
- Formatters auto-install for Python, Rust, Lua.

---

## Migrating from VSCode
- Use the keybinds above for familiar navigation and code actions.
- Fuzzy finder and file explorer behave similarly to VSCode’s Quick Open and Explorer.
- LSP and formatting are automatic for supported languages.
- AI code suggestions (Codeium) are available—accept with `<C-g>`.

---

## Extending & Customizing
- Plugins are modular: see `lua/custom/plugins/` for LSP, formatting, Codeium, etc.
- Add new plugins by creating a new `.lua` file in `lua/custom/plugins/`.
- Keymaps can be customized in your plugin files or `init.lua`.

---

## Credits & License
- Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Modularized and extended for C++, Rust, Python, and AI support

---

Happy hacking!

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> **NOTE**
> Your fork's url will be something like this:
> `https://github.com/<your_github_username>/kickstart.nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommmended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone kickstart.nvim
> **NOTE**
> If following the recommended step above (i.e., forking the repo), replace
> `nvim-lua` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.


### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the 
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>
