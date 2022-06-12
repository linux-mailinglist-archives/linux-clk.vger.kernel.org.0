Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360E1547BD1
	for <lists+linux-clk@lfdr.de>; Sun, 12 Jun 2022 21:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbiFLTbV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 12 Jun 2022 15:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234974AbiFLTaQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:16 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A63D41FB6
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:15 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id d129so3799684pgc.9
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNiHb2zf4hIUtj3fRs5Cp05qIaOZgGR33OERisEw3bQ=;
        b=Kra1q9GS4FRu7pOyXngoZt0PIXUuGrrSybyjnq9ZWOJYF/IslGrzjkpsV3T0uT9SDY
         xsLXryJfZQ7DNxBI6YUBIXS9BY/9YtAHy0PQfFbq+mSmi5msHai94Klhyxo4QMq4e5Fb
         hKhRDAc8kkE4Mcev2jDw+Z8YFaNLrxDTh/X0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNiHb2zf4hIUtj3fRs5Cp05qIaOZgGR33OERisEw3bQ=;
        b=7hYECerRcOslZwf632wBtNGWxkrc+fCyWhd40PQFsa2D99ytZ4mIBEqlMxwf7EXzeq
         MJfHR1zuxiChcWaOWDz3/KpKPO9upHgIL/fNEFbNyd52NyMHfu6jAaUgTnhZAlyzjJw1
         HUG0XkinuUca/osDVDDBFG7zM3hcZeiTP98C+LF26/Mm7WVTv8dDIA3SZU0r2tEuxT/T
         W99paEgYztGCbqImGCo6Ud6KfVE4NbtQGcZwiB8a4pvUprHLj28w55Ud1IvN8d6gnR6/
         24wK7T90DftCpJehScmYVeJ66BGyiL/I5/IuCeB7sCdD2kFepd/aXL8lJGPXaSjTeoeP
         Vkjw==
X-Gm-Message-State: AOAM530eC127BnQuudsAHNYY3cbbAZ1GOpcCjVe22XaqdUz8o7fwVEMC
        pQ14vbQTeM7FM1+CH4kt7AWmbw==
X-Google-Smtp-Source: ABdhPJzVWoPA6NX35buSBu4zo18+BuUgE90Uzf3Dy9SLl8yMhf9+8qVt2b7M0XX2GJ1hZknuE7XhEg==
X-Received: by 2002:a62:d40c:0:b0:51b:bc02:703b with SMTP id a12-20020a62d40c000000b0051bbc02703bmr56023545pfh.65.1655062214999;
        Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 09/12] dt-bindings: marvell,pxa168: add clock id for SDH3
Date:   Sun, 12 Jun 2022 12:29:34 -0700
Message-Id: <20220612192937.162952-10-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are four SDHC peripherals on the PXA168, but only three of them
were present in the DT bindings. This commit adds the fourth.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 include/dt-bindings/clock/marvell,pxa168.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index 8686bc7bf7b6..b1cd4f20d175 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -59,6 +59,7 @@
 #define PXA168_CLK_CCIC0		107
 #define PXA168_CLK_CCIC0_PHY		108
 #define PXA168_CLK_CCIC0_SPHY		109
+#define PXA168_CLK_SDH3			110
 
 #define PXA168_NR_CLKS			200
 #endif
-- 
2.25.1

