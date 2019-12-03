Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A88E10F97F
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2019 09:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfLCIIf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Dec 2019 03:08:35 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37332 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbfLCIIf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Dec 2019 03:08:35 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so2453774wru.4
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2019 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0R64hlt7XwI/N3fKuGoKmEX8pew5cHbSg5pee7ssZ9M=;
        b=ACE03k+J3bQYPwGdDs/MDRbltZ5w+dOYRY4LzkdTknCOZD557nirzb765JXZ7FZ8Ul
         xv4aFc5ZN8JbbPfx/TescvxkpcO7bwV5Q8vW+IeHNgueM1NWrW7XVJM1r7A4LjDFK/k6
         E+si2lf4uiq4Az948pp/rkYSasS92LC/fdTWYktd/Qt/Y0yitT/ok2VM9yx5xeeUSkW+
         sLiRHq5pTyxiPkTvLa0o35awHgg8mNV27eVd/hm/W7aNs36bbOat00hLv8ycdIQ4Eahl
         t7VPgrfpdsHwLOOYOTIOq8nrR6GQT4WGjgqCDJt6/0/Pv7j+SqmKkyuyhL+uKqodPUmi
         8lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0R64hlt7XwI/N3fKuGoKmEX8pew5cHbSg5pee7ssZ9M=;
        b=eYQZ/r+su7ouA84tOTx2Skj0ZRuJLu1Qd6ScoispQ9CNi8xIRozZ5d3z4qCUTd/YoQ
         YB2xm/JiRjIVxOK0muSiRbEUKqX7wpQTS158iBGNqqeiQ15TwVSJbP1IssVathAdkAVH
         RXKlZe01AcMba12N3MRW1209Nf7GVu0q4rr/Vx3RGrbyzrAOww+kqJkYVPpuQ7TIoh4B
         Q+ZGhXkp1XQ280TvYZXoCRDTv5A7C0dp10/pK96rfpbmQmWoAW2NH4V/BjoLlof7AEWY
         1sAoWlktNRcz3Tah8tmrqpLUIMH8WTsepdF2f6pC+KsWAxIScMajfO8/sxFY137LCnSZ
         OQWg==
X-Gm-Message-State: APjAAAX3xflPGE0tVp9uLfn76hqpO2mDof+rGyw7TFZu25gzBa/M/rFV
        gpmtDindItAXMozHIau6u376wA==
X-Google-Smtp-Source: APXvYqz8AVR9cMm++hDehzZTHRh4xWczw0r4rSWNjQHKTYEvMNTRYnQzW4NwG/numStsR1+76rhwSw==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3569496wrn.75.1575360513938;
        Tue, 03 Dec 2019 00:08:33 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id w12sm2084204wmi.17.2019.12.03.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 00:08:33 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
Subject: [PATCH v2] clk: walk orphan list on clock provider registration
Date:   Tue,  3 Dec 2019 09:08:05 +0100
Message-Id: <20191203080805.104628-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

So far, we walked the orphan list every time a new clock was registered
in CCF. This was fine since the clocks were only referenced by name.

Now that the clock can be referenced through DT, it is not enough:
* Controller A register first a reference clocks from controller B
  through DT.
* Controller B register all its clocks then register the provider.

Each time controller B registers a new clock, the orphan list is walked
but it can't match since the provider is registered yet. When the
provider is finally registered, the orphan list is not walked unless
another clock is registered afterward.

This can lead to situation where some clocks remain orphaned even if
the parent is available.

Walking the orphan list on provider registration solves the problem.

Reported-by: Jian Hu <jian.hu@amlogic.com>
Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 62 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ef4416721777..df16a535e800 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3249,6 +3249,41 @@ static inline void clk_debug_unregister(struct clk_core *core)
 }
 #endif
 
+static void clk_core_reparent_orphans_nolock(void)
+{
+	struct clk_core *orphan;
+	struct hlist_node *tmp2;
+
+	/*
+	 * walk the list of orphan clocks and reparent any that newly finds a
+	 * parent.
+	 */
+	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
+		struct clk_core *parent = __clk_init_parent(orphan);
+
+		/*
+		 * We need to use __clk_set_parent_before() and _after() to
+		 * to properly migrate any prepare/enable count of the orphan
+		 * clock. This is important for CLK_IS_CRITICAL clocks, which
+		 * are enabled during init but might not have a parent yet.
+		 */
+		if (parent) {
+			/* update the clk tree topology */
+			__clk_set_parent_before(orphan, parent);
+			__clk_set_parent_after(orphan, parent, NULL);
+			__clk_recalc_accuracies(orphan);
+			__clk_recalc_rates(orphan, 0);
+		}
+	}
+}
+
+static void clk_core_reparent_orphans(void)
+{
+	clk_prepare_lock();
+	clk_core_reparent_orphans_nolock();
+	clk_prepare_unlock();
+}
+
 /**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
@@ -3259,8 +3294,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
 static int __clk_core_init(struct clk_core *core)
 {
 	int ret;
-	struct clk_core *orphan;
-	struct hlist_node *tmp2;
 	unsigned long rate;
 
 	if (!core)
@@ -3416,27 +3449,8 @@ static int __clk_core_init(struct clk_core *core)
 		clk_enable_unlock(flags);
 	}
 
-	/*
-	 * walk the list of orphan clocks and reparent any that newly finds a
-	 * parent.
-	 */
-	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
-		struct clk_core *parent = __clk_init_parent(orphan);
+	clk_core_reparent_orphans_nolock();
 
-		/*
-		 * We need to use __clk_set_parent_before() and _after() to
-		 * to properly migrate any prepare/enable count of the orphan
-		 * clock. This is important for CLK_IS_CRITICAL clocks, which
-		 * are enabled during init but might not have a parent yet.
-		 */
-		if (parent) {
-			/* update the clk tree topology */
-			__clk_set_parent_before(orphan, parent);
-			__clk_set_parent_after(orphan, parent, NULL);
-			__clk_recalc_accuracies(orphan);
-			__clk_recalc_rates(orphan, 0);
-		}
-	}
 
 	kref_init(&core->ref);
 out:
@@ -4288,6 +4302,8 @@ int of_clk_add_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clock from %pOF\n", np);
 
+	clk_core_reparent_orphans();
+
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
@@ -4323,6 +4339,8 @@ int of_clk_add_hw_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clk_hw provider from %pOF\n", np);
 
+	clk_core_reparent_orphans();
+
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
-- 
2.23.0

