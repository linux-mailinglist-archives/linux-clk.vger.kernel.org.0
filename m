Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00863513E17
	for <lists+linux-clk@lfdr.de>; Thu, 28 Apr 2022 23:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352572AbiD1Vwe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Apr 2022 17:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352578AbiD1Vw1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 17:52:27 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AECC3E93;
        Thu, 28 Apr 2022 14:49:01 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id iy15so4154193qvb.9;
        Thu, 28 Apr 2022 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1f3Yfu938jxGCkmlb8BfVFai9ksh1Y/ysABW8/tTYk=;
        b=EcIinGh7vzfnTzYzGYbR+cN5TAje6CmoHqKOjna0f1WAFG2zC3jpXhQt489ZRdrHCb
         r2nwVvYQa1CnoRhnGFJFeszQULyi5FKE/9g0Qm+rIuYQni72mrIxtSSkm0tfuERFsEeD
         QrjQ0nYC2sNIcYH8F922eCd8iQvz42qnxB2VSZqGqVYRVMrgFngtFRw5k3xZzBZ7GIyl
         CtTf4MQza2hTkGThRgZZzd2aRRf+p6QUKsbIE2piMLLRV5pqpK5zGjDpwYHES9pkcl1s
         3BdfcDzP304gCDfr0HoZdgjJE+KYiHW/dT9njj5l2ENeYuLdEr98N4QeupvaiSV4X84Q
         nWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1f3Yfu938jxGCkmlb8BfVFai9ksh1Y/ysABW8/tTYk=;
        b=tyHRL7ujcUBiXaYFc1blll5m8rNWFwl94yLeYO4xVTV64Risc0ooIZWpapGnmM428U
         igpGsjGAO5qhyobtuqpiMuWYy7sEjEic/qPKycy9dWADtp57N5Cld1y38nV4AkST/Y/d
         30dzedUl/0cmkfr2GNcpTYDDWadRh8SC7i35vKHlHm/Hfq3EdpY4ICPXEOxxHNphILza
         pDZQhKMz3bvzEGshuicp82DT9UaAHhc+57dOj9DUacWbRR+3vDEmFGbEpgWaX6Xqdby7
         sJXXJcsZ5BhVvgn+S81+N4xHvkJ9LDrq2lW20UXvn16N95OIh5YAp9lDLkMJbOAhyRPC
         U6Zg==
X-Gm-Message-State: AOAM533iBYM0/pFW3QwBNEuqPnYCaAzF5qbTGgIRrlV5n+A1yCCSoj3W
        rTOT0wkY/LTQcRxCvNjxRpY=
X-Google-Smtp-Source: ABdhPJyn20kvyjGFqZG4USwVaUSqMsmccNmnEWvOfEINftQJvK5kIg7foBM885sLKcPlnojmERPF9g==
X-Received: by 2002:ad4:5941:0:b0:433:75f:8627 with SMTP id eo1-20020ad45941000000b00433075f8627mr25818833qvb.122.1651182540610;
        Thu, 28 Apr 2022 14:49:00 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:49:00 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
        linus.walleij@linaro.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, Mr.Bossman075@gmail.com,
        clin@suse.com, giulio.benetti@benettiengineering.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl driver support
Date:   Thu, 28 Apr 2022 17:48:35 -0400
Message-Id: <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the pinctrl driver support for i.MXRT1170.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Nothing done
---
 drivers/pinctrl/freescale/Kconfig             |   7 +
 drivers/pinctrl/freescale/Makefile            |   1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c | 349 ++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1170.c

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 21fa21c6547b..15af3d80e119 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -192,3 +192,10 @@ config PINCTRL_IMX23
 config PINCTRL_IMX28
 	bool
 	select PINCTRL_MXS
