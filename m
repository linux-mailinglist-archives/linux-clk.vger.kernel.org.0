Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AEC2B0A86
	for <lists+linux-clk@lfdr.de>; Thu, 12 Nov 2020 17:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgKLQoV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Nov 2020 11:44:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:49880 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729107AbgKLQoG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 12 Nov 2020 11:44:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7FCB9B016;
        Thu, 12 Nov 2020 16:44:04 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org
Cc:     f.fainelli@gmail.com, linux-pwm@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        wahrenst@gmx.net, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-rpi-kernel@lists.infradead.org, bgolaszewski@baylibre.com,
        andy.shevchenko@gmail.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v4 07/11] staging: vchiq: Release firmware handle on unbind
Date:   Thu, 12 Nov 2020 17:36:25 +0100
Message-Id: <20201112163630.17177-8-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112163630.17177-1-nsaenzjulienne@suse.de>
References: <20201112163630.17177-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use devm_rpi_firmware_get() so as to make sure we release RPi's firmware
interface when unbinding the device.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes since v2:
 - Use devm_rpi_firmware_get(), instead of remove function

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f500a7043805..6c196cade4a0 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2732,7 +2732,7 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	drvdata->fw = rpi_firmware_get(fw_node);
+	drvdata->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
 	of_node_put(fw_node);
 	if (!drvdata->fw)
 		return -EPROBE_DEFER;
-- 
2.29.2

