Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9344A7222
	for <lists+linux-clk@lfdr.de>; Wed,  2 Feb 2022 14:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344718AbiBBNu5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Feb 2022 08:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344562AbiBBNuq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:46 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DB9C061775
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:33 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id i65so18831300pfc.9
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+daluWI6BZRIIo6jD7cHJViSYXk0pP6IWtsEBRin450=;
        b=Tpd1Y5ycji6S6pWD2XDf2SPMtoJdCSlWpqa5WQ0rz036vkv6p90/OEXloIQ1CsAkGL
         buh3iG4TyghoF0YDogBgAeLC2VzMf1iYDwfXL6Vf9G6tOqVf1CLVbGsBl/FZOAP822jB
         VuhIm7GlgM3Uqijk5XMVny+frQUbsvt0GJ/P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+daluWI6BZRIIo6jD7cHJViSYXk0pP6IWtsEBRin450=;
        b=RMLAZpqFwqeFzFqI0btuYm/kTevldpbl5qmRDOvXgNLkNpvZdcMC6ej9PZV4n/eJxh
         I0Rc/R+TPJT3E4PGkLNtMYedo/Spkp6Puec7fbKrWWK0i8mZVdMT6hWb8Gl613BErgBg
         tK2j+1K9VrNKgiml5MewYjYiBUNast99bb9w9gkG6Kp+YuT3doPiBPlH2YlSu2Hl/fdy
         /mcywbXWlHHNW6kd2PDb1vc1JiKEE+6E4MGlYB6HngndImw78LTLKcU1rzScDdzmd4vC
         W6vAJIlSeOueC13/pCqWB0ghdLbsvf8K8xXf7Gm243bl+xrgoy+KEEHgpKtxROzPYDjY
         qzOg==
X-Gm-Message-State: AOAM532We+0ltf8Q3xWf/o+iqzt75M9sKWfZgOxQKpMW2Q+nrgpWoz79
        dNYQwQ/ULR//GcQwgBk3Dvql5A==
X-Google-Smtp-Source: ABdhPJwgB9Kfv9ToZpcQLJRwpxFqkgMwlv0Lnc1Fod0ARERNSW52V7MEPKDRm9oXXveifEe8s/FX+A==
X-Received: by 2002:aa7:9498:: with SMTP id z24mr29584316pfk.80.1643809832727;
        Wed, 02 Feb 2022 05:50:32 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:32 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/31] clk: mediatek: Unregister clks in mtk_clk_simple_probe() error path
Date:   Wed,  2 Feb 2022 21:48:30 +0800
Message-Id: <20220202134834.690675-28-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of mtk_clk_simple_probe() to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8f15e9de742e..0e027be0d5fc 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -439,12 +439,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_data;
+		goto unregister_clks;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
+unregister_clks:
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.rc2.247.g8bbb082509-goog