+
+config PINCTRL_IMXRT1170
+	bool "IMXRT1170 pinctrl driver"
+	depends on ARCH_MXC
+	select PINCTRL_IMX
+	help
+	  Say Y here to enable the imxrt1170 pinctrl driver
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index c44930b1b362..c2c088ca33cc 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_PINCTRL_MXS)	+= pinctrl-mxs.o
 obj-$(CONFIG_PINCTRL_IMX23)	+= pinctrl-imx23.o
 obj-$(CONFIG_PINCTRL_IMX25)	+= pinctrl-imx25.o
 obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
+obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imxrt1170.c b/drivers/pinctrl/freescale/pinctrl-imxrt1170.c
new file mode 100644
index 000000000000..5da1545fde91
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imxrt1170.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022
+ * Author(s): Jesse Taube <Mr.Bossman075@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-imx.h"
+
+enum imxrt1170_pads {
+	IMXRT1170_PAD_RESERVE0,
+	IMXRT1170_PAD_RESERVE1,
+	IMXRT1170_PAD_RESERVE2,
+	IMXRT1170_PAD_RESERVE3,
+	IMXRT1170_PAD_EMC_B1_00,
+	IMXRT1170_PAD_EMC_B1_01,
+	IMXRT1170_PAD_EMC_B1_02,
+	IMXRT1170_PAD_EMC_B1_03,
+	IMXRT1170_PAD_EMC_B1_04,
+	IMXRT1170_PAD_EMC_B1_05,
+	IMXRT1170_PAD_EMC_B1_06,
+	IMXRT1170_PAD_EMC_B1_07,
+	IMXRT1170_PAD_EMC_B1_08,
+	IMXRT1170_PAD_EMC_B1_09,
+	IMXRT1170_PAD_EMC_B1_10,
+	IMXRT1170_PAD_EMC_B1_11,
+	IMXRT1170_PAD_EMC_B1_12,
+	IMXRT1170_PAD_EMC_B1_13,
+	IMXRT1170_PAD_EMC_B1_14,
+	IMXRT1170_PAD_EMC_B1_15,
+	IMXRT1170_PAD_EMC_B1_16,
+	IMXRT1170_PAD_EMC_B1_17,
+	IMXRT1170_PAD_EMC_B1_18,
+	IMXRT1170_PAD_EMC_B1_19,
+	IMXRT1170_PAD_EMC_B1_20,
+	IMXRT1170_PAD_EMC_B1_21,
+	IMXRT1170_PAD_EMC_B1_22,
+	IMXRT1170_PAD_EMC_B1_23,
+	IMXRT1170_PAD_EMC_B1_24,
+	IMXRT1170_PAD_EMC_B1_25,
+	IMXRT1170_PAD_EMC_B1_26,
+	IMXRT1170_PAD_EMC_B1_27,
+	IMXRT1170_PAD_EMC_B1_28,
+	IMXRT1170_PAD_EMC_B1_29,
+	IMXRT1170_PAD_EMC_B1_30,
+	IMXRT1170_PAD_EMC_B1_31,
+	IMXRT1170_PAD_EMC_B1_32,
+	IMXRT1170_PAD_EMC_B1_33,
+	IMXRT1170_PAD_EMC_B1_34,
+	IMXRT1170_PAD_EMC_B1_35,
+	IMXRT1170_PAD_EMC_B1_36,
+	IMXRT1170_PAD_EMC_B1_37,
+	IMXRT1170_PAD_EMC_B1_38,
+	IMXRT1170_PAD_EMC_B1_39,
+	IMXRT1170_PAD_EMC_B1_40,
+	IMXRT1170_PAD_EMC_B1_41,
+	IMXRT1170_PAD_EMC_B2_00,
+	IMXRT1170_PAD_EMC_B2_01,
+	IMXRT1170_PAD_EMC_B2_02,
+	IMXRT1170_PAD_EMC_B2_03,
+	IMXRT1170_PAD_EMC_B2_04,
+	IMXRT1170_PAD_EMC_B2_05,
+	IMXRT1170_PAD_EMC_B2_06,
+	IMXRT1170_PAD_EMC_B2_07,
+	IMXRT1170_PAD_EMC_B2_08,
+	IMXRT1170_PAD_EMC_B2_09,
+	IMXRT1170_PAD_EMC_B2_10,
+	IMXRT1170_PAD_EMC_B2_11,
+	IMXRT1170_PAD_EMC_B2_12,
+	IMXRT1170_PAD_EMC_B2_13,
+	IMXRT1170_PAD_EMC_B2_14,
+	IMXRT1170_PAD_EMC_B2_15,
+	IMXRT1170_PAD_EMC_B2_16,
+	IMXRT1170_PAD_EMC_B2_17,
+	IMXRT1170_PAD_EMC_B2_18,
+	IMXRT1170_PAD_EMC_B2_19,
+	IMXRT1170_PAD_EMC_B2_20,
+	IMXRT1170_PAD_AD_00,
+	IMXRT1170_PAD_AD_01,
+	IMXRT1170_PAD_AD_02,
+	IMXRT1170_PAD_AD_03,
+	IMXRT1170_PAD_AD_04,
+	IMXRT1170_PAD_AD_05,
+	IMXRT1170_PAD_AD_06,
+	IMXRT1170_PAD_AD_07,
+	IMXRT1170_PAD_AD_08,
+	IMXRT1170_PAD_AD_09,
+	IMXRT1170_PAD_AD_10,
+	IMXRT1170_PAD_AD_11,
+	IMXRT1170_PAD_AD_12,
+	IMXRT1170_PAD_AD_13,
+	IMXRT1170_PAD_AD_14,
+	IMXRT1170_PAD_AD_15,
+	IMXRT1170_PAD_AD_16,
+	IMXRT1170_PAD_AD_17,
+	IMXRT1170_PAD_AD_18,
+	IMXRT1170_PAD_AD_19,
+	IMXRT1170_PAD_AD_20,
+	IMXRT1170_PAD_AD_21,
+	IMXRT1170_PAD_AD_22,
+	IMXRT1170_PAD_AD_23,
+	IMXRT1170_PAD_AD_24,
+	IMXRT1170_PAD_AD_25,
+	IMXRT1170_PAD_AD_26,
+	IMXRT1170_PAD_AD_27,
+	IMXRT1170_PAD_AD_28,
+	IMXRT1170_PAD_AD_29,
+	IMXRT1170_PAD_AD_30,
+	IMXRT1170_PAD_AD_31,
+	IMXRT1170_PAD_AD_32,
+	IMXRT1170_PAD_AD_33,
+	IMXRT1170_PAD_AD_34,
+	IMXRT1170_PAD_AD_35,
+	IMXRT1170_PAD_SD_B1_00,
+	IMXRT1170_PAD_SD_B1_01,
+	IMXRT1170_PAD_SD_B1_02,
+	IMXRT1170_PAD_SD_B1_03,
+	IMXRT1170_PAD_SD_B1_04,
+	IMXRT1170_PAD_SD_B1_05,
+	IMXRT1170_PAD_SD_B2_00,
+	IMXRT1170_PAD_SD_B2_01,
+	IMXRT1170_PAD_SD_B2_02,
+	IMXRT1170_PAD_SD_B2_03,
+	IMXRT1170_PAD_SD_B2_04,
+	IMXRT1170_PAD_SD_B2_05,
+	IMXRT1170_PAD_SD_B2_06,
+	IMXRT1170_PAD_SD_B2_07,
+	IMXRT1170_PAD_SD_B2_08,
+	IMXRT1170_PAD_SD_B2_09,
+	IMXRT1170_PAD_SD_B2_10,
+	IMXRT1170_PAD_SD_B2_11,
+	IMXRT1170_PAD_DISP_B1_00,
+	IMXRT1170_PAD_DISP_B1_01,
+	IMXRT1170_PAD_DISP_B1_02,
+	IMXRT1170_PAD_DISP_B1_03,
+	IMXRT1170_PAD_DISP_B1_04,
+	IMXRT1170_PAD_DISP_B1_05,
+	IMXRT1170_PAD_DISP_B1_06,
+	IMXRT1170_PAD_DISP_B1_07,
+	IMXRT1170_PAD_DISP_B1_08,
+	IMXRT1170_PAD_DISP_B1_09,
+	IMXRT1170_PAD_DISP_B1_10,
+	IMXRT1170_PAD_DISP_B1_11,
+	IMXRT1170_PAD_DISP_B2_00,
+	IMXRT1170_PAD_DISP_B2_01,
+	IMXRT1170_PAD_DISP_B2_02,
+	IMXRT1170_PAD_DISP_B2_03,
+	IMXRT1170_PAD_DISP_B2_04,
+	IMXRT1170_PAD_DISP_B2_05,
+	IMXRT1170_PAD_DISP_B2_06,
+	IMXRT1170_PAD_DISP_B2_07,
+	IMXRT1170_PAD_DISP_B2_08,
+	IMXRT1170_PAD_DISP_B2_09,
+	IMXRT1170_PAD_DISP_B2_10,
+	IMXRT1170_PAD_DISP_B2_11,
+	IMXRT1170_PAD_DISP_B2_12,
+	IMXRT1170_PAD_DISP_B2_13,
+	IMXRT1170_PAD_DISP_B2_14,
+	IMXRT1170_PAD_DISP_B2_15,
+};
+
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc imxrt1170_pinctrl_pads[] = {
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE0),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE1),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE2),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE3),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_12),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_13),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_14),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_15),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_16),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_17),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_18),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_19),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_20),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_21),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_22),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_23),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_24),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_25),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_26),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_27),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_28),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_29),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_30),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_31),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_32),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_33),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_34),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_35),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_36),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_37),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_38),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_39),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_40),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_41),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_12),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_13),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_14),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_15),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_16),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_17),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_18),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_19),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_20),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_12),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_13),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_14),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_15),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_16),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_17),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_18),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_19),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_20),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_21),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_22),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_23),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_24),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_25),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_26),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_27),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_28),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_29),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_30),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_31),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_32),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_33),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_34),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_35),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_00),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_01),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_02),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_03),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_04),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_05),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_06),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_07),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_08),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_09),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_10),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_11),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_12),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_13),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_14),
+	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_15),
+};
+
+static const struct imx_pinctrl_soc_info imxrt1170_pinctrl_info = {
+	.pins = imxrt1170_pinctrl_pads,
+	.npins = ARRAY_SIZE(imxrt1170_pinctrl_pads),
+	.gpr_compatible = "fsl,imxrt1170-iomuxc-gpr",
+};
+
+static const struct of_device_id imxrt1170_pinctrl_of_match[] = {
+	{ .compatible = "fsl,imxrt1170-iomuxc", .data = &imxrt1170_pinctrl_info, },
+	{ /* sentinel */ }
+};
+
+static int imxrt1170_pinctrl_probe(struct platform_device *pdev)
+{
+	return imx_pinctrl_probe(pdev, &imxrt1170_pinctrl_info);
+}
+
+static struct platform_driver imxrt1170_pinctrl_driver = {
+	.driver = {
+		.name = "imxrt1170-pinctrl",
+		.of_match_table = of_match_ptr(imxrt1170_pinctrl_of_match),
+		.suppress_bind_attrs = true,
+	},
+	.probe = imxrt1170_pinctrl_probe,
+};
+
+static int __init imxrt1170_pinctrl_init(void)
+{
+	return platform_driver_register(&imxrt1170_pinctrl_driver);
+}
+arch_initcall(imxrt1170_pinctrl_init);
-- 
2.35.1

