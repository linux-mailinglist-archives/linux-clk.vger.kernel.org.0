Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03BB7560C87
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jun 2022 00:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiF2Wxi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jun 2022 18:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiF2Wxh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 18:53:37 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3AD24F13
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 15:53:36 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5F9343F7F7;
        Thu, 30 Jun 2022 00:53:34 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 02/11] clk: mux: Introduce devm_clk_hw_register_mux_parent_hws()
Date:   Thu, 30 Jun 2022 00:53:22 +0200
Message-Id: <20220629225331.357308-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629225331.357308-1-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devres variant of clk_hw_register_mux_hws() for registering a
mux clock with clk_hw parent pointers instead of parent names.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index f3f2ae1229f8..3a76a67241e8 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -980,6 +980,13 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
 			      NULL, (lock))
+#define devm_clk_hw_register_mux_parent_hws(dev, name, parent_hws,	      \
+					    num_parents, flags, reg, shift,   \
+					    width, clk_mux_flags, lock)       \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
+				   (parent_hws), NULL, (flags), (reg),        \
+				   (shift), BIT((width)) - 1,		      \
+				   (clk_mux_flags), NULL, (lock))
 
 int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
 			 unsigned int val);
-- 
2.37.0

