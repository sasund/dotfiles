# Keymap Reference for Neovim / LazyVim

## Navigation

- `h` - Move left
- `j` - Move down
- `k` - Move up
- `l` - Move right
- `w` - Move to next word
- `b` - Move to previous word
- `e` - Move to end of word
- `0` - Move to beginning of line
- `$` - Move to end of line
- `gg` - Go to first line
- `G` - Go to last line
- `Ctrl+f` - Page down
- `Ctrl+b` - Page up

### Window / Tabs

- `ctrl+h` - Move window left
- `ctrl+j` - Move window down
- `ctrl+k` - Move window up
- `ctrl+l` - Move window right

- `n <shift-h> <shift-l>` - shift buffers (tabs left/right)
- `n  space + bd` - Close buffer

## Editing Mode

- `i` - Press "i" to enter insert mode before the cursor.
- `I` - Press "I" to enter insert mode at the beginning of the current line.
- `a` - Press "a" to enter insert mode after the cursor.
- `A` - Press "A" to enter insert mode at the end of the current line.
- `o` - Press "o" to open a new line below the current line and enter insert mode.
- `O` - Press "O" to open a new line above the current line and enter insert mode.

### Editing

- `x`- Delete character under cursor
- `dd` - Delete entire line
- `dw` - Delete word
- `d$` - Delete to end of line
- `yy` - Copy (yank) entire line
- `yw` - Copy word
- `p` - Paste after cursor
- `P` - Paste before cursor
- `u` - Undo
- `Ctrl+r` - Redo
- `r` - Replace single character
- `cc` - Change entire line
- `cw` - Change word

### Search and Replace

- `/pattern` - Search forward for pattern
- `?pattern` - Search backward for pattern
- `n` - Next search result
- `N` - Previous search result
- `:%s/old/new/g` - Replace all occurrences
- `:%s/old/new/gc` - Replace all occurrences with confirmation (y|n|a|q)

## Expolorer

- `space + e` - Open Explorer
- `a` - Add file
- `d` - Delete file
- `r` - Rename file
- `H` - Toggle hidden files

## Codeing

- `n  gcc` - Comment out/inn line
- Formatting:
  - `n  space + cf` - Format
  - `n  space + cF` - Format Injected Language

### Copilot

- `space + aa` - Toggle Copilot character
- `space + ap` - Prompt Action
- `space + aq` - Quick Copilot chat
- `space + ax` - Clear chat

**`Copilot Commands`**

- `:CopilotChat <input>?` - Open chat with optional input
- `:CopilotChatOpen` - Open chat window
- `:CopilotChatClose` - Close chat window
- `:CopilotChatToggle` - Toggle chat window
- `:CopilotChatStop` - Stop current output
- `:CopilotChatReset` - Reset chat window
- `:CopilotChatSave <name>?` - Save chat history
- `:CopilotChatLoad <name>?` - Load chat history
- `:CopilotChatPrompts` - View/select prompt templates
- `:CopilotChatModels` - View/select available models
- `:CopilotChatAgents` - View/select available agents
- `:CopilotChat<PromptName>` - Use specific prompt template

**`Copilot Chat`**

- `@<agent>` to select an agent
- `#<context>` to select a context
- `#<context>:<input>` to select input for context
- `/<prompt>` to select a prompt
- `$<model>` to select a model
- `> <text>` to make a sticky prompt (copied to next prompt)

**`Mappings`**

- `<C-l>` to reset
- `<C-y>` to accept diff
- `<CR>` or `<C-s>` in insert mode to submit prompt
- `<Tab>` in insert mode to complete
- `gc` to show context
- `gd` to show diff
- `gh` to show help
- `gi` to show info
- `gj` to jump to diff
- `gqa` to quickfix answers
- `gqd` to quickfix diffs
- `grr` to toggle sticky
- `grx` to clear stickies
- `gy` to yank diff
- `q` or `<C-c>` in insert mode to close

## Preview

`n space + cp` - Markdown a preview window

## Help

`space + sk` - Show Keymaps
