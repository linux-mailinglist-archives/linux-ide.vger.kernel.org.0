Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1C26A2370
	for <lists+linux-ide@lfdr.de>; Fri, 24 Feb 2023 22:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjBXVHY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 24 Feb 2023 16:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjBXVHX (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 24 Feb 2023 16:07:23 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901736F420
        for <linux-ide@vger.kernel.org>; Fri, 24 Feb 2023 13:07:12 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j3so522055wms.2
        for <linux-ide@vger.kernel.org>; Fri, 24 Feb 2023 13:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0e9wKai03am79CRSK5WLZ1F5ap0ezDnNlxcN7b+lDFE=;
        b=gEQoDMGG85UUYLbhj+CszX25rKahJvE6EsHrpVCD19nrYJY2UMAttAzvRvcvFN3yTT
         u318zaSVLJsM6I6JVHi80qrxGGMn+9MkpPU6e4HRDU69KMDKaHBdMIKp3F4xD6yMnLcZ
         7uMOqyx/xHwTW0kE3kyCw06W1Cp5G/4vo7a3v3AWFtoa82b5rlUctdGN6bhxRxevyJV5
         M07S1+eVOOQwONkafWtcKeIkmyh2reb5YG0DaTLhmCl7cUzt6qPOUSXEfuM5K/cPq58T
         5lF8wUwuqCnMOeK3TbXzD4RL5HT7RVYJYcLsDUU0X3RBls0Hd9vLX47GLU28ul3h30PX
         17zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0e9wKai03am79CRSK5WLZ1F5ap0ezDnNlxcN7b+lDFE=;
        b=D8SeD+UOTdBgp8UmT9OO+gxv/dDrfqPJ/7EFSk/vVaUaGGrIeAzlVZprVm9aLKzCSm
         8yyEZ5CVqu43agurR+U958+nR1qq7gEdQrfW6G4q/44nxEcJUXkCM68yfeVf+9nKedq/
         rFy/kmLDauePHvJ7/qeI/+ZJwMoTZfwChkBG1cj50Uv4cvgkC15MnWWA0lcFxAv6uGrF
         nvy962hpUyZfxL1ociKHWKcd1j72K/xJdmf14rpNyrfMBMuWXSiFqwgfYw9IfUSHDNAz
         yzbGIUZNX7/B5QZ4frBKngRRdJGDnnBQ+o005x2PLOGDHrBx9AUQh8+RjOwpUKuIstTP
         TXYw==
X-Gm-Message-State: AO0yUKWcSt0vJF4AuYg9XX8tIPwaQ1PdgGvuGQBdpfd9SJGtXdHvLcWm
        Qko4XvSXByi3vZ0fpfxNpfEP2w==
X-Google-Smtp-Source: AK7set/o5gusVY1R+OzmQQgCBRNYS3Y1I/Iq5pNaqgB60578gum3u5lnbg6rHhPkocyc7M2+2HFR2Q==
X-Received: by 2002:a05:600c:1c28:b0:3e8:490b:e28b with SMTP id j40-20020a05600c1c2800b003e8490be28bmr10327809wms.25.1677272830367;
        Fri, 24 Feb 2023 13:07:10 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:3e6f:e90a:1fc9:3708])
        by smtp.gmail.com with ESMTPSA id b9-20020a5d4b89000000b002c794495f6fsm1947270wrt.117.2023.02.24.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 13:07:09 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Ido Schimmel <idosch@nvidia.com>,
        Petr Machata <petrm@nvidia.com>,
        Gregory Greenman <gregory.greenman@intel.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Talel Shenhar <talel@amazon.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Balsam CHIHI <bchihi@baylibre.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/17] Self-encapsulate the thermal zone device structure
Date:   Fri, 24 Feb 2023 22:06:17 +0100
Message-Id: <20230224210634.3994365-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The exported thermal headers expose the thermal core structure while those
should be private to the framework. The initial idea was the thermal sensor
drivers use the thermal zone device structure pointer to pass it around from
the ops to the thermal framework API like a handler.

