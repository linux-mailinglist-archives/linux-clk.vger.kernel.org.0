Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF23E1B608
	for <lists+linux-clk@lfdr.de>; Mon, 13 May 2019 14:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfEMMcQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 May 2019 08:32:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37216 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbfEMMb1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:31:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id e15so2656930wrs.4
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
        b=iEprL8LWLl8A7xh4GNvz6+BTjvOd9OUeQARGtQ9hS7GYQo1sxl11GkNZR52DmtjVuT
         x51TiXeHsXOTs1GC4jh1pQDR7W85s+mr/FJDkLPXxXa1PusMELawFwZ5GTMZk2NppEdW
         4oSDKD+LCIBbVMe8a0I6PCte3y2oXxY6/7DLQr0jr3m3uizO4k1Hhq3sMF+IAWDEG5aP
         Y5AutyjcAZHFBo7FG7MCxTJzJSShgHGG1XGn25I1wHga2cMvt3XWE70w9xm8FecQ8ubX
         nPjEHAGb9FQpFa6oCgrFunTJrvxffo8a6mXcPd/8VJcW4nNPOGcEfSnvywbSQHMY5qxd
         y7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
        b=PUZfR7tW0gSJtZJaJdKbtHDIEvg1CZTbgIkpqKs1VwfT3F9A1lExeNEYC8fqDZFw1S
         TfoT4f9kpbRdLVr1A3ztToOoeISWktv4G3tg/mB+azmr3yJF79lwVfdJcdB5/gs9FVKS
         HpXN1PR7Oa8h9AtgcH7mfjGquaq6PHR0Uf/CVh3sZjNASXxNoVZgflzPhrJQoi66wYRM
         OjHDy6B1fre67tUuD9nEwvvBeAhC0Wyy3l4WFe42UQg32YRUbvLu9SpE8tvknxumFYLJ
         JsPCEnMUzuk29utuGSAc4iVGivNuk/4a8Z7W3VM2XdmWpYAJFzpva307UZ8btmUHeVyB
         SBtw==
X-Gm-Message-State: APjAAAXElp9Bnis8K/2eoH9OdYNuS4VbyTW0WfdFHh3M0TG2CwLsbX1G
        Eyg2Fu9Uvaerxigkv7Qu5oPt4Q==
X-Google-Smtp-Source: APXvYqxuc8ne4IV9H9oYDb0Z1fLfW2O4+EU4VQcyb6N9zPS21Am/DW97B5/RB95g9ame4z2qq4dViQ==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr18367933wrr.122.1557750686306;
        Mon, 13 May 2019 05:31:26 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:31:25 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] clk: meson: axg: spread spectrum is on mpll2
Date:   Mon, 13 May 2019 14:31:11 +0200
Message-Id: <20190513123115.18145-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After testing, it appears that the SSEN bit controls the spread
spectrum function on MPLL2, not MPLL0.

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7a8ef80e5f2c..3ddd0efc9ee0 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -469,11 +469,6 @@ static struct clk_regmap axg_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 0,
@@ -568,6 +563,11 @@ static struct clk_regmap axg_mpll2_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
+		.ssen = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 25,
+			.width	 = 1,
+		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 2,
-- 
2.20.1

