# Neovim Keymap Cheatsheet

Leader key: `<space>` (Space). Leader is shown below as `< Leader >`.

## General / Navigation
| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | n | Telescope: find files |
| `<Leader>f` | n | Telescope: find files |
| `<F4>` | n | Close current buffer (`:bd`) |
| `<F5>` | n | Toggle Neo-tree file explorer |
| `<F6>` | n | Vertical split + open terminal (right half) |
| `<F12>` | n | Show treesitter captures under cursor |
| `<Tab>` | n | Next tab (`gt`) |
| `<S-Tab>` | n | Previous tab (`gT`) |
| `<C-q>` | n | Force quit (`:q!`) |

## LSP
| Key | Mode | Action |
|-----|------|--------|
| `K` | n | Hover documentation |
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Go to references |
| `<Leader>D` | n | Type definition |
| `<Leader>ca` | n | Code action |
| `<Leader>rn` | n | Rename symbol |
| `<C-k>` | n | Signature help |
| `<C-space>` (Rust) | n | Rust hover actions |
| `<Leader>a` (Rust) | n | Rust code action group |

## Diagnostics
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>e` | n | Open diagnostic float |
| `<Leader>q` | n | Send diagnostics to loclist |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |
| `<Leader>f` | n | LSP format current buffer (per-client) |

## Completion (nvim-cmp)
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | i | Trigger completion |
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |
| `<C-e>` | i | Abort completion |
| `<CR>` | i | Confirm selection |

## Treesitter Playground (in playground buffer)
| Key | Action |
|-----|--------|q
| `f` | Focus language |
| `F` | Unfocus language |
| `<CR>` | Goto node |
| `?` | Show help |
| `a` | Toggle anonymous nodes |
| `i` | Toggle highlight groups |
| `t` | Toggle injected languages |
| `I` | Toggle language display |
| `o` | Toggle query editor |
| `R` | Update |

## Auto Commands (automatic)
- `BufWritePre` — format buffer on save (`vim.lsp.buf.formatting_sync`)
- `CursorHold` / `CursorHoldI` — auto-open diagnostic float on hold
- `FileType php` — set 120-col textwidth, 4-space indentation, colorcolumn, softtabstop
