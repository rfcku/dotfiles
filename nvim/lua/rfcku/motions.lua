-- Define a Lua function to handle the conditional jump logic.
local function w_conditional_jump()
	-- Get the current cursor position (row and column).
	-- Neovim's API uses 0-indexed columns, Lua strings are 1-indexed.
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line_content = vim.api.nvim_get_current_line()

	-- Get the character under the cursor.
	-- Adjusting col by +1 for Lua's 1-indexed string indexing.
	local char_under_cursor = line_content:sub(col + 1, col + 1)

	local target_char = nil -- This will store the closing character to search for

	-- Determine the target closing character based on the character under the cursor.
	if char_under_cursor == '"' then
		target_char = '"'
	elseif char_under_cursor == "{" then
		target_char = "}"
	elseif char_under_cursor == "(" then
		target_char = ")"
	end

	-- If a special character was found under the cursor:
	if target_char then
		-- Start searching for the target character from the position *after* the current character.
		-- We add 2 to 'col' because 'col' is 0-indexed, and we want to search from the char
		-- *after* the current char, so 'col + 1' is the current char (1-indexed),
		-- and 'col + 2' is the character after it (1-indexed start for substring).
		local search_start_col_lua_idx = col + 2
		local remaining_line = line_content:sub(search_start_col_lua_idx)

		-- Search for the target character in the rest of the line.
		-- The 'true' argument makes it a plain string search, not a pattern.
		local next_char_pos_relative = remaining_line:find(target_char, 1, true)

		-- If the target character was found on the current line:
		if next_char_pos_relative then
			-- Calculate the new 0-indexed column for the cursor.
			-- search_start_col_lua_idx is the 1-indexed start of `remaining_line`.
			-- next_char_pos_relative is the 1-indexed position *within* `remaining_line`.
			-- We subtract 1 twice to convert back to 0-indexed column.
			local new_col_0_indexed = search_start_col_lua_idx - 1 + next_char_pos_relative - 1
			vim.api.nvim_win_set_cursor(0, { row, new_col_0_indexed })
		else
			-- If not found, fall back to the default 'w' motion.
			vim.cmd("normal! w")
		end
	else
		-- If the character under the cursor is not one of the special ones,
		-- simply perform the default 'w' motion.
		vim.cmd("normal! w")
	end
end

-- Set the keymap:
-- 'n': Applies this remapping to Normal mode.
-- 'w': The key being remapped.
-- w_conditional_jump: The Lua function to execute.
-- { noremap = true, silent = true, desc = 'Conditional word/bracket jump' }:
--   - noremap = true: Prevents recursive remapping (important!).
--   - silent = true: Prevents the command from being echoed on the command line.
--   - desc: A description for this keymap, visible in `:h mapleader` or `:h map`.
-- vim.keymap.set("n", "w", w_conditional_jump, { noremap = true, silent = true, desc = "Conditional word/bracket jump" })
