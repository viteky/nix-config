{lib, ...}: {
  vim.ui = {
    breadcrumbs.enable = true;
    colorizer.enable = true;
    borders.enable = false;
    fastaction.enable = true;
    smartcolumn.enable = true;
    noice.enable = true;
    nvim-ufo = {
      enable = true;
      setupOpts = {
        provider_selector =
          lib.generators.mkLuaInline
          #lua
          ''
            function()
              return { 'treesitter', 'indent' }
            end
          '';
        fold_virt_text_handler =
          lib.generators.mkLuaInline
          #lua
          ''
            function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, {suffix, 'MoreMsg'})
                return newVirtText
            end
          '';
      };
    };
  };
}
