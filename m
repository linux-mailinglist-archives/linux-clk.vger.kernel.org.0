Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424737B2B69
	for <lists+linux-clk@lfdr.de>; Fri, 29 Sep 2023 07:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjI2FkD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 29 Sep 2023 01:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbjI2Fj6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 01:39:58 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952ED1AA
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:39:33 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ad810be221so1839278966b.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965971; x=1696570771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tx8IsOEvb8qkvUy2Or6MBahI0OwwMce9fHoVPFho48=;
        b=C4lp08O6yska7znKdYMmclZfGa3X6+zuJBT3DJfQ5oFKoe9K9y7j8LuAzgRiYdNfmh
         5hzYKxAleR/W+F4qeYhKDx7HWinwO/whkxrbHVI84w6dN9Qxh8shf/x62wyy5g3zPsCa
         N1xq1GjBB50q7BwpUN8RchxaYfphycRls3aHGCMsN6VgFjWAV3CozP37FGuU4/UTU3DO
         kyeR1VNOoMj2Lsxg085moJky6ahF+z7OABVZtHX1No3Cx6kOPD8g2YcOCdTgXJ/JV+GT
         EhyqUJC8cET6tgiAFt3jBN2SCqRgCIBNp2WEeDqwpwcBUuhJcyKyymOgsL6y79be6J/l
         3mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965971; x=1696570771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Tx8IsOEvb8qkvUy2Or6MBahI0OwwMce9fHoVPFho48=;
        b=FLTR3lHHfRCQdrQZQ8pAfX3ML6c63pekqKfkAaaYmoOgaWodUObMlqjjCSsbZLFLnB
         RjZiTEG94za6uZXpvqjnCZs4372nCsqgMTmeMSn1qX3WI5Y+QTAyqLoyXNY+CAUMsspb
         vCqlB1O/eOm+GNLMpTNsy/8VQzCe8oS6FHTN4naJPNwL0JWmQXkX7TEuf08199knlAyp
         15Gb/onDr9Nbf3T/tWc01kL2VGh0w35psemaPC7Rgvy/gC1raJqqJj85yYyZneYrParq
         IgiF5/nl8f1YIvzbIQqkGl7r68Rt1ET20fN6PDJ52UOuJgnOo83Wo/MicjOi5f9o2lxc
         8kPw==
X-Gm-Message-State: AOJu0Yzf59t340QtRRpCRRH/zN86pBrEJIhftdsMthdfot1L0oiVL1Qo
        P0FHuHY7gO4ZtnY0xZZOUtmRiQ==
X-Google-Smtp-Source: AGHT+IFssgixc+IrMTS/V7svcvYp3mqrtz9kBpFjxlgOV+eCYx41PSPSVkMAV0EmJXCg9RRV7OOD1A==
X-Received: by 2002:a17:906:845b:b0:9ae:695a:fed1 with SMTP id e27-20020a170906845b00b009ae695afed1mr2909592ejy.1.1695965971645;
        Thu, 28 Sep 2023 22:39:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:31 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/28] clk: renesas: rzg2l: remove critical area
Date:   Fri, 29 Sep 2023 08:38:53 +0300
Message-Id: <20230929053915.1530607-7-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

spinlock in rzg2l_mod_clock_endisable() is intended to protect the accesses
to hardware register. There is no need to protect the instructions that set
temporary variable which will be then written to register. With this only
one write to one clock register is executed thus locking/unlocking rmw_lock
is removed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- removed also the spinlock
- s/reduce/remove in patch title

 drivers/clk/renesas/rzg2l-cpg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f411e428196c..d936832e098f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -895,7 +895,6 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	struct rzg2l_cpg_priv *priv = clock->priv;
 	unsigned int reg = clock->off;
 	struct device *dev = priv->dev;
-	unsigned long flags;
 	u32 bitmask = BIT(clock->bit);
 	u32 value;
 	int error;
@@ -907,14 +906,12 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 	dev_dbg(dev, "CLK_ON %u/%pC %s\n", CLK_ON_R(reg), hw->clk,
 		enable ? "ON" : "OFF");
-	spin_lock_irqsave(&priv->rmw_lock, flags);
 
 	value = bitmask << 16;
 	if (enable)
 		value |= bitmask;
-	writel(value, priv->base + CLK_ON_R(reg));
 
-	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+	writel(value, priv->base + CLK_ON_R(reg));
 
 	if (!enable)
 		return 0;
-- 
2.39.2

