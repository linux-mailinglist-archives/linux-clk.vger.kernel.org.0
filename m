Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF0317AD8F
	for <lists+linux-clk@lfdr.de>; Thu,  5 Mar 2020 18:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgCERv4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 Mar 2020 12:51:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35320 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgCERv4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Mar 2020 12:51:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id m3so6715373wmi.0;
        Thu, 05 Mar 2020 09:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BZSOJBgcimoBgBJ5lrJKivjNgXzUtIz0eNwDLrnQHM=;
        b=JLTzjEWcmz/8Exyc6lyH2jIwgYgpuEYvQj9Dat03ePIsz+9jdNbssvjdrVCw+DFRRv
         RBGz31/Qf10CnLqM0wmWkUMV23zX1xPGXL6l2A5HGW0fHrm8imt0iU7NYGfuVxiimeoH
         Ihmz2VGBp71rwqUXAmTatEZs+nEf7cYwtkUlEI22bh2hSHVgh8TwcWRA7lhv0esgk852
         qNmBmUgzBowdva61M4Xi8/NjfeZweN8ZHeuhWATwRNNQSUuFrJpgZCt1xiLXu7MFz1Z0
         AXNjicE6RbUwB3Kjo7l2VSaVv1KKaWLCr5gvjMzT7Hn3NZ5aRRNUjWpCRRTZhIH7xFq3
         XbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BZSOJBgcimoBgBJ5lrJKivjNgXzUtIz0eNwDLrnQHM=;
        b=N5mkf7c4JiSMA42wcY0ZHuBOYYdu1N2J9isMefuPl8yFYrjHG1iDRxjSth/pQvnoBx
         zxUaqLpbjnAeUjuMuZT3VielR4XXJTb7/EslyKjDhAKQrP8vpWOsFg4vfXBJzgnycJD7
         /9qBX8jW7fjlbsa4mg24hbol7ruOq3WRv9WnVJ9Pfvc/Mw/7I9+TPcAKe9yC+YaZxZiz
         UvyguSJze35uL4GisPLwdoCCmpGQmMFHQY4XCVKu86OVgmlDAnOMscv/GaXf7+iWZ2xu
         JbaiNkWy5z6xU8iA2y8UDRBQnJP8UrjpAUIjAR4RmaQTI2yIHnIgtoRDMhCNbMCKgn1i
         +tXA==
X-Gm-Message-State: ANhLgQ3oz2K+j6jF7G+cHjFfMARYObs4Q6FGc8w4LeLHVynWR/4gEZEm
        hQnt69ckpvFCTSHNuodv8h+uyNFq
X-Google-Smtp-Source: ADFU+vt+UFVGaeXqjATu2pPElypHdDhZ4uGH9QN4t8EuNkd61VEJEossz/dnnbIaubj+Y/ijaE8yfA==
X-Received: by 2002:a7b:c939:: with SMTP id h25mr10717851wml.106.1583430714747;
        Thu, 05 Mar 2020 09:51:54 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id n14sm1221706wrs.97.2020.03.05.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 09:51:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] clk: Do not recalc rate for reparented clocks
Date:   Thu,  5 Mar 2020 18:51:38 +0100
Message-Id: <20200305175138.92075-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As part of the clock frequency change sequence, a driver may need to
reparent a clock. In that case, the rate will already have been updated
and the cached parent rate will no longer be valid, so just skip the
recalculation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/clk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ebfc1e2103cb..49d92f4785a2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *core)
 
 	trace_clk_set_rate_complete(core, core->new_rate);
 
-	core->rate = clk_recalc(core, best_parent_rate);
+	/*
+	 * Some drivers need to change the parent of a clock as part of the
+	 * rate change sequence. In that case, best_parent_rate is no longer
+	 * valid. However, reparenting already recalculates the rate for the
+	 * entire clock subtree, so we can safely skip this here.
+	 */
+	if (core->parent == parent)
+		core->rate = clk_recalc(core, best_parent_rate);
 
 	if (core->flags & CLK_SET_RATE_UNGATE) {
 		unsigned long flags;
-- 
2.24.1

