Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BB12FCE60
	for <lists+linux-clk@lfdr.de>; Wed, 20 Jan 2021 11:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbhATKjE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 20 Jan 2021 05:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731434AbhATJdt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:33:49 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE5CC0617BC
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c128so2191357wme.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Cp1gEYyuPZEPQHMnMAoPqNAjf4Uu2nrDn0l3qFFYNM=;
        b=XRKGU3TuNzHBFC89BWDjqJ5hAyo+4Yh8pfCnFFMEk7w7e4CVLgSauiD1D6ChJQkPmO
         XTsrqY1MYX+iiXxGZrIXRoFcXloPdKljvImfh+b7XxVUh7beWUSWZocuCwtvoHJxgn2K
         BJbzeTi8alM1pwdtJc7LWh2w1RZIMNsOe77PsGs/DhKhTgC1/UIGkTrqmmKs8FMwkgUp
         oD8mMqaEDLQSNnkKfEgR0Q6JH5EH1Q0Imywfe1H09s+XD8BzVkJfaToNDwHqcqicaVuI
         e8RUQw9j6a7dJvRkC5espSYy6T14Tapa9gwdsfcgt194sRgXGrh0VDW20BfrjolTpAja
         O9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Cp1gEYyuPZEPQHMnMAoPqNAjf4Uu2nrDn0l3qFFYNM=;
        b=RGKqERsjcF/wPe1Fz9W89A9l6VvIF3+2obghgz1v4HHu0VdO0eRCB1tWjN2hB7ISIR
         riBJwtbLPyGKzXfZ2BcFPJ5BQ3l8QXgtx2q0gJ4jgmg798M/94jvMcmI+VcqcmPyxBdV
         wZHyxi/pFEQALD/fzG7pAw9xcZuTlWJh3xznlknFvwZ2i9zmQnzlBTafE86jWgXLPfNw
         IulYE3qUNghjxR2X8HpkyKP+uQWT2Win7QIyo/+iDlMTYgj2hwTmkqcCv0qjFXL8eMQR
         qAAgzJLCMFt+m9SKagBBPCZLWzWbts79YLwilGaBoTDqaSwxTI6Stxq21dHdDSFdydn5
         yskw==
X-Gm-Message-State: AOAM530uGjkm6x/2HNG6iyxEn+jbQIgkuB9gWK7i31npAK1C77k18S7h
        xZ20FVwX7R99shJYWOSRfdyFnw==
X-Google-Smtp-Source: ABdhPJxZxWzaToEk27ecZGkXhe+6U5z7Ot3JGsAIEg9K+DV3FjCF6F8iccxzNz/LgqouJZmYDGeo4g==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr3570290wml.28.1611135062782;
        Wed, 20 Jan 2021 01:31:02 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:31:02 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 16/20] clk: ti: gate: Fix possible doc-rot in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
Date:   Wed, 20 Jan 2021 09:30:36 +0000
Message-Id: <20210120093040.1719407-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/ti/gate.c:67: warning: Function parameter or member 'hw' not described in 'omap36xx_gate_clk_enable_with_hsdiv_restore'
 drivers/clk/ti/gate.c:67: warning: Excess function parameter 'clk' description in 'omap36xx_gate_clk_enable_with_hsdiv_restore'

Cc: Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/ti/gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
index 42389558418c5..b1d0fdb40a75a 100644
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -55,7 +55,7 @@ static const struct clk_ops omap_gate_clk_hsdiv_restore_ops = {
 /**
  * omap36xx_gate_clk_enable_with_hsdiv_restore - enable clocks suffering
  *         from HSDivider PWRDN problem Implements Errata ID: i556.
- * @clk: DPLL output struct clk
+ * @hw: DPLL output struct clk_hw
  *
  * 3630 only: dpll3_m3_ck, dpll4_m2_ck, dpll4_m3_ck, dpll4_m4_ck,
  * dpll4_m5_ck & dpll4_m6_ck dividers gets loaded with reset
-- 
2.25.1

