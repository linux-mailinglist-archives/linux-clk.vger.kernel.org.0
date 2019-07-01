Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42125B7B6
	for <lists+linux-clk@lfdr.de>; Mon,  1 Jul 2019 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfGAJOR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 1 Jul 2019 05:14:17 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34269 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbfGAJNP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so14076679wmd.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=lIYZhQL3jTzMkEXGBHTejQuEo2Wg6Z7RjfFgI4uYHafubWHGXRc6G+3127Ldq9Aj1b
         DGM+VLYAo7oKAb+SM81qnIo8he0wpupHrxH+YJ1bu32D/udLAkQHUGXDCMKNkiwztdmr
         UL1t/r1dxSb7cPCvGnE2yL3ZPEBPkcivM+DmX8myy2McJHzaa2T9Fm8m42TOt5j5q9/7
         YKxjVrQD3XhAkTr+IXcWmgW+XxJR5OvgmBKrZnFG2XMJXkFXuuoZCsK9NAYps93yG8t8
         nRDiYAz8hiTqPaDXGfSF6MXla2iU2+7NE4SbYalzr0mDioFbl9yyPpAcaN7IF16ReuVy
         bcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=jWLbkxZ2Z5OGff1a/SaJ5LvYHEoDV/AxweCu4UFnJZEoP4WtN1wam9yV3pwg4/fyP9
         ImLEZdvjSWKfuz062EaR78rl5P7P0jZIeeHIjgFoClpTKTT01Dh5MQSyoDoSnDKxfnm9
         vdlVrIqBOzJSzTAbvl78HR/T+Olz9CdPwvluYzUE2xDL/WPTTglIPeVjTC/mmWGCvDth
         pWQHKXZb3mkUrF4uKH57E8JPD1jsXRMh8LMK9OSPRnsGR6AKo/z3U1/3d7QkAJQaKfP6
         uQyXwb3bXQNvvL5PNopo2DtGcMskvsj0quIzzTdaU8D09JZCMMLynzitybb5F3Hd3wY2
         deLw==
X-Gm-Message-State: APjAAAVI9pvbN+AFVY3CgOGk5TJ6vVINP+f7Xi5npFaEBFqSgfxl7mbg
        pihWNrPEDdx/1NBX985lvxHb1A==
X-Google-Smtp-Source: APXvYqz0R1Me131hk3YNR44WqrLF91l40/ePDko2bzhUb5OlZVcim0JviXo7HbsXJhGIuvbExPl9Cg==
X-Received: by 2002:a05:600c:240e:: with SMTP id 14mr15893491wmp.30.1561972393857;
        Mon, 01 Jul 2019 02:13:13 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:13 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 03/14] clk: meson: regmap: export regmap_div ops functions
Date:   Mon,  1 Jul 2019 11:12:47 +0200
Message-Id: <20190701091258.3870-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The G12A CPU Clock Postmux divider needs a custom div_set_rate() call.

Export the clk_regmap_div_round_rate() and clk_regmap_div_recalc_rate()
to be able to override the default clk_regmap_div_set_rate() callback.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/clk-regmap.c | 10 ++++++----
 drivers/clk/meson/clk-regmap.h |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index dcd1757cc5df..26c8c74a8cf0 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -56,8 +56,8 @@ const struct clk_ops clk_regmap_gate_ro_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_regmap_gate_ro_ops);
 
-static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
-						unsigned long prate)
+unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
+					 unsigned long prate)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
@@ -74,9 +74,10 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, prate, val, div->table, div->flags,
 				   div->width);
 }
+EXPORT_SYMBOL_GPL(clk_regmap_div_recalc_rate);
 
-static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
@@ -100,6 +101,7 @@ static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
 	return divider_round_rate(hw, rate, prate, div->table, div->width,
 				  div->flags);
 }
+EXPORT_SYMBOL_GPL(clk_regmap_div_round_rate);
 
 static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index 1dd0abe3ba91..d22b83fb9bad 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -78,6 +78,11 @@ clk_get_regmap_div_data(struct clk_regmap *clk)
 	return (struct clk_regmap_div_data *)clk->data;
 }
 
+unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
+					 unsigned long prate);
+long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate);
+
 extern const struct clk_ops clk_regmap_divider_ops;
 extern const struct clk_ops clk_regmap_divider_ro_ops;
 
-- 
2.21.0

