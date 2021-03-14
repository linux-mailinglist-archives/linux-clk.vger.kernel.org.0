Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9569F33A455
	for <lists+linux-clk@lfdr.de>; Sun, 14 Mar 2021 12:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhCNLHo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 14 Mar 2021 07:07:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58810 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbhCNLHO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Mar 2021 07:07:14 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lLOaX-0003c3-Ki
        for linux-clk@vger.kernel.org; Sun, 14 Mar 2021 11:07:13 +0000
Received: by mail-wr1-f70.google.com with SMTP id l10so13666878wry.16
        for <linux-clk@vger.kernel.org>; Sun, 14 Mar 2021 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=desAQUCBU+zk3j65WJVheqv1L6ClQWpP83WB06G6huw=;
        b=iIxv+EgS/qygNHSG39N/qUzOD2yAbZD/DcWTczvzKGvCplHnVYJm3kd/epVGXU+XUv
         ZVbFq+0wWoGtALMkc4XIu2ztI+R6Le698tI2UcQhjdITyzqqKviV32W6taTi0BnPZvh6
         eT4RQazxMUs5amhpl0AjqHLtnq682OIBeGiMVOsxdNOwV0JKE2U5/o7lFPo+6ZRAXAp0
         TiFH8Pfs1YecQ/nkzeg21UpLCpv7AwfejKaI4LwuMFmwN6TqhjGGpNsMalv/cjrJ7CUU
         SNV6XO/hBlfc0eU8+bRjBm+tyaZ57pfBVxDA/IJrqckKzq4Eyc1qbEZWEOEzx4aun7JL
         pj3Q==
X-Gm-Message-State: AOAM532yX2m3ME6GFoGEapIyqM9wG/WuGg28gBM5rMeZ8vHyWr+mom9x
        MPRxltJrDxR3FLP5Fj1QDmmKPyomk8bRU+XnG9rPE7RlWyWiHx6o8IDQN3UVI1EV1DqZeQDPXJ9
        5r1Tkf+2IMspsM1VJgQ4JkGkaVjayl1Q//hb90Q==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr21143087wmj.109.1615720033281;
        Sun, 14 Mar 2021 04:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCWlO6Nk+CjKaMs9pBlAihe7fu/ifUQCH9+BlOaK3FPlf512l0IOYp7EGhenlp1xqS5EPflQ==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr21143078wmj.109.1615720033059;
        Sun, 14 Mar 2021 04:07:13 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id u4sm16014550wrm.24.2021.03.14.04.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 04:07:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2] clk: socfpga: fix iomem pointer cast on 64-bit
Date:   Sun, 14 Mar 2021 12:07:09 +0100
Message-Id: <20210314110709.32599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Pointers should be cast with uintptr_t instead of integer.  This fixes
warning when compile testing on ARM64:

  drivers/clk/socfpga/clk-gate.c: In function ‘socfpga_clk_recalc_rate’:
  drivers/clk/socfpga/clk-gate.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Fixes: b7cec13f082f ("clk: socfpga: Look for the GPIO_DB_CLK by its offset")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>

---

Changes since v1:
1. Add Fixes and Ack.
2. Use uintptr_t (Stephen Boyd).
---
 drivers/clk/socfpga/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 43ecd507bf83..cf94a12459ea 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -99,7 +99,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 		val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
 		val &= GENMASK(socfpgaclk->width - 1, 0);
 		/* Check for GPIO_DB_CLK by its offset */
-		if ((int) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
+		if ((uintptr_t) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
 			div = val + 1;
 		else
 			div = (1 << val);
-- 
2.25.1

