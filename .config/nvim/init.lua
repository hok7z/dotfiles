local core = {
    "options",
    "mappings",
    "plugins"
}

for _,source in ipairs(core) do
    local status_ok,fault = pcall(require,'core.' .. source)
    if not status_ok then
        vim.notify("Failed to load " .. source .."\n\n" .. fault )
    end
end
