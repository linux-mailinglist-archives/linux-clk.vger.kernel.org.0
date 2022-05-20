Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9856452E930
	for <lists+linux-clk@lfdr.de>; Fri, 20 May 2022 11:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244446AbiETJn7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 May 2022 05:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347780AbiETJn4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 05:43:56 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB913149AAF
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:43:55 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id bh5so6928374plb.6
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
        b=KC3c/8wyL3TWVMhL+5tSUJIk8jM4TdkimQNEt+YUcV/P3D4O9WrDmYeovQCEcsR1r5
         XWSNKSVZ0WFawguQMabuNh3CoUu73KSTIFVsEoNKpo4D3eBbpFm0c9d9ubGLXmEXW5GW
         lQhnaIvUaUXAm8W1h0p1CQJLswQ7ZYLzUoC5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
        b=DmAFhWnclpsgSw/qyZwYoWZlTfgNB0ZadpVIbHRJJ1jqXXdcrjeb6xpzTdG2mFtagN
         PEOgG7z/J26WNNiNgehYW1vLp2ui6ufTiMiTuwEikMQU9CqRu7u85cH7FCuxDxZuJSqv
         FBHNj9KjXdaNDsYAFY18QCzo2lPoShoQMZUxgjbCYxStkPDPVzYwQ6Ctq418DzeqAlPc
         U3HE4BAQNDPoFUioxEJsmcYz47Kh0KQY3Cv0fJlTgcox/GREWUA3cbeFLYpmVXC8tnlM
         194vWxecINc7mg4gb0isSfSIjVB0LqrchPqZKgyy1b5Tax9cUrRE/8Q40E21sVBdDRiM
         d3+w==
X-Gm-Message-State: AOAM530PbNkhBosrHjxmIyKpyMq3qm9fnezc7mLZEyHzXH15BBm7iKzE
        SVbvI6SHUOISmKb4kyCTO69GHA==
X-Google-Smtp-Source: ABdhPJx3Qh3cpJC+oik5Y71LHH8R8PjCzSbTcq79RW9UtXYQoOStcvHrjZaDjBr8UJjUlGm3KiM5lg==
X-Received: by 2002:a17:90b:1e04:b0:1dc:9252:efbc with SMTP id pg4-20020a17090b1e0400b001dc9252efbcmr10148535pjb.39.1653039835451;
        Fri, 20 May 2022 02:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ec49:9912:894:222d])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 02:43:55 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mt8183: Fix Mali GPU clock
Date:   Fri, 20 May 2022 17:43:20 +0800
Message-Id: <20220520094323.754971-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520094323.754971-1-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The actual clock feeding into the Mali GPU on the MT8183 is from the
clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
block, which itself is simply a pass-through placeholder for the MFGPLL
in the APMIXEDSYS block.

Fix the hardware description with the correct clock reference.

Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 01e650251928..6ced76a60aab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1368,7 +1368,7 @@ gpu: gpu@13040000 {
 				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "job", "mmu", "gpu";
 
-			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
 
 			power-domains =
 				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
-- 
2.36.1.124.g0e6072fb45-goog

