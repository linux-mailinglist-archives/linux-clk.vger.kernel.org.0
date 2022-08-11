Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2020058F96E
	for <lists+linux-clk@lfdr.de>; Thu, 11 Aug 2022 10:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiHKIpQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Aug 2022 04:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbiHKIov (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 04:44:51 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E929108E
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 01:44:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id j8so32288087ejx.9
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lsWSqA2HL9bDCW4avw/DgO2p3E9K5sHwSFYZt6gxnxY=;
        b=T7VphdBfATr9q7YYOWkzhR2WASaWgaytkDtcX6Grl9VADQtt9aChWh3R4qsMzyEPQ2
         dOta+R31mJ90LoR4XPvs55Qt18vy0h3rwGM4Qdp/JYvSBWgHrCiaZfeDcWV9yCIiWgjr
         mSnaHa/MswRMtvqlwvezYYhyQKve0WoiETLeS/RVpK7OaKWJEcgAk/ig3kCu6L8i8ED9
         6x+qiUP+YYYy3YUzZTczw0toC6XarmTXv6TU2J+eZX5wfe1ykixiDYbooxvohS8MuqJz
         oiFQhwVt/U1qLPwN/BqD56JKn+GSbMQQ57XsoU1nyHx4agm8a6VjyiQ3ylaMjmNWhE0a
         Drkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lsWSqA2HL9bDCW4avw/DgO2p3E9K5sHwSFYZt6gxnxY=;
        b=K5DhJKbqhAH5WBEAu70fno+r/jLy+WaNxY+CB+2InkfNFhtS2KTIp3C1u56EldU8YT
         hfjfUYD9+BAEdXk7aTiHCHJ0H9KHo+OqHV6Rak+PIyd53VGao3rl4c/+4/e5m99frrOU
         tr+fFF09DljmJ59k/0EovxiKYn+b73xusWKVMF/9z9TBBeLtU6QboELHX4zbwVR6pj0E
         gh10JqlkT5fxKjJZnAkuje9uHCkv8/uiJvXqLHDBsNIrDF+iUSJTJDj9K7nx32Hb1MpG
         RgH5qS6mdoDOYGOoRtq5S3bYDqZSwlC1XKVr29aI23YnxFxWDaq3Z4opv+ip6+8ZxyS9
         ESLg==
X-Gm-Message-State: ACgBeo3KJ92FBTfT+nAvr/PSlok6VkVKzKrN1WMiOViJ2uk9OdakqVdR
        Hs10jX7JT7k+bjUFszrJtXLqnw==
X-Google-Smtp-Source: AA6agR72qAJm1q+utoby0dFLib1V9rCtlj6nYjVZgz2ip4o5zEoQXrnGANfzlF2y2dp9Cy5Auoya6g==
X-Received: by 2002:a17:906:ee8e:b0:730:4a24:f311 with SMTP id wt14-20020a170906ee8e00b007304a24f311mr24182040ejb.420.1660207483867;
        Thu, 11 Aug 2022 01:44:43 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d5cf000000b0043d6ece495asm8799314eds.55.2022.08.11.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:44:43 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 3/4] clk: mediatek: Export required common code symbols
Date:   Thu, 11 Aug 2022 10:44:32 +0200
Message-Id: <20220811084433.2598575-4-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811084433.2598575-1-msp@baylibre.com>
References: <20220811084433.2598575-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To make clk-mt8365 compilable as a module there are a few function
symbols missing. This patch adds the required EXPORT_SYMBOL_GPL to the
functions.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - New patch

 drivers/clk/mediatek/clk-gate.c | 1 +
 drivers/clk/mediatek/clk-mtk.c  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 421806236228..0c867136e49d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
 
 int mtk_clk_register_gates(struct device_node *node,
 			   const struct mtk_gate *clks, int num,
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index a317e69cf298..22519e7ea74f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -422,6 +422,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_dividers);
 
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -441,6 +442,7 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
@@ -475,6 +477,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -488,5 +491,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
-- 
2.36.1

