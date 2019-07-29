Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FE678C93
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2019 15:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387429AbfG2NRD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jul 2019 09:17:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54293 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbfG2NRD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jul 2019 09:17:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so53794993wme.4
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2019 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilNgiDVSmGak25pg9L0wagvtwRSAZxVDdm8Be33Ze3o=;
        b=Wfz6C774D3WcLjVSRjjQ9Lw6OAiML+fgZ8SRO9mkuLL3Gzg4MPG1wMAJOBhov2Q2BV
         PIgPQfA7tWuphF1Vx2YdRRrTQU+oZU6Ei2Mx+31nEU93c6KlukMw3bv6jtwjnA6WxOJd
         pxaG8IXHlrJjHAWA5Bv3mNNvJ36r8AgsfIgq2zKOOlZBj4yvhdEek/isUR/HhUxe1A6F
         9Tua4I1IPVpvm1aq/GUu4dyAOpFcpxGBnEEg6oNcLhFWYR5I0KnP6jGS6Nc1DEZ0FcO4
         SxDRZYkCUrrh2836Vcvs3RMfmZqivsJraN2vozaJk7mOJAlZpkendo8TlYJGAAa9tq0q
         chOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilNgiDVSmGak25pg9L0wagvtwRSAZxVDdm8Be33Ze3o=;
        b=a/4MCBmZlBoWDVwz6GaY/q4WHw7w8KSBXYX7EQCinZNunqUoDbTq1aSf8T0KfiN/4P
         IWz3Qklj88iMEY4a6PzTOE6FlTXy368h/ckDNIyzsejPmbGxGLlhtAAmx38uflv711tB
         VszzflkGgSb+OCylbjjZocRh6aCKxyxyl6rMluwGBR9drN3Q0d78he3dyZvmDtpzinfr
         c1Cojh9DEoLLBJUiV6BfUGibatRO4FzjXGfdS561Dwp1RAi9NoyHy4c9InCVzXxVoss2
         SqVYZ752Wei6gcg4V89+gA9M8cqw6RYVpc2YiHEGfl/DvFF3vv91mwGpOaFtBSD6h/rb
         eHsw==
X-Gm-Message-State: APjAAAWDeHP59lQepZo3VOu4Q1gHl/AC/qNznepHQsB1BO2DdHwpDgKk
        leRF7oAI+/FsSk+3bcJoGHH57g==
X-Google-Smtp-Source: APXvYqypMagpK7Rn4o7xdy8pV2mv01YyLBmCblc0Qt5Jzfp6qN3KU/2uEbRbZnALWwoGiWLw3SxERA==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr102925593wml.77.1564406220768;
        Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.17.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] clk: meson: regmap: export regmap_div ops functions
Date:   Mon, 29 Jul 2019 15:16:54 +0200
Message-Id: <20190729131656.7308-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729131656.7308-1-narmstrong@baylibre.com>
References: <20190729131656.7308-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The G12A CPU Clock Postmux divider needs a custom div_set_rate() call.

Export the clk_regmap_div_round_rate() and clk_regmap_div_recalc_rate()
to be able to override the default clk_regmap_div_set_rate() callback.
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
index c4a39604cffd..ebf776a32ce3 100644
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
2.22.0

