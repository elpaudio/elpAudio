#define EXPORT extern "C" __declspec(dllexport)
#include <windows.h>

BOOL CALLBACK MonitorEnumProc(HMONITOR hMonitor, HDC hdcMonitor, LPRECT lprcMonitor, LPARAM dwData)
{
	int *Count = (int*)dwData;
	(*Count)++;
	return TRUE;
}

EXPORT double monitorCount()
{
	int Count = 0;
	if (EnumDisplayMonitors(NULL, NULL, MonitorEnumProc, (LPARAM)&Count))
		return Count;
	return -1;	//signals an error
}

EXPORT double GetDisplaysW() {
	return GetSystemMetrics(SM_CXVIRTUALSCREEN);
}

EXPORT double GetDisplaysH() {
	return GetSystemMetrics(SM_CYVIRTUALSCREEN);
}

EXPORT double GetDisplayX() {
	return GetSystemMetrics(SM_CXVIRTUALSCREEN) - GetSystemMetrics(SM_CXSCREEN);
}

EXPORT double GetDisplayY() {
	return GetSystemMetrics(SM_CYVIRTUALSCREEN) - GetSystemMetrics(SM_CYSCREEN);
}


EXPORT BOOL APIENTRY DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	switch (fdwReason)
	{
	case DLL_PROCESS_ATTACH:
		// attach to process
		// return FALSE to fail DLL load
		break;

	case DLL_PROCESS_DETACH:
		// detach from process
		break;

	case DLL_THREAD_ATTACH:
		// attach to thread
		break;

	case DLL_THREAD_DETACH:
		// detach from thread
		break;
	}
	return TRUE; // succesful
}