Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF0659C2BE
	for <lists+linux-clk@lfdr.de>; Mon, 22 Aug 2022 17:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbiHVP2h (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 11:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbiHVP2U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 11:28:20 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2199495B0
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso7973101wmh.5
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d80NoVc4CKxgwm+1ORH7Ic+wtbyEu3iXvu/cuq0ek2s=;
        b=bhgm4+EabLlHOnd1NBtiJTpSbKOsKlBBzPr9K9rd5uRNOTOJ3Ta5+P0Mf9buKQNA4v
         lVVU8sVQGtRg0Ge3COm2hfFJHl8E6Ie6wr7exkJhfv6TAAYq6rF0tk+xOSx++Av6TMZX
         W8Ns6DsnfhAsUVFKtnuIr4ZzWP+G9ZYnBVuPD2nMVNHiOUp92okd7y1Li4zF2ZQ4j7q/
         8W2fCDdRJlm4vJGk9NxaOO+9cukzDpWBqkBqyf0LGmH+RB7DTOEz0KoLdTvpAcNVtedh
         b6Ut3+lLKBwlaA1CAgNUpJ6nw2QL2UPihELOkvvJe1POHCDNnxyt67M+FbC5KOWl4Vm0
         GtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d80NoVc4CKxgwm+1ORH7Ic+wtbyEu3iXvu/cuq0ek2s=;
        b=bpuapEaM/4Wf3tr1FcQ8DM7uvFdHWhmGlINYpC9M8q8Z4gXjH1QrL4hmEPBusKPlFU
         abpK1utL7stFgHZ+OZqlTYD534rKH8kE5RxdxPYNUV4fONVlQa0w28jCmR3YLDN+BbKY
         NGa1qFx5n9DA553XUNUlBiWESvMOPOxCZ8OqBq2Joa6G0jkA+Rwx0SNNrnJzvzhZKTx6
         rzm0cTo+qRQ7g1zGF1iZyyknU2KwLTJYFwNDcsaWi8zYQckrRVyGKHIQJM0EnSfPMZru
         Kxlk3H3tYfGBXxRKy5PawoamDrSv5CrbZBLAbCCqqIewZ0X63M5HD+Tn3XNq/eFHVIEg
         K6OQ==
X-Gm-Message-State: ACgBeo2hjtqtZ9r5N1gsAQ2GUtgn1q0u0qDTQkhvCrkob4cGwrvHteuI
        zVhrobDv2cD7h4DsGIvrU1Hq6w==
X-Google-Smtp-Source: AA6agR6TVEaNAi2/4WaQwa0zk2Np4mNCbXQO/8e9/8q0irIV+qBfkE9CEoP84hfeDYme1VrMf8ND4A==
X-Received: by 2002:a05:600c:600c:b0:3a5:abdc:8ce4 with SMTP id az12-20020a05600c600c00b003a5abdc8ce4mr15419339wmb.144.1661182051744;
        Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 3/4] clk: mediatek: Export required common code symbols
Date:   Mon, 22 Aug 2022 17:26:51 +0200
Message-Id: <20220822152652.3499972-4-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822152652.3499972-1-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To make clk-mt8365 compilable as a module there are a few function
symbols missing. This patch adds the required EXPORT_SYMBOL_GPL to the
functions.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - New patch

 drivers/clk/mediatek/clk-mtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ef4c29422bbb..1ab6930f7fde 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -422,6 +422,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_dividers);
 
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -441,6 +442,7 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
@@ -482,6 +484,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -495,5 +498,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
-- 
2.37.2

