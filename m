Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E6D4630CA
	for <lists+linux-clk@lfdr.de>; Tue, 30 Nov 2021 11:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhK3KRn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Nov 2021 05:17:43 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:37690 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhK3KRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 05:17:43 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3J3g5rHsz9vBtK
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 10:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KByDHusCt87W for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 04:14:23 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3J3g3f9Nz9vBtZ
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 04:14:23 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3J3g3f9Nz9vBtZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3J3g3f9Nz9vBtZ
Received: by mail-pf1-f199.google.com with SMTP id b26-20020aa7951a000000b004a815eb3a3aso6142954pfp.16
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezPDMyg4z6FUtdCtlSvrXZjWSKm8o+6pNXDt3YFkKII=;
        b=Q54MRiSiawsPKrbhwo2sZaqpTRa/egZ01MFGeAUM/DZ82+sJerdvNIHnksW6nM/pta
         QVvvv3AOILqpqIUGAsZnGjhDuZUxY8mAyX0zTIx80kN8PEb9AEsRK5jJGHWUMLXq/+9p
         18FLISF6m1jmgoMj7A59ud8iJTJv5unr1HFInzCEsKS+QB+t/YR4V3rzZ1LvapFYGkbM
         QXfePCn+j3l7xY4BDmkJJY2XL+0JaBjQlw6vW+JCLzuLiPZgyoEb13RWjnpJptvj6N8Z
         a8f7HWlh5y7VeizpsvQbTZpU78wh84cs8PkNO9HlyMA53OgdVR/HBwqSynVvwZI04iP4
         0joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezPDMyg4z6FUtdCtlSvrXZjWSKm8o+6pNXDt3YFkKII=;
        b=fczZ9u6hxDoIe8gSckLUj1TVDBlEwu6gwXm/ACydHg+rFNJtURb/1+Hp359dZIzO1U
         sFHkDd9HXhi9cL2KrdGrG5Dl8xTvY7ioRdw/t3g52rRBTvCPlUfY/Smrr9UATIp9FBcq
         TJd1zGfexsRYQDijaLLSZGoQaGiVGfOEMIR2llWvUxnuyQogw2oPT4f2hppo5Zj6BwHd
         vFbOuRG0pvfViqjuJkEBuY+l5X3LOx7tPe0j+GvjgDU3ZCfcPsKrpi+6RXuDIwsmM7LB
         8SU2rJMbPxb+JJTwfNbIqI++qaLL/4Bj5Aj4chB6EU5T6xed08FGwYTm2FSjGE1u9mNo
         +tcA==
X-Gm-Message-State: AOAM530EQVrR9AuhGsrRnJ9rrtgJPaHHNoYlLJWL8TtIkte9b2fJ0Q7v
        NUJVQxK0R8LIi+hFBOrnibL3+EPxoU849vIjqWzOjl1gSLKOsKUIHln0jAaaorF3TQonTQ8ob7s
        BaT7c2CdGUDTQOnhkeyPAe2Xk
X-Received: by 2002:a17:902:ce8c:b0:141:d218:954 with SMTP id f12-20020a170902ce8c00b00141d2180954mr66086320plg.1.1638267262781;
        Tue, 30 Nov 2021 02:14:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZhxN9ocyihGfNCGLMaz0RjGDMqMGBOZyUXuyOBDhzdCoh/2u3iNSfs04TgQLOMNklWxKYFw==
X-Received: by 2002:a17:902:ce8c:b0:141:d218:954 with SMTP id f12-20020a170902ce8c00b00141d2180954mr66086293plg.1.1638267262561;
        Tue, 30 Nov 2021 02:14:22 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id t23sm12504231pgo.35.2021.11.30.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 02:14:22 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8183: Fix a NULL pointer dereference in clk_mt8183_apmixed_probe()
Date:   Tue, 30 Nov 2021 18:14:14 +0800
Message-Id: <20211130101416.102608-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk_mt8183_apmixed_probe(), the return value of
mtk_alloc_clk_data() is assigned to clk_data and used in
mtk_clk_register_plls(). There is a dereference of clk_data in
mtk_clk_register_plls(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_plls(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8183=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8183.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 5046852eb0fd..9eca62186ec5 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1158,6 +1158,8 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1

