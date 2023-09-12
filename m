Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604CF79C529
	for <lists+linux-clk@lfdr.de>; Tue, 12 Sep 2023 06:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjILExe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Sep 2023 00:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjILEwn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Sep 2023 00:52:43 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC20E6F
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 21:52:34 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso6763828a12.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494353; x=1695099153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snUK6IGdcPPH31oyrmWJb6PGm1SWgHHvAW8FtA1dRGY=;
        b=fsW1QIISAkwqEOyPM4pIHtQSBHEsdVvarIyjLfevy+I2Y9vxrk28aWiUw+xLRreBs7
         044622wXMwW7F0dIWDcx/z9x0r3QJEDCCFcHITMoLpHSQd1K4BqWLuLb7YNXRote2/4I
         YWH7YbZ0naRlCUZh9cBl241mMtqtSJ7JBTgLav9jMmDan0LVBd8c6/pw4e7EJTh/rTuZ
         3+1pam1xeoePQNGiQtNU454gmeF+f+Y2YE284N22dYQuw5ofaxaR8nBrHpvvBTMCOhcJ
         8dbNueD60OMaiylDGMPWZsYUVaQ8SrS6NzQzJoLCAes/h0YXwG+zjayEd8muL/0R/KEb
         5hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494353; x=1695099153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snUK6IGdcPPH31oyrmWJb6PGm1SWgHHvAW8FtA1dRGY=;
        b=bIToiTZkgx+vseuprNDScmCQxM91TznyGkabR0cqHy5FMIg97E4Rf88kDteTGfN+nd
         KmtUXIcaDZeDtm0MullVD9h+QZLTbBuYDilGP/5oG2sKTPYNTLJYmA4Ns1ZUPeJoHv+J
         bh7gRlhOpbHF/Qhnrl5mSyqCiFYuBVyqbwWRTwE0x2yJFMC/Mgm4Cbii9cu6/Hd2E34Q
         8tBtC5fie+/Lyqiy08XrXgdPWai6FUsBnkboWQ29/iuZx8TvY619hZtIUW/7ytV5bTaL
         ezzwdJymtc6iw7OhCU/dwuGlW33MuOvwwHRUPAqUtrx2JvwUE/whjyU5ePoYiyqMQhO+
         8hTg==
X-Gm-Message-State: AOJu0Yxmc2fk5fq1TYFcJnXWeZ0veXl3FqS7uzIQq3q8cU85veYsl5SF
        OXHU7727eMrTMyiKLz4z75XAOQ==
X-Google-Smtp-Source: AGHT+IFPU8acqypJwJGWtWMHEWY4tPoDnTqyGjoIpvI9ATueUsR1/PPIgOlRCJv9LKZVFhbCP8k9Pg==
X-Received: by 2002:aa7:df08:0:b0:52e:585a:e9c with SMTP id c8-20020aa7df08000000b0052e585a0e9cmr8579509edy.2.1694494353384;
        Mon, 11 Sep 2023 21:52:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:33 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/37] clk: renesas: rzg2l: trust value returned by hardware
Date:   Tue, 12 Sep 2023 07:51:28 +0300
Message-Id: <20230912045157.177966-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Initial value of CPG_PL2SDHI_DSEL bits 0..1 or 4..6 is 01b. Hardware user's
manual (r01uh0914ej0130-rzg2l-rzg2lc.pdf) specifies that setting 0 is
prohibited. The rzg2l_cpg_sd_clk_mux_get_parent() should just read
CPG_PL2SDHI_DSEL, trust the value and return the proper clock parent index
based on the read value. Do this.

Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 1195d4b1f545..d0d086d6dc51 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -239,14 +239,8 @@ static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
 
 	val >>= GET_SHIFT(hwdata->conf);
 	val &= GENMASK(GET_WIDTH(hwdata->conf) - 1, 0);
-	if (val) {
-		val--;
-	} else {
-		/* Prohibited clk source, change it to 533 MHz(reset value) */
-		rzg2l_cpg_sd_clk_mux_set_parent(hw, 0);
-	}
 
-	return val;
+	return val ? --val : val;
 }
 
 static const struct clk_ops rzg2l_cpg_sd_clk_mux_ops = {
-- 
2.39.2

