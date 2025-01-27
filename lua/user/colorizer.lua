local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
    print("coloorizer not ok")
	return
end

-- Alwyas update the color values in cmp_docs even if it not focused
require 'colorizer'.setup {
    default_options = {
        css_fn = true;
    };
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    '!tex',
    cmp_docs = {always_update = true};

  },
}

-- require("colorizer").attach_to_buffer(0, { mode = "background", css = true})


