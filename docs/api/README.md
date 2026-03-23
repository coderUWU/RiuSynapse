# RiuSynapse API Documentation

## Core Functions

### Execution
- `loadstring(code)` - Execute Lua code
- `syn.run_secure(code)` - Run with Level 8 context
- `syn.execute(code)` - Alternative execution method

### Filesystem
- `readfile(path)` - Read file contents
- `writefile(path, content)` - Write to file
- `appendfile(path, content)` - Append to file
- `isfile(path)` - Check if file exists
- `isfolder(path)` - Check if folder exists
- `makefolder(path)` - Create folder
- `delfolder(path)` - Delete folder

### HTTP
- `syn.request(options)` - HTTP request
- `game:HttpGet(url)` - GET request
- `game:HttpPost(url, data)` - POST request

### Clipboard
- `setclipboard(text)` - Set clipboard
- `getclipboard()` - Get clipboard content

### Crypto
- `syn.crypt.encrypt(data, key)` - Encrypt data
- `syn.crypt.decrypt(data, key)` - Decrypt data
- `syn.crypt.hash(data)` - SHA256 hash
- `syn.crypt.base64.encode(data)` - Base64 encode
- `syn.crypt.base64.decode(data)` - Base64 decode

## Examples

### Basic Script Execution
```lua
loadstring(game:HttpGet("https://example.com/script.lua"))()
```

### Save Game Data
```lua
local data = {
    level = 100,
    coins = 999999
}
writefile("gamedata.json", game:GetService("HttpService"):JSONEncode(data))
```

### Custom ESP
```lua
for _, player in pairs(game.Players:GetPlayers()) do
    local highlight = Instance.new("Highlight")
    highlight.Parent = player.Character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
end
```