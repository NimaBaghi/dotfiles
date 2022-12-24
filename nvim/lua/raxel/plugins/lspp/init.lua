local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("raxel.plugins.lspp.mason")
require("raxel.plugins.lspp.handlers").setup()
require("raxel.plugins.lspp.null-ls")
