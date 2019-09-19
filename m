Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF7DB7668
	for <lists+linux-clk@lfdr.de>; Thu, 19 Sep 2019 11:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388820AbfISJgd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Sep 2019 05:36:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52478 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388756AbfISJgd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Sep 2019 05:36:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id x2so3599754wmj.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Sep 2019 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ve+wzZh8jIbj36VSXYKI7yL2XeCKd4lhGJ7BfZhWHhk=;
        b=oNG10dYrCbn1pG2d0FdlS4/80H49wI5hR3HIWwCnhqqjA62jSItQNspBjzxvSMedTr
         4q8EAzYaQHcdosVIBhH6EkIz97rHE3T2imgWxPw+AJbGfy+/3bFQWAssrFRGNQyZZxws
         BqcbL59e6P+hICngHdTLTNZQJxf+Kigt4Arc8y+Zy41JmjnfhoGqIfb0KaDnvFaZc1te
         7zkGKrqNzp10j43LIeTAazbGfmtTUShsFgb11nRienzG70jNMu2lh/L0WmRaiY+zrNQC
         cECvYUo+1KTMaRsTURjUfLEAVXk7x+cvMRG9mqFeUaTb4mCSQrwEBkE0bVLHhhe+9x3Z
         Xk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ve+wzZh8jIbj36VSXYKI7yL2XeCKd4lhGJ7BfZhWHhk=;
        b=Yi88fBMGtyXW3/JaQHAL7nessl0ppmzIEKsKZT/O0XiYBPEAFcNnpvjpR1tg/8IwfW
         mesWZostKhLXO6d7jLXTqU7tPNv/B6a8HuXS/IFvqeWVS8U4w1kIlxnC2DKxL/+V7fkr
         QeQtiCOLIgMYrUMXIeX3C95oyUMe/hn9qe06JWFn1dklhJdOvYMdCDa2b5qy+PHKhlH8
         OHtqOfZ+HIoDfZj9AmKgefDNXb8JAWhl3etmM5IjxxlHtIbGo/C5JlqauUsylpf52zHd
         jwshW+4PjpQWWjWCUc9Cx6DkDAauO191fsqJVz0d3XU+iRdF+mVmCZvIC3Wnm8qUm/5g
         /Lkg==
X-Gm-Message-State: APjAAAW9QLNaJMAv+PQpWAu6O3R5JUOw162wz2aVRqvXRxZ0zj7EHku/
        KZKKAne4WkEuc7HllZbZ53/+YE04a0mnuw==
X-Google-Smtp-Source: APXvYqz9sp/AaYazMI2H4L0eBMS1cnM6EY4+65T2+0n8IFCg9CSZgaPu7/ywo3hsKzx2hiNglBB29A==
X-Received: by 2002:a1c:c589:: with SMTP id v131mr1915621wmf.163.1568885790845;
        Thu, 19 Sep 2019 02:36:30 -0700 (PDT)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id q19sm16701186wra.89.2019.09.19.02.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 02:36:30 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes
Date:   Thu, 19 Sep 2019 11:36:26 +0200
Message-Id: <20190919093627.21245-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919093627.21245-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When setting the 100MHz, 500MHz, 666MHz and 1GHz rate for CPU clocks,
CCF will use the SYS_PLL to handle these frequencies, but:
- using FIXED_PLL derived FCLK_DIV2/DIV3 clocks is more precise
- the Amlogic G12A/G12B/SM1 Suspend handling in firmware doesn't
  handle entering suspend using SYS_PLL for these frequencies

Adding CLK_MUX_ROUND_CLOSEST on all the muxes of the non-SYS_PLL
cpu clock tree helps CCF always selecting the FCLK_DIV2/DIV3 as source
for these frequencies.

Fixes: ffae8475b90c ("clk: meson: g12a: add notifiers to handle cpu clock change")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 33c7e04b4a82..b3af61cc6fb9 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -343,6 +343,7 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x3,
 		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0_sel",
@@ -409,6 +410,7 @@ static struct clk_regmap g12a_cpu_clk_postmux0 = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0",
@@ -465,6 +467,7 @@ static struct clk_regmap g12a_cpu_clk_dyn = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn",
@@ -484,6 +487,7 @@ static struct clk_regmap g12a_cpu_clk = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
@@ -503,6 +507,7 @@ static struct clk_regmap g12b_cpu_clk = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
@@ -522,6 +527,7 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0_sel",
@@ -567,6 +573,7 @@ static struct clk_regmap g12b_cpub_clk_postmux0 = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0",
@@ -644,6 +651,7 @@ static struct clk_regmap g12b_cpub_clk_dyn = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn",
@@ -663,6 +671,7 @@ static struct clk_regmap g12b_cpub_clk = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk",
-- 
2.22.0

