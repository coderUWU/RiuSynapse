-- Lua API for SynapseZ
local api = {}

-- HTTP Functions
function api.request(options)
    return syn.request(options)
end

-- Filesystem
function api.writefile(name, content)
    return writefile(name, content)
end

function api.readfile(name)
    return readfile(name)
end

-- Drawing
function api.Drawing.new(type)
    return Drawing.new(type)
end

-- Metatable hooks
function api.hookmetamethod(object, method, newfunction)
    return hookmetamethod(object, method, newfunction)
end

-- Get/Set
function api.getsenv(script)
    return getsenv(script)
end

function api.getgenv()
    return getgenv()
end

return api