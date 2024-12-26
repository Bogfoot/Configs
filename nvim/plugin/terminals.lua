local float_state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local split_state = {
  split = {
    buf = -1,
    win = -1,
  },
}
-- Create a floating terminal in Neovim
function FloatingTerminal(options)
  options = options or {}
  local width = options.width or math.floor(vim.o.columns * 0.8) -- 80% of screen width
  local height = options.height or math.floor(vim.o.lines * 0.8) -- 80% of screen height

  local col = math.floor((vim.o.columns - width) / 2) -- Center horizontally
  local row = math.floor((vim.o.lines - height) / 2) -- Center vertically

  local buf
  if options.buf and vim.api.nvim_buf_is_valid(options.buf) then
    buf = options.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  end

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts) -- Open the floating window
  vim.cmd 'startinsert' -- Start in insert mode
  return { buf = buf, win = win }
end

-- Create a terminal in a split
function SplitTerminal(options)
  options = options or {}
  local height = options.height or 15 -- Default height for the split

  local buf
  if options.buf and vim.api.nvim_buf_is_valid(options.buf) then
    buf = options.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  end

  -- Open a horizontal split
  vim.cmd('botright ' .. height .. 'split')
  local win = vim.api.nvim_get_current_win()

  -- Set the buffer to the terminal
  vim.api.nvim_win_set_buf(win, buf)
  vim.cmd 'startinsert' -- Start in insert mode

  return { buf = buf, win = win }
end

-- Toggle the split terminal
local toggle_split_term = function()
  if not vim.api.nvim_win_is_valid(split_state.split.win) then
    split_state.split = SplitTerminal { buf = split_state.split.buf }
    if vim.fn.bufname(split_state.split.buf) == '' then
      vim.fn.termopen(vim.o.shell) -- Open the shell in the terminal buffer
    end
  else
    vim.api.nvim_win_close(split_state.split.win, true)
  end
end

-- Create a key mapping to toggle the split terminal
vim.keymap.set({ 'n', 't' }, '<leader>st', toggle_split_term)

local toggle_term = function()
  if not vim.api.nvim_win_is_valid(float_state.floating.win) then
    float_state.floating = FloatingTerminal { buf = float_state.floating.buf }
    if vim.bo[float_state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(float_state.floating.win)
  end
end

-- vim.api.nvim_create_user_command('FloatingTerminal', toggle_term, {})
vim.keymap.set({ 'n', 't' }, '<leader>tt', toggle_term)
