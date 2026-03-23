#pragma once
#include <Windows.h>

// Advanced injection methods
bool ManualMapDLL(const char* dllPath);
bool SetThreadIdentity(int level);
bool BypassByfron();
bool HideFromAC();

// Memory utilities
DWORD GetProcessId(const char* processName);
bool WriteMemory(DWORD address, void* buffer, size_t size);
bool ReadMemory(DWORD address, void* buffer, size_t size);

// Hook functions
bool InstallHooks();
bool RemoveHooks();