Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541C21B5E8
	for <lists+linux-clk@lfdr.de>; Mon, 13 May 2019 14:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfEMMb2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 May 2019 08:31:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42107 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbfEMMb1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:31:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so15040716wrb.9
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mW2Fqi37nfrJWuA7Y78Xlr35mQpQP8Au1z+vEQpFR/c=;
        b=zpNEfai/ShFL9b9BqnxeB/Z0ueU/STT54nBh4jzNCSq8avg67UIuysT+FBIdpsciGJ
         fH+PJQ9dp/RC7UD4U5T30ILymLeLPSwMCGXbRrY5FXFhGMJXH/+xZrPQkS/NROWCtXPG
         Y7ljuoZE9vGoccHwsjUOCzX8dVYDO7DZe8QJuNXNCAPU66G93Qz+KX2xdn/T7cRrxtNc
         8oB5kEqR8RaHUs3dERDJiu2eG5YGccaZMM0q08ciUhiKKYmMbNuj7N6p3ewMaIvPWP4C
         DeWdKERkqxW3JlXFcHB6roMjM7t/OioSCWUmH/ADLTHh0+Plh+vhbwRRRN3wuazodw3q
         8xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mW2Fqi37nfrJWuA7Y78Xlr35mQpQP8Au1z+vEQpFR/c=;
        b=bREjw7HYorB58PCX1nAXOZ5xz/QtsgeEz46QC9UR43ZLdazCvmIuTtPwr7uMs86Q5p
         WjLAHx2XdhCUn8Jb+L1ajHy15W6hfvv4TBFCQRKbmKIWlcw4LtR305Pj3IxTkkq8FCPK
         lz+kVytREaPxveibB0gd3YOmBUxHAv/LvydKNcFbYfLroLafKXCE9Vuvni2Xn+iT7iRl
         ZI7wky9YE+ZfU/83eTAYJOaEvz3g64KHARfX2QFuDeu6PTXTxQ2H+yYESdek5gKAvKBA
         7H2hwLxm0/RbPbQRfdbHJ3z24z6I1jN88Xyh8RsKwuZE8/8HeEF/PF4KmGkp3O9qjQdM
         iJlw==
X-Gm-Message-State: APjAAAVruxXMPSAzLyZmOpWQNlL2RW2gNnu1sJ/o8m9/tOAX/LOWD3x9
        vqfElsPA2c/AkSYs8SPtsbGb0A==
X-Google-Smtp-Source: APXvYqzMT85oqFabMAnmREk8mC5CwV17opJfsoHj/As/U4QV+LoR1dwrkdAtQjJSAYM8uOuBfPWaiw==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr18014405wrj.66.1557750685310;
        Mon, 13 May 2019 05:31:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:31:24 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] clk: meson: gxbb: no spread spectrum on mpll0
Date:   Mon, 13 May 2019 14:31:10 +0200
Message-Id: <20190513123115.18145-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The documentation says there is an SSEN bit on mpll0 but, after testing
it, no spread spectrum function appears to be enabled by this bit on any
of the MPLLs.

Let's remove it until we know more

Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 29ffb4fde714..dab16d9b1af8 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -679,11 +679,6 @@ static struct clk_regmap gxbb_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.20.1

