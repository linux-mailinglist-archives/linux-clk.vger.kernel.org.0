Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCBE4D139
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2019 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731943AbfFTPBa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Jun 2019 11:01:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37465 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbfFTPAZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so3510353wme.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=nSkCypdicbMvzFde8ADW9XsWBHulHw3kmRE8NVsSDhiNU9QV9y34VQOdlTCfxpb+sw
         X+G3BrQTyvHKj7eQwbrTOepLT7WcjxFVj3A5M89EbKEa9Axioltwu5qzvF9jTkZ8edEN
         Q4Mv0UdlWa6iOfYosGgzfWMkKj04C3u5usJyfcuEUJWvXRSl8+P3pKsmM3bAyuVPVeD2
         kxXfFRjwB47pasGLL+C+A5Qa3ZetS84bsJOjMy1giV4UjPZX6uZubJnzIIv4x86hxMUp
         3TIBs5eImSfag7zw6MSXwlV0hnojcV3godzRrRFFRaH5+Voy92CeN5TMVbfUTwHPTiO9
         DNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=gdiDSbLG9QhTNh924NixyoDosciw4I4d7afJH6FdpM3daLq3ZjDqDsg1NUTdxw/VdC
         +uLgqG+TUeAXbdplCJ6JbvR3wtSzGptXGzcCpT2oiBz8CMTC0TIqdumElsOSPNmiXxJv
         LG6kghzLl+U6d3PGst2fwig1Kjz5KdzosbllNfOJee7a4pCpC8zDl/fXn/hJU2poHdX7
         cQnN5CMJ9Qx/Iu8Cl0IdZRgOF7dscwTpcaQMDUkCYhRJQdvuI46BmmT6x1zV1LptOaYP
         CorsV7TLEGj3DwlCvRnFIC8AncUHF3Yknspsw3cIJ4Z73u6DFZtm5WCWegyLSSR7hiKv
         bB6Q==
X-Gm-Message-State: APjAAAVb6786gQ09RaBBJklZjB8m6gohvots7BjkjJBYnKhkQ9sD3MzC
        6YWKyw4N5W5KNEysKcxAlyAY/g==
X-Google-Smtp-Source: APXvYqzjmqHVz8xwAG831JB73JOZR/BWWaiZvTceHova+YlkcqDqCYo2mGzLMMF5bUKcnzoT/ZYDHg==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr52731wma.172.1561042823556;
        Thu, 20 Jun 2019 08:00:23 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 03/14] clk: meson: regmap: export regmap_div ops functions
Date:   Thu, 20 Jun 2019 17:00:02 +0200
Message-Id: <20190620150013.13462-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
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

