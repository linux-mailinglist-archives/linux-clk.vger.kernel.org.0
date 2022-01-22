Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A14496B38
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jan 2022 10:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbiAVJSP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 22 Jan 2022 04:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbiAVJSA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:00 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A1DC061744
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:00 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id e9so10274934pgb.3
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nd/CF8vqUX0IATJQuscxS8huseCWfTQmqbhI4UY9O64=;
        b=KVC2hzrkkazjCViKrnLOLBAg7/PZhZuW5n9ZbxaTdZNc2UauGmE3xhUVMdsM3+gF7P
         5BINxyVk+h4ChrIE0lwrtNomRSDTXyw59Ab+fEt2P3Mx9KQwMf7/dy49G5HR1+ZLEFWL
         Hh+vsa23bWhFlOaOnSJRCnrXlGcXx0JP+09JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nd/CF8vqUX0IATJQuscxS8huseCWfTQmqbhI4UY9O64=;
        b=fVuYA0tbCdJgudiemKpcXPUT0mmFtf31yVCJDHtRtBnkQ3DzAtPXwzG+Bv2NOloQ0s
         L0nlQCTI8m1nNcTf81CVEOq1g9GMpTyGuuIcPKWyq/1fwnV8dkHaMW3ERs0oCjpQdu7F
         uhCEz+NZ5n8kU9fYj61ErSdzEAVEm19dse/gGmQ7xUuCsrK2KIB30uCq7Vmbo4/H+HtU
         6pgV/ZpkCCmkCp3Pe42BP4psGlgF6zC6fumoOto6dnQOsgolED6uYZQ1m+TOq6+C+zdg
         ajEBAjaa8iqcnMpgnMDJ6pkBTtX08xNZmBkqtRASWBTCheVznTnf3hO5dl6KhmbbgMCf
         sIXA==
X-Gm-Message-State: AOAM5305NurBYfiCMHHXYMbgWXpPgtSPdUdv44OJBktlKEPB4Hzkojx7
        PML4YeP7jX7WYEmN+2NI6kDzDw==
X-Google-Smtp-Source: ABdhPJzd4uJC769zjxpDoJj+Uzr12VPezjLug+Z4gJO2U3vcZi3VyPGrSQvRsXfDx9Fr1H4uSYC/1A==
X-Received: by 2002:a63:3509:: with SMTP id c9mr5401711pga.332.1642843080226;
        Sat, 22 Jan 2022 01:18:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:17:59 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/31] clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
Date:   Sat, 22 Jan 2022 17:17:07 +0800
Message-Id: <20220122091731.283592-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

struct mtk_clk_cpumux is an implementation detail of the cpumux clk
type, and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
 drivers/clk/mediatek/clk-cpumux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 99a819e3673f..344c6399b22f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -12,6 +12,14 @@
 #include "clk-mtk.h"
 #include "clk-cpumux.h"
 
+struct mtk_clk_cpumux {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	u32		reg;
+	u32		mask;
+	u8		shift;
+};
+
 static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct mtk_clk_cpumux, hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index fda7770fd803..a538f2bbef0d 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,14 +7,6 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
-struct mtk_clk_cpumux {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	u32		reg;
-	u32		mask;
-	u8		shift;
-};
-
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.rc0.227.g00780c9af4-goog

