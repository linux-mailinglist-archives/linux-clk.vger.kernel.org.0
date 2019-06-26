Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7FC456547
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jun 2019 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfFZJHk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jun 2019 05:07:40 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43469 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfFZJGl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so1752844wru.10
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=EOIDTbSRmHPt/lFJvqYWsxI4pCg4Dy45ntsrrp31zEPhOT03iRH3/jj/+1rogovQ67
         NfjLB2W6EYnIYpDdLL9uCHUB0IyHXlPgD8/DxDTjtFcCd9Jo0zNs9K74n3aMIuRMrsTM
         qOr3PdCuf1nS8zWejXEnvxM3cwTfNnMjQ5m8P2QwHnXzYrgsfac8mYdLqk47BYfChLEu
         SYydOMncB/OrY/E76Su6Y0BpV2DOT4JJcO4hz/DoDnLdIGx8cvfPjBib2bQx27yOU/sE
         tCVV60jH13P9vnamKEDQzkLqltVVWmMY1hBbqNr6y0bKUcQPvL5JIVOneYSQTVJ5f3HS
         PyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QF6xtFv2zQ8ZUqjO9Cs7FIQcWQGqk9AuakROnInyaSE=;
        b=W4vSHDbmkqZO8UhUiKrj/cFWg2ZzZGp/MFuc0K7ZLlOE/lYOjGCpEcroormuNAqKWh
         OZ+xE2N1sYH0ZYOIBMQxXMqTtATXku0Gy3T3dpSo5cckMDl6GS+YhUJI1k5PB9qd/i+W
         NVO/Zlb03MFRLVAQi4H58paZCNX26DZEVntBjdQs8JwqBDSdp1EwOqCe/W4ybzxdvYy9
         OgWM4cbKWUFU1DVBnhnCiF5jAVvEfl8mgR1IgsDcYnIPJ9yl2iookLcT2qyee9224iu2
         T/rJR/nGrm/PV62ZifA4LUpJzYXUOTCelt7qmVINrPOi0z6gS1tGgY+CJyTLdFfmoEgU
         bZnQ==
X-Gm-Message-State: APjAAAWck7oYiGGujsYRf9OEEUIMKQZmoltHdM7U/f4d9WUJ8C1vvsqJ
        BgSd2aTJa2M4toAvgpFxL7uXrA==
X-Google-Smtp-Source: APXvYqyOJTQLTQr5UOlvihb2uvDm1M8Bu0G5R2D6gXBw7OAcDmhWQNRUOM5NXcNu+psXLHm/tUm3aQ==
X-Received: by 2002:adf:afd5:: with SMTP id y21mr2687630wrd.12.1561540000020;
        Wed, 26 Jun 2019 02:06:40 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:39 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 03/14] clk: meson: regmap: export regmap_div ops functions
Date:   Wed, 26 Jun 2019 11:06:21 +0200
Message-Id: <20190626090632.7540-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
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

