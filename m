Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F74B4E315C
	for <lists+linux-clk@lfdr.de>; Mon, 21 Mar 2022 21:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353038AbiCUUKh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Mar 2022 16:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353040AbiCUUJw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:52 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF49181B2E
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so173199wmb.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bc8iW2Y0p9EgNyzaPB9ofcw8MbDcjRfG8JdfcAHFb9c=;
        b=vPZ/T6QEQRI5o5bMpxza/WJQImKeu2kaxYIN8+9IjmsqwJLvIW9K+APd3EqKjRyzIJ
         DcbKbvtRdMho6bSss1EIZHOZjvyzb5TbVl2tCRBYuFOyiCyzUjeXdKU52DXmJR9biEOM
         i1t5XgGdmtBAIjZVbWf5ZvXwZ1e3CktFylVHsnV/ub6JFIsKvYNSZbSJIWUrNC6JGFNt
         9e12+Mwv2ZpheIHi5kYdGDVWhpwcaCOEYEdL3S75wmRVPe0NYmBS0Z/4lNRmNrSJIbUv
         tLCm4v4HISJv2KcvORMQeEMi1/hqjnqeA8963xbvMmmyyQIhQHslfOHFgo8t1o54ecUd
         7x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bc8iW2Y0p9EgNyzaPB9ofcw8MbDcjRfG8JdfcAHFb9c=;
        b=JdQ6a61nUkcRZQYXKAjtlwjB2A5XO1YCvyNaZP3tNl77OXQ1rdlptOKA0wPLNcxjAU
         ruOtRCFpngb50Upo/FMg8cxk4d1JP95NX4nsfj3BJYa4BDhnpTksjioeMUPffg8t6BuJ
         n4qg84u7ETOox4jByqCilI/Ooqna7GbOUjSDy1t1MZ/JL2/gui++4OhVMzprquBCeSsU
         s0Rlxqe+0o4hJieJ6fyno0Ney/LuAkks/EfMRFlcQ5UIEpsiIVwGNLeJS+sE9hJV7Q2/
         0q5U0QrLikyvA+1J46Sfj71sLl9gqIsVH9z3gP5+aX3r6TsTPnj5aSOy7AnBbOZjGB8A
         qWHQ==
X-Gm-Message-State: AOAM530Lw88OkHUJyPIscjhRhUCPd/O4OvKg15Kl8CzxLZi8TNWeNyP+
        3og+9QlKxdATmGpz73FRCMao1Q==
X-Google-Smtp-Source: ABdhPJy3YhrNZyJegsZ4K1MpM/YfOrXBlYIaHDQMjBJoBFW5PFV/x3FE3e88dikg4ydj/4FOrTqSUA==
X-Received: by 2002:a05:600c:19cd:b0:38c:b84f:41fb with SMTP id u13-20020a05600c19cd00b0038cb84f41fbmr27683wmq.137.1647893283516;
        Mon, 21 Mar 2022 13:08:03 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:08:03 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 18/26] arm64: dts: rockchip: rk3399: add crypto node
Date:   Mon, 21 Mar 2022 20:07:31 +0000
Message-Id: <20220321200739.3572792-19-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
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

The rk3399 has a crypto IP handled by the rk3288 crypto driver so adds a
node for it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 88f26d89eea1..ca2c658371a5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -573,6 +573,18 @@ saradc: saradc@ff100000 {
 		status = "disabled";
 	};
 
+	crypto0: crypto@ff8b0000 {
+		compatible = "rockchip,rk3399-crypto";
+		reg = <0x0 0xff8b0000 0x0 0x4000>,
+		      <0x0 0xff8b8000 0x0 0x4000>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_CRYPTO0>, <&cru HCLK_M_CRYPTO0>, <&cru HCLK_S_CRYPTO0>,
+			 <&cru SCLK_CRYPTO1>, <&cru HCLK_M_CRYPTO1>, <&cru HCLK_S_CRYPTO1>;
+		resets = <&cru SRST_CRYPTO0>, <&cru SRST_CRYPTO0_S>, <&cru SRST_CRYPTO0_M>,
+			 <&cru SRST_CRYPTO1>, <&cru SRST_CRYPTO1_S>, <&cru SRST_CRYPTO1_M>;
+	};
+
 	i2c1: i2c@ff110000 {
 		compatible = "rockchip,rk3399-i2c";
 		reg = <0x0 0xff110000 0x0 0x1000>;
-- 
2.34.1

