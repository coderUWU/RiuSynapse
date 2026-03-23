#include <Windows.h>
#include <iostream>
#include <string>
#include "core/injection.h"
#include "core/execution.h"
#include "api/lua_api.h"

#define VERSION "2.8.5"

class RobloxExecutor {
private:
    HANDLE robloxProcess;
    DWORD processId;
    bool isInjected;
    
public:
    RobloxExecutor() : isInjected(false) {}
    
    bool FindRoblox() {
        // Find RobloxPlayerBeta.exe
        HWND hwnd = FindWindowA(nullptr, "Roblox");
        if (!hwnd) return false;
        
        GetWindowThreadProcessId(hwnd, &processId);
        robloxProcess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, processId);
        
        return robloxProcess != nullptr;
    }
    
    bool Inject() {
        if (!robloxProcess) return false;
        
        // Bypass Byfron anti-cheat
        BypassByfron();
        
        // Manual map injection
        ManualMapDLL("executor.dll");
        
        isInjected = true;
        return true;
    }
    
    void Execute(const std::string& script) {
        if (!isInjected) return;
        
        // Level 8 execution context
        SetThreadIdentity(8);
        
        // Execute Lua script
        LuaState* L = GetLuaState();
        luaL_dostring(L, script.c_str());
    }
};

int main() {
    std::cout << "SynapseZ v" << VERSION << " - Premium Executor\n";
    
    RobloxExecutor executor;
    
    if (!executor.FindRoblox()) {
        std::cout << "Please launch Roblox first!\n";
        return 1;
    }
    
    std::cout << "Injecting...\n";
    
    if (executor.Inject()) {
        std::cout << "Successfully injected!\n";
        std::cout << "Executor ready.\n";
    }
    
    return 0;
}