Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3A2550BA1
	for <lists+linux-clk@lfdr.de>; Sun, 19 Jun 2022 17:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbiFSPNJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 19 Jun 2022 11:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235235AbiFSPMs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 11:12:48 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DBA1DF7F;
        Sun, 19 Jun 2022 08:12:44 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id 854D51C8120B;
        Sun, 19 Jun 2022 23:12:29 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Sun, 19 Jun
 2022 23:12:29 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sun, 19 Jun 2022 23:12:29 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 7533463A23; Sun, 19 Jun 2022 18:12:27 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <jirislaby@kernel.org>,
        <shawnguo@kernel.org>, <bjorn.andersson@linaro.org>,
        <geert+renesas@glider.be>, <marcel.ziswiler@toradex.com>,
        <vkoul@kernel.org>, <biju.das.jz@bp.renesas.com>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <robert.hancock@calian.com>,
        <j.neuschaefer@gmx.net>, <lkundrak@v3.sk>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 09/18] reset: npcm: using syscon instead of device data
Date:   Sun, 19 Jun 2022 18:12:16 +0300
Message-ID: <20220619151225.209029-10-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220619151225.209029-1-tmaimon77@gmail.com>
References: <20220619151225.209029-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Using syscon device tree property instead of device data to handle the
NPCM general control registers.

In case the syscon not found the code still search for nuvoton,npcm750-gcr
to support DTS backward compatibility.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/reset-npcm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 2ea4d3136e15..431ff2b602c5 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -138,8 +138,7 @@ static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
 }
 
 static const struct of_device_id npcm_rc_match[] = {
-	{ .compatible = "nuvoton,npcm750-reset",
-		.data = (void *)"nuvoton,npcm750-gcr" },
+	{ .compatible = "nuvoton,npcm750-reset"},
 	{ }
 };
 
@@ -155,15 +154,15 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	u32 ipsrst1_bits = 0;
 	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
 	u32 ipsrst3_bits = 0;
-	const char *gcr_dt;
 
-	gcr_dt = (const char *)
-	of_match_device(dev->driver->of_match_table, dev)->data;
-
-	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
 	if (IS_ERR(gcr_regmap)) {
-		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
-		return PTR_ERR(gcr_regmap);
+		dev_warn(&pdev->dev, "Failed to find nuvoton,sysgcr search for nuvoton,npcm750-gcr for Poleg backward compatibility");
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap)) {
+			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-gcr");
+			return PTR_ERR(gcr_regmap);
+		}
 	}
 
 	/* checking which USB device is enabled */
-- 
2.33.0

