local core_modules = {
    "options",
    "mappings",
    "autocmds",
    "plugins"
}

for _,source in ipairs(core_modules) do
    local status_ok,fault = pcall(require,'core.' .. source)
    if not status_ok then
        error("Failed to load " .. source .."\n\n" .. fault )
    end
end
