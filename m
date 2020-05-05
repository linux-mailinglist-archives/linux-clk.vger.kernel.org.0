Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348D51C4EE1
	for <lists+linux-clk@lfdr.de>; Tue,  5 May 2020 09:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgEEHRE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 5 May 2020 03:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEHRE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 May 2020 03:17:04 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6607BC061A0F;
        Tue,  5 May 2020 00:17:02 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so1392617wrx.4;
        Tue, 05 May 2020 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emMqIAfTmjcgvm1WUdIrm2dV6d1JMni+YiBRBMmX0eQ=;
        b=VXiucNkKpaip/zEZ6eBBDS6iKOD3nIpqI2Fh2iN85/Sl++tlzvouYppk/Fo5nBiBX6
         A6A72YGdafkTVVQiPi38t+ySHKExmYY36S64CR8fpVFTn2AKi0SONKBl+vBu/fYeHEoV
         Q5HJ3QZsTcEHoKsBHLLofZS7RVetwqMcPFVR7/FsynFE7qJc2oe3MSCRxIF120cO7awC
         wz6+gG1IvPigOpuzvYAXRlB3aE3aRmD26J7zWc0MXo4cC28OT9yv+kvR+gxhGu66jotD
         tqS+s0mgYv+eGiRu2OlWx8gsBFU78ZkAR4ydg+wSeoG5hSoZg8lZT/YUZQ/L+Y+X9r9K
         nWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emMqIAfTmjcgvm1WUdIrm2dV6d1JMni+YiBRBMmX0eQ=;
        b=TAYBVqjW8WAaGQcicRg1XqdZMytU8e3jvMyWPYKHACXhNsMOtPyMCpkmh+/ayVrfwZ
         KdaEQ4z7QOEq+wrefaFsnt0Crcpjw/tpYXrFN+y1cRoFZMqQvO3hsSZNVKr5Stl4QvL7
         dR0dkIT3apsISBtCbarxh76cNvR4o6wEHAU3nJJZQD2sB40h09Jce4Gf8DgyGa8JUlOT
         AeUWKz8vahlhSfg3f26aQD6fc3CUSpK7uaNLh9wBpssKoxZURolwwKjE8G2iiEfwXSEi
         1pZAyO7NWN1de6WO45bczfs5t0zKDve0UHRNTUyPS+DTdp65tbBXS1/RL861fIC7p5FN
         hsAQ==
X-Gm-Message-State: AGi0PuYRj0/6BLFOPONzm0QebOTeh0YuLbbTkBdyep14LC3ChbU57f6s
        5m2+FAO02rNm7/iHYhl8NY4=
X-Google-Smtp-Source: APiQypJfp1jaYnS8GcWJcUlLxMofx0mkoUY2CEAkpWUvjs6Jz1EciDTzqso+47ZlYU196Xa0qUVkyg==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr1990205wrp.304.1588663020899;
        Tue, 05 May 2020 00:17:00 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id a24sm2251287wmb.24.2020.05.05.00.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 00:16:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5.7] clk: tegra: Fix initial rate for pll_a on Tegra124
Date:   Tue,  5 May 2020 09:16:55 +0200
Message-Id: <20200505071655.644773-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

pll_a_out0 and the I2S clocks are already configured to default to rates
corresponding to a 44.1 kHz sampling rate, but the pll_a configuration
was set to a default that is not listed in the frequency table, which
caused the PLL code to compute an invalid configuration. As a result of
this invalid configuration, Jetson TK1 fails to resume from suspend.

This used to get papered over because the ASoC driver would force audio
clocks to a 44.1 kHz configuration on boot. However, that's not really
necessary and was hence removed in commit ff5d18cb04f4 ("ASoC: tegra:
Enable audio mclk during tegra_asoc_utils_init()").

Fix the initial rate for pll_a so that it matches the 44.1 kHz entry in
the pll_a frequency table.

Fixes: ff5d18cb04f4 ("ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Mike, Stephen,

this fixes a regression in v5.7, so it'd be great if you could queue it
up in your fixes branch.

Thanks,
Thierry

 drivers/clk/tegra/clk-tegra124.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 64e229ddf2a5..e931319dcc9d 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1292,7 +1292,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_UARTB, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTC, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTD, TEGRA124_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 282240000, 0 },
 	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA124_CLK_I2S0, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S1, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
-- 
2.24.1

