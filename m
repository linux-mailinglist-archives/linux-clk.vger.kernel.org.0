Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D08A4AD930
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbiBHNQo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358161AbiBHMlH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:07 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1CFC03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:06 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n32so18629196pfv.11
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3RinXQyHKb00TzypPmHwtAZLN3N95NjRwsCDNBAlwr4=;
        b=YZFeequlV6N1Zm6zx7AjhJ88s7J6s6lm6hq4eZItcgFo8pOMuTMvZ3hzVnj93mM/dX
         wFnDMu6mWWqvp29XUfzBr/4uMQmuOz5VTOtSzqPo+a2U6tTImCdnPb+fMYPH/Zv/Jw9S
         1JOy9pLaEPyxVRAAQJ5IQs+EJiibHDKam75NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3RinXQyHKb00TzypPmHwtAZLN3N95NjRwsCDNBAlwr4=;
        b=aIfyJhEV/mMXhwga62ErxBEFxcwFCI6qhev6P7lRGj/F8Tm0beUQ9zxkvfV+A1Vhn4
         zOTgHgrYIIDToeLwFajtOyOHtYJAO6MjPa78m/u07aNciVXcb47vK3E4o13ciDmgJD3c
         bb9gDccJBm1Hhfjo1hp5FQQFQmZkHI30v1UWuKbtgWxbfa+jECkZC2p/74PtIzDzA+ul
         +a/xOoq5YnhKHs971efwKrt/O9Ur6x/SWN6mVxoMp/Olk//LWGy2gRkZCpPz/9rlq0Fd
         1q/0GZevtjffUU5N6vEcDcFp/TgR9lIbhsJ8/bM7bpsXewoYEUPahVHE33J0+a0IVmKw
         kNwg==
X-Gm-Message-State: AOAM532K8cTZ/JElVFPzD0yb/gfnFVzHDAFBhPPJS23U26PAKQ9J5gD+
        S2sBah5XwivMPjSvL57c0kQOYA==
X-Google-Smtp-Source: ABdhPJyVR6nI8dkkBw1DN8QU+KXFRS3jfBjQoqHIXzT0wpt+HFO/COZLgDxQ8jisVm0UKOLWRVS5qA==
X-Received: by 2002:a05:6a00:d72:: with SMTP id n50mr4229384pfv.51.1644324066273;
        Tue, 08 Feb 2022 04:41:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:06 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/31] clk: mediatek: cpumux: Clean up included headers
Date:   Tue,  8 Feb 2022 20:40:11 +0800
Message-Id: <20220208124034.414635-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some headers with the declaration of functions and structures aren't
directly included. Explicitly include them so that future changes to
other headers would not result in an unexpected build break.

On the header side, add forward declarations for any data structures
whose pointers are used in function signatures. No headers are
required.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 3 +++
 drivers/clk/mediatek/clk-cpumux.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 344c6399b22f..658aee789f44 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index a538f2bbef0d..b07e89f7c283 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,6 +7,10 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
+struct clk_onecell_data;
+struct device_node;
+struct mtk_composite;
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.263.gb82422642f-goog

