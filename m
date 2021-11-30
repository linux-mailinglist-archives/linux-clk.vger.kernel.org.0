Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CDA463D57
	for <lists+linux-clk@lfdr.de>; Tue, 30 Nov 2021 19:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245217AbhK3SE0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Nov 2021 13:04:26 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:45996 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245102AbhK3SEZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 13:04:25 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3VQ96d9lz9vtYq
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BrTG6CA6YtqH for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 12:01:05 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3VQ94fTGz9vtYw
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 12:01:05 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3VQ94fTGz9vtYw
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3VQ94fTGz9vtYw
Received: by mail-pl1-f200.google.com with SMTP id a4-20020a170902ecc400b00142562309c7so8667740plh.6
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 10:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL0IN42+vhkt/BQxOMaS6WGBCL/vDaM2/NJLkQGW6Vk=;
        b=IaCGRRGoGX4BQNCdCbpZEfJZm3PIHsvhvVBLRoPiWw+RvC37CMC3NTitW531yMPkaT
         O1Yq1i9zlKp/5yaP6of6CLu9qm5hg00DvTmSt6b2AsmJAjXby8IoZ6eS/SIVksrnKeIs
         BNoqrLWZdT6Fc/tMq1nxhbvYi+oSQ/SNJ40+S6Hd1bEdXwPSevtc/PGCT15t+Pn1oZZ1
         zj/x6V2r5Y38YhkMqTFobafEXF7iAL/0SXe2ep6OR/s83D+04N/iDxc8WAoM7wKy6Tq7
         HsZZevzc4mf6pvRSmith9h3i6OwDTgLFyGmNbm2KQA2GHcl+kgrZSMDEadxymDZFqy4H
         z7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL0IN42+vhkt/BQxOMaS6WGBCL/vDaM2/NJLkQGW6Vk=;
        b=L11uie6KXptcsqE6RPnmB0M4BLw5WK9+KhLw6YUE4lZ9kDO+K/NopCgZBJKn/fMc6r
         OBJjg35bQFGJTlfKNz3aW3bifIzSAobN+yHT8fROJfrcRzXP6oIzVx3tLE4cPOwcj5UM
         MYG6s0f1+SsFiXdeJ9YZ7Nvw/ckw4Ls/FuL8mTpUEqUfx1EQvoSoq87shSEhVg1srmRA
         qyJtRL1+HO6ix7O1JAMhBSs8OvUNmtIgmHEXW3Ehko51AEhcmkqn/hSXO6+phPZ6y8Yv
         hfFszHWUVFL/hGBkD7hO0AV0LNBx29cKc175sWYuXJjTfckecK0HxzVuifWMLPl1kiEk
         pxPQ==
X-Gm-Message-State: AOAM532MqA2c1Yrj/gN+nH8o0pTJ4973hj3MJ26mV2XlmBHH1XAMe7rh
        yiwzMg8ObecEnY7NZtrzkFcGBuCFT+4Xn6iddfUGmqDPLVFXLeTEBVHkFrr92TvN6GXdeRMpyfC
        7ZWMmnqa9jmPLm3n0pcDuDAED
X-Received: by 2002:a17:902:c78a:b0:142:1b7a:930 with SMTP id w10-20020a170902c78a00b001421b7a0930mr800471pla.8.1638295261896;
        Tue, 30 Nov 2021 10:01:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqLTafcr/AGzb9we55yXJTEdf36evhqdpEWPD52bvrAmxYJsSWPtReDc97dx8xlqMJehP4Tw==
X-Received: by 2002:a17:902:c78a:b0:142:1b7a:930 with SMTP id w10-20020a170902c78a00b001421b7a0930mr800290pla.8.1638295259505;
        Tue, 30 Nov 2021 10:00:59 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id s19sm22444973pfu.104.2021.11.30.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 10:00:59 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wenzhen Yu <wenzhen.yu@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7629: Fix a NULL pointer dereference in  mtk_pericfg_init()
Date:   Wed,  1 Dec 2021 02:00:20 +0800
Message-Id: <20211130180022.216947-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_pericfg_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7629=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes:  3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7629.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 30fe4b9b9fda..856929f94ebd 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -628,6 +628,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
 			       clk_data);
-- 
2.25.1

