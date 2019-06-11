Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CCD3D4DA
	for <lists+linux-clk@lfdr.de>; Tue, 11 Jun 2019 20:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406628AbfFKSCa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Jun 2019 14:02:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:32798 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406685AbfFKSC3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Jun 2019 14:02:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D3FE6AEF7;
        Tue, 11 Jun 2019 18:02:27 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     stefan.wahren@i2se.com, linux-kernel@vger.kernel.org
Cc:     mbrugger@suse.de, viresh.kumar@linaro.org, rjw@rjwysocki.net,
        sboyd@kernel.org, eric@anholt.net, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, ptesarik@suse.com,
        linux-rpi-kernel@lists.infradead.org, ssuloev@orpaltech.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, linux-pm@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v3 3/7] firmware: raspberrypi: register clk device
Date:   Tue, 11 Jun 2019 19:58:38 +0200
Message-Id: <20190611175839.28351-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611175839.28351-1-nsaenzjulienne@suse.de>
References: <20190611175839.28351-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since clk-raspberrypi is tied to the VC4 firmware instead of particular
hardware it's registration should be performed by the firmware driver.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Acked-by: Eric Anholt <eric@anholt.net>
---
 drivers/firmware/raspberrypi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 61be15d9df7d..da26a584dca0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -20,6 +20,7 @@
 #define MBOX_CHAN_PROPERTY		8
 
 static struct platform_device *rpi_hwmon;
+static struct platform_device *rpi_clk;
 
 struct rpi_firmware {
 	struct mbox_client cl;
@@ -207,6 +208,12 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 						  -1, NULL, 0);
 }
 
+static void rpi_register_clk_driver(struct device *dev)
+{
+	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
+						-1, NULL, 0);
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -234,6 +241,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
+	rpi_register_clk_driver(dev);
 
 	return 0;
 }
@@ -254,6 +262,8 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 
 	platform_device_unregister(rpi_hwmon);
 	rpi_hwmon = NULL;
+	platform_device_unregister(rpi_clk);
+	rpi_clk = NULL;
 	mbox_free_channel(fw->chan);
 
 	return 0;
-- 
2.21.0