Unfortunately, different drivers are using and abusing the internals of this
structure to hook the associated struct device, read the internals values, take
the lock, etc ...

rn order to fix this situation, let's encapsulate the structure leaking the
more in the different drivers: the thermal_zone_device structure.

This series revisit the existing drivers using the thermal zone private
structure internals to change the access to something else. For instance, the
get_temp() ops is using the tz->dev to write a debug trace. Despite the trace
is not helpful, we can check the return value for the get_temp() ops in the
call site and show the message in this place.

With this set of changes, the thermal_zone_device is almost self-encapsulated.
As usual, the acpi driver needs a more complex changes, so that will come in a
separate series along with the structure moved the private core headers.

Changelog:
	- V3:
	   - Collected more tags
	   - Added missing changes for ->devdata in some drivers
	   - Added a 'type' accessor
	   - Replaced the 'type' to 'id' changes by the 'type' accessor
	   - Used the 'type' accessor in the drivers
	- V2:
	   - Collected tags
	   - Added missing changes for ->devdata for the tsens driver
	   - Renamed thermal_zone_device_get_data() to thermal_zone_priv()
	   - Added stubs when CONFIG_THERMAL is not set
	   - Dropped hwmon change where we remove the tz->lock usage

Thank you all for your comments


Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Len Brown <lenb@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Ido Schimmel <idosch@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Cc: Support Opensource <support.opensource@diasemi.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Talel Shenhar <talel@amazon.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Balsam CHIHI <bchihi@baylibre.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-acpi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-input@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org

