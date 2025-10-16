return {
    "nvim-indentnum",
    dir = vim.fn.stdpath "config" .. "/lua/plugins",
    config = function()
        local function do_indent(n, left)
            local op = left and "<<" or ">>"
            for _ = 1, n do
                vim.cmd("normal! " .. op)
            end
        end

        local function do_indent_visual(n, left)
            local op = left and "<" or ">"
            for _ = 1, n do
                vim.cmd("normal! " .. op .. "gv")
            end
        end

        local max = 9
        for i = 1, max do
            -- Normal mode
            vim.keymap.set(
                "n",
                "<Tab>" .. i,
                function() do_indent(i, false) end,
                { noremap = true, silent = true, desc = "Indent line by " .. i }
            )
            vim.keymap.set(
                "n",
                "<S-Tab>" .. i,
                function() do_indent(i, true) end,
                { noremap = true, silent = true, desc = "Unindent line by " .. i }
            )

            -- Visual mode
            vim.keymap.set(
                "v",
                "<Tab>" .. i,
                function() do_indent_visual(i, false) end,
                { noremap = true, silent = true, desc = "Indent block by " .. i }
            )
            vim.keymap.set(
                "v",
                "<S-Tab>" .. i,
                function() do_indent_visual(i, true) end,
                { noremap = true, silent = true, desc = "Unindent block by " .. i }
            )
        end
    end,
}
