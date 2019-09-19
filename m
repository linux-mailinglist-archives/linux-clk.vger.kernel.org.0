Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C93B7750
	for <lists+linux-clk@lfdr.de>; Thu, 19 Sep 2019 12:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389216AbfISKZ0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Sep 2019 06:25:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37889 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389199AbfISKZ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Sep 2019 06:25:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id l11so2505069wrx.5
        for <linux-clk@vger.kernel.org>; Thu, 19 Sep 2019 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQH3sxdCSDhIfGdbCjdRoLM/sLLm5iODyAbQ5C/Ltw0=;
        b=E+UHiJSGEVWW51Mla00YaqY1xV4mU3Y+5rJsa4CDkZOUugcHeGYU8NUsvjyGdh1Y9W
         6ARRrK0ebicbUwvDp1hlZN1n7QfctXKyAu4DzKH5+41QbuAvDnrH33FdTGNAFkSJvfLy
         QM3+A4NxjDFI/AEFwzPmTTBsJZuL/7hvlJu+Vf8r89v9tYTyaECETWLTqQFVOI9fDTz6
         jp3aKuYmkkDyi97/DKgrXUPLbOji6zSqzZFO5bhxbSC7m+BZtVgnQ7VgA2ecK075aFiW
         fC7vMa1LtUIZ2tLG8H1NDl9Y2sjMBKz05YG90pNkgwuuimMWh0mQX+blFA/9c8gYS99O
         ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RQH3sxdCSDhIfGdbCjdRoLM/sLLm5iODyAbQ5C/Ltw0=;
        b=kv/NdY9OkNvdPLK0XaFSfUUYHCNBgXBr/Qwk2pAmZWTxCbq0hwLRaPhoxrnT553hLb
         hlTefSSFBnVKMiY4RVeP5ScRv0hWLehOSnIzpibuW48MMTZbsjtnkv/c0+2Bvy2m/0Nc
         DXcwSwZvlEvsJ5jnIn4pFVL7yhjbi7SNGepcht5RUqqJjcOBnz+jo9dXLzt+IPSaqePa
         0iJy94pHnbPCNeHTT3S8A8Wo5eLfD96ZiYT3SvfbgjkdUkB7c53oI9tBvxHMF34URujS
         PEI3fORi3DSvv0NEKWjqyA+4DeM2exp/1XOmYCCQukRot0v2B3E5ihP8eOtS+kHnPXf/
         wt6Q==
X-Gm-Message-State: APjAAAVuHIL72VfHa7bANM/+Te8MMGLsB2LGtTACqF1uLu/LtdNcRIpu
        GzSx9+kyfQtUCXmARXoYzkUw7A==
X-Google-Smtp-Source: APXvYqzSCZ+aZ9oAmix9jsUH1YYSrCs7/6e+ESB8ntGfVta/Je5txD9GnmfCeBCpuCV6nDG/Eavdjg==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr6749982wro.288.1568888723655;
        Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a18sm19542000wrh.25.2019.09.19.03.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com, mturquette@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/2] clk: introduce clk_invalidate_rate()
Date:   Thu, 19 Sep 2019 12:25:17 +0200
Message-Id: <20190919102518.25126-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919102518.25126-1-narmstrong@baylibre.com>
References: <20190919102518.25126-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This introduces the clk_invalidate_rate() call used to recalculate the
rate and parent tree of a particular clock if it's known that the
underlying registers set has been altered by the firmware, like from
a suspend/resume handler running in trusted cpu mode.

The call refreshes the actual parent and when changed, instructs CCF
the parent has changed. Finally the call will recalculate the rate of
each part of the tree to make sure the CCF cached tree is in sync with
the hardware.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk.c   | 70 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 13 +++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ca99e9db6575..8acf38ce3cc4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2557,6 +2557,76 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
+/**
+ * __clk_invalidate_tree
+ * @core: first clk in the subtree
+ *
+ * Walks the subtree of clks starting with clk and recalculates the parents,
+ * then accuracies and rates as it goes.
+ */
+static int __clk_invalidate_tree(struct clk_core *core)
+{
+	struct clk_core *parent, *old_parent;
+	int ret, i, num_parents;
+
+	num_parents = core->num_parents;
+
+	for (i = 0; i < num_parents; i++) {
+		parent = clk_core_get_parent_by_index(core, i);
+		if (!parent)
+			continue;
+
+		ret = __clk_invalidate_tree(parent);
+		if (ret)
+			return ret;
+	}
+
+	parent = __clk_init_parent(core);
+
+	if (parent != core->parent) {
+		old_parent = __clk_set_parent_before(core, parent);
+		__clk_set_parent_after(core, parent, old_parent);
+	}
+
+	__clk_recalc_accuracies(core);
+	__clk_recalc_rates(core, 0);
+
+	return 0;
+}
+
+static int clk_core_invalidate_rate(struct clk_core *core)
+{
+	int ret;
+
+	clk_prepare_lock();
+
+	ret = __clk_invalidate_tree(core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+/**
+ * clk_invalidate_rate - invalidate and recalc rate of the clock and it's tree
+ * @clk: the clk whose rate is too be invalidated
+ *
+ * If it's known the actual hardware state of a clock tree has changed,
+ * this call will invalidate the cached rate of the clk and it's possible
+ * parents tree to permit recalculation of the actual rate.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ * If clk is NULL then returns 0.
+ */
+int clk_invalidate_rate(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	return clk_core_invalidate_rate(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_invalidate_rate);
+
 static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
 {
 	int ret = -EINVAL;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 853a8f181394..46db47ffb7b2 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -629,6 +629,19 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_invalidate_rate - invalidate and recalc rate of the clock and it's tree
+ * @clk: the clk whose rate is too be invalidated
+ *
+ * If it's known the actual hardware state of a clock tree has changed,
+ * this call will invalidate the cached rate of the clk and it's possible
+ * parents tree to permit recalculation of the actual rate.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ * If clk is NULL then returns 0.
+ */
+int clk_invalidate_rate(struct clk *clk);
+
 /**
  * clk_set_rate_exclusive- set the clock rate and claim exclusivity over
  *                         clock source
-- 
2.22.0

