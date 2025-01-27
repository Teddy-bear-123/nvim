local fn = require("utils.fn")
local utils = require("utils")
local map = utils.keymap_factory("n")
local buffers = require("utils.buffers")

local is_default_buffer = function()
  return buffers.is_not_focused_buffer("NvimTree_1", "mind")
end

map("<c-1>", function()
  if is_default_buffer() then
    local menu = require("user.ollama")
    menu.toggle()
  end
end)