Daniel Lezcano (17):
  thermal/core: Add a thermal zone 'devdata' accessor
  thermal/core: Show a debug message when get_temp() fails
  thermal: Remove debug or error messages in get_temp() ops
  thermal/hwmon: Do not set no_hwmon before calling
    thermal_add_hwmon_sysfs()
  thermal/hwmon: Use the right device for devm_thermal_add_hwmon_sysfs()
  thermal: Don't use 'device' internal thermal zone structure field
  thermal/core: Add 'type' accessor
  thermal/drivers/spear: Don't use tz->device but pdev->dev
  thermal: Add a thermal zone id accessor
  thermal: Use thermal_zone_device_type() accessor
  thermal/drivers/da9062: Don't access the thermal zone device fields
  thermal/hwmon: Use the thermal_core.h header
  thermal/drivers/tegra: Remove unneeded lock when setting a trip point
  thermal/tegra: Do not enable the thermal zone, it is already enabled
  thermal/drivers/acerhdf: Make interval setting only at module load
    time
  thermal/drivers/acerhdf: Remove pointless governor test
  thermal/traces: Replace the thermal zone structure parameter with the
    field value

 drivers/acpi/thermal.c                        | 18 +++----
 drivers/ata/ahci_imx.c                        |  2 +-
 drivers/hwmon/hwmon.c                         |  4 +-
 drivers/hwmon/pmbus/pmbus_core.c              |  2 +-
 drivers/hwmon/scmi-hwmon.c                    |  4 +-
 drivers/hwmon/scpi-hwmon.c                    |  2 +-
 drivers/iio/adc/sun4i-gpadc-iio.c             |  2 +-
 drivers/input/touchscreen/sun4i-ts.c          |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_thermal.c    |  2 +-
 .../ethernet/mellanox/mlxsw/core_thermal.c    | 16 +++----
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c   |  4 +-
 drivers/platform/x86/acerhdf.c                | 19 ++------
 drivers/power/supply/power_supply_core.c      |  2 +-
 drivers/regulator/max8973-regulator.c         |  2 +-
 drivers/thermal/amlogic_thermal.c             |  4 +-
 drivers/thermal/armada_thermal.c              | 14 ++----
 drivers/thermal/broadcom/bcm2711_thermal.c    |  3 +-
 drivers/thermal/broadcom/bcm2835_thermal.c    |  3 +-
 drivers/thermal/broadcom/brcmstb_thermal.c    |  8 ++--
 drivers/thermal/broadcom/ns-thermal.c         |  2 +-
 drivers/thermal/broadcom/sr-thermal.c         |  2 +-
 drivers/thermal/da9062-thermal.c              | 13 +++--
 drivers/thermal/db8500_thermal.c              |  2 +-
 drivers/thermal/dove_thermal.c                |  7 +--
 drivers/thermal/gov_fair_share.c              |  4 +-
 drivers/thermal/gov_power_allocator.c         |  6 ++-
 drivers/thermal/gov_step_wise.c               |  4 +-
 drivers/thermal/hisi_thermal.c                |  5 +-
 drivers/thermal/imx8mm_thermal.c              |  4 +-
 drivers/thermal/imx_sc_thermal.c              |  9 ++--
 drivers/thermal/imx_thermal.c                 | 47 +++++--------------
 .../intel/int340x_thermal/int3400_thermal.c   |  2 +-
 .../int340x_thermal/int340x_thermal_zone.c    |  4 +-
 .../processor_thermal_device_pci.c            |  4 +-
 drivers/thermal/intel/intel_pch_thermal.c     |  2 +-
 .../thermal/intel/intel_quark_dts_thermal.c   |  6 +--
 drivers/thermal/intel/intel_soc_dts_iosf.c    | 13 ++---
 drivers/thermal/intel/x86_pkg_temp_thermal.c  |  4 +-
 drivers/thermal/k3_bandgap.c                  |  4 +-
 drivers/thermal/k3_j72xx_bandgap.c            |  2 +-
 drivers/thermal/kirkwood_thermal.c            |  7 +--
 drivers/thermal/max77620_thermal.c            |  6 +--
 drivers/thermal/mediatek/auxadc_thermal.c     |  4 +-
 drivers/thermal/mediatek/lvts_thermal.c       | 10 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c      |  6 +--
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c   |  6 +--
 drivers/thermal/qcom/tsens.c                  |  6 +--
 drivers/thermal/qoriq_thermal.c               |  4 +-
 drivers/thermal/rcar_gen3_thermal.c           |  5 +-
 drivers/thermal/rcar_thermal.c                |  8 +---
 drivers/thermal/rockchip_thermal.c            |  8 +---
 drivers/thermal/rzg2l_thermal.c               |  3 +-
 drivers/thermal/samsung/exynos_tmu.c          |  4 +-
 drivers/thermal/spear_thermal.c               | 10 ++--
 drivers/thermal/sprd_thermal.c                |  2 +-
 drivers/thermal/st/st_thermal.c               |  4 +-
 drivers/thermal/st/stm_thermal.c              |  4 +-
 drivers/thermal/sun8i_thermal.c               |  4 +-
 drivers/thermal/tegra/soctherm.c              |  6 +--
 drivers/thermal/tegra/tegra-bpmp-thermal.c    |  6 ++-
 drivers/thermal/tegra/tegra30-tsensor.c       | 31 ++++++------
 drivers/thermal/thermal-generic-adc.c         |  7 ++-
 drivers/thermal/thermal_core.c                | 26 +++++++++-
 drivers/thermal/thermal_helpers.c             |  3 ++
 drivers/thermal/thermal_hwmon.c               |  9 ++--
 drivers/thermal/thermal_hwmon.h               |  4 +-
 drivers/thermal/thermal_mmio.c                |  2 +-
 .../ti-soc-thermal/ti-thermal-common.c        | 10 ++--
 drivers/thermal/uniphier_thermal.c            |  2 +-
 include/linux/thermal.h                       | 19 ++++++++
 include/trace/events/thermal.h                | 24 +++++-----
 .../trace/events/thermal_power_allocator.h    | 12 ++---
 72 files changed, 251 insertions(+), 270 deletions(-)

-- 
2.34.1

