Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2704A7215
	for <lists+linux-clk@lfdr.de>; Wed,  2 Feb 2022 14:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbiBBNu1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Feb 2022 08:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344581AbiBBNuP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:15 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E51C06173D
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:15 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id cq9-20020a17090af98900b001b8262fe2d5so2093445pjb.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2rFtWf6KqBF9xTPNkR58mW4Ft7tifSnYgDGOnwZWmM=;
        b=A2TEbWyazowLCHaF4sxnFrf/4MM/80w5Zdz/MSmRbHBlI6qrtBt0Of872ysILEMFiv
         dXzigYiyj8HuPfx1+CcFTvhZ+LKD2BhHfWQRjgyMaV9if77Y7HZzO7aQfsUMNKPhBPx+
         MJqeBSg80HFwiQO6wfGOeSCdZs1aft8j7xe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2rFtWf6KqBF9xTPNkR58mW4Ft7tifSnYgDGOnwZWmM=;
        b=fJhitekVjd+x0rufFqQFFBUHWt6WWoFuv2/qNWBlkMbRK0kFkJoxwqksjEbDxgp8cD
         4dOcwNb74orae+PLPDq4KSOeA/MQ+TkHzFfEysyjFWVPX9ufqt6P4RcCWk4b13tURdql
         p1TU6+Na8R1ChtWJeY4RyeTHPXd3XpSAG14or9kc88HfRwWLv+dob5SiyCniEuhyk1fs
         VYe4Ia9h6NhsWcCImmt+n9unkeg/OowaemoCHpbluTIIPz660AYizD/1XgzTSRo7vgA0
         CWescJwpZVtjF4or+HpLDoz1F568/5u8Ml4WItciBOkiXC5mz3aYxi7YCLD8nh74IZ0j
         0CnQ==
X-Gm-Message-State: AOAM532Dl2hVYts7S9xJVzONlvQ4W5g3PPwnSl/hEOcUjMi/AEJ+yJl5
        z7dAwcFrArXxXVJFlYIhkXNvsQ==
X-Google-Smtp-Source: ABdhPJygRG8bYFhtlnVoNGsOJ6b3CgRc73OX4/Ug88WdrqeRvZXVJKZrLyD9KeAy+tMCvIi8t72LFg==
X-Received: by 2002:a17:90b:3e8e:: with SMTP id rj14mr8071807pjb.112.1643809814237;
        Wed, 02 Feb 2022 05:50:14 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:14 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/31] clk: mediatek: Implement mtk_clk_unregister_composites() API
Date:   Wed,  2 Feb 2022 21:48:21 +0800
Message-Id: <20220202134834.690675-19-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_composites(), as the name suggests, is used to register
a given list of composite clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 46 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3a6dfe445e63..869e6ae55c82 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -233,6 +233,32 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 	return ERR_PTR(ret);
 }
 
+static void mtk_clk_unregister_composite(struct clk *clk)
+{
+	struct clk_hw *hw;
+	struct clk_composite *composite;
+	struct clk_mux *mux = NULL;
+	struct clk_gate *gate = NULL;
+	struct clk_divider *div = NULL;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	composite = to_clk_composite(hw);
+	if (composite->mux_hw)
+		mux = to_clk_mux(composite->mux_hw);
+	if (composite->gate_hw)
+		gate = to_clk_gate(composite->gate_hw);
+	if (composite->rate_hw)
+		div = to_clk_divider(composite->rate_hw);
+
+	clk_unregister_composite(clk);
+	kfree(div);
+	kfree(gate);
+	kfree(mux);
+}
+
 void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data)
@@ -259,6 +285,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
 
+void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_composite *mc = &mcs[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mc->id]))
+			continue;
+
+		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
+		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
+
 void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			int num, void __iomem *base, spinlock_t *lock,
 				struct clk_onecell_data *clk_data)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e3ae22fb0334..3c3a934f53cd 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -153,6 +153,8 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_clk_divider {
 	int id;
-- 
2.35.0.rc2.247.g8bbb082509-goog

