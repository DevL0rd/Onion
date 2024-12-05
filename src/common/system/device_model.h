#ifndef DEVICE_MODEL_H__
#define DEVICE_MODEL_H__

#include "utils/file.h"
#include <stdio.h>

#define MIYOO283_WIFI 696
#define MIYOO283 283
#define MIYOO354 354

static int DEVICE_ID;
static char DEVICE_SN[12];

/**
 * @brief Get device model
 * MM = Miyoo mini
 * MMP = Miyoo mini plus
 */

void getDeviceModel(void)
{
    // if the file /.forceMIYOO283 exists, then set the device model to MIYOO283
    if (exists("/mnt/SDCARD/.mmWifiMod")) {
        DEVICE_ID = MIYOO283_WIFI;
        return;
    }
    return;
    FILE *fp;
    file_get(fp, "/tmp/deviceModel", "%d", &DEVICE_ID);
}

void getDeviceSerial(void)
{
    FILE *fp;
    file_get(fp, "/tmp/deviceSN", "%[^\n]", DEVICE_SN);
}

#endif // DEVICE_MODEL_H__
