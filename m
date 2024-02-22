Return-Path: <linux-clk+bounces-3918-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5685EF96
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 04:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2C62846F2
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 03:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A69F25775;
	Thu, 22 Feb 2024 03:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8GV2oq0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635EB20B02
	for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570971; cv=none; b=QAIbX9AzwAHiWk9Fb3NKaUGakE1jPj2X65FkF/uDSRQl6s+ylWgPQuJzVAJcw6CBlc82NFCyozX8PCepUDPAPoIqzCJUwIp38z4DOTGeUiyNVJHPXZNqoLCJ3d2WbmBfCx2zKuZhkA1s/KdsLM3PFbZDpzNIvSJ+3cHcoXIpm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570971; c=relaxed/simple;
	bh=mF6ovrjw7+9sFKQNzXZPHWylrbwz4f8h18NF4imFlcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IwqatZzhqyeDpwEwlm5BCq8XrQXPL/UB6LV+fgiyBYjKCU2i2vjhR8p1TlndfZiNhwUB9JoECCV+vfBGrDfbA2t9T3k8nOec/gyRsYQ1rA/ishXDRU3X+0uYHPkBXAXkbbTedAQkplRwXXCaHGMyQKTg0kgnn3AecvIV5S4FZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8GV2oq0; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-21e6be74db4so3404527fac.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 19:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708570965; x=1709175765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr/yHix3JzjuluFq1TtfZCC5Pd9Qq4G1cyD4GVYOtnc=;
        b=g8GV2oq0OafQLL8s5jXqterG++eOEomrUj6w5eQ8McKLidRxLCFOGC7yh9yRQd7lm1
         fXNJcjsSjE+G656uPTBK4xLNOv52Ul3ruflQsIu/YJhTUljhfrDD3OBaU0mH3X8lTuHX
         4Mj6iMIqIf46QFXIUxpGrfNkcECTqrVlKVntamEiZoulzTCfvEXrfxTFbMSkC24L5o5A
         yM8UDLgNgoclmrD7ZVMC4l1F8ayKWlcSS2WFzOpaI90WBUgLwGXFUKE4SyscvPGamJZm
         6lxZNBOWjO264uSGoCk1AQheCfLdGs3PlWYFm2T95qEucENqL8GJnlrh3JmcojwRSnYE
         PnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708570965; x=1709175765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr/yHix3JzjuluFq1TtfZCC5Pd9Qq4G1cyD4GVYOtnc=;
        b=R8f52C3tojZGh/8dMy7ZTiUv1f7nOZKFi1ToBiu+kAC8slUwndzceJVSAIhDJrTJEt
         Ffmdt043vEB6pf2U4mBnNuvZHtbqlsmmOKLldtS36g2qtuboHnsa+YgIAq07gu0qgto4
         aaGTZZLp/eol19xb+aV4nPBVDdMJvrUBNo+sTgwq7m95C7qbfoYjbuIh6gQMeZQQ9PL2
         H+ww+KfeQlDIBW18h+y7tP1XvrHWmbhLk5IPWwQnjm9mIZPuqCPWFxK40TxquZOHlEjb
         58w4LP5sbVk7xdn6jY6CkGvjl6iXOHBhWBFK+jCt3brBqxYOVzj15p4huG1hJlYtIO/V
         VMFw==
X-Forwarded-Encrypted: i=1; AJvYcCXWmrh4Zx0D7NNDrOKMq6y2r8wlZSpX7ISIXzxDodUp4nCyFntp7+V3gaJUoE5PqIRb/RNhpKX6dyWpbNm81YQvLYxy3eHnuAcb
X-Gm-Message-State: AOJu0YwwO4zYoAgZIpPWRpCQqZzwJUpOrXAa8/L66ihp3xpGyl54sMBa
	bTmhI7md+VoiUPsyyUYfrQh5l5243dNDfIZxrP/vdqpEdfRctJUlwA5hp8Y2GK0=
X-Google-Smtp-Source: AGHT+IFHuTnKt7JYDZvxQi+WgqtjmOJmqsoXRWbTXMzeK2gAjybtMBRv5ln2nAtoh8f1dwanim8zMA==
X-Received: by 2002:a05:6871:1ca:b0:21e:635c:a5b8 with SMTP id q10-20020a05687101ca00b0021e635ca5b8mr17215407oad.26.1708570965242;
        Wed, 21 Feb 2024 19:02:45 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id sk14-20020a056871800e00b0021ec89a1a2asm1937031oab.32.2024.02.21.19.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:02:44 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] clk: samsung: Pass mask to wait_until_mux_stable()
Date: Wed, 21 Feb 2024 21:02:31 -0600
Message-Id: <20240222030235.27815-12-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222030235.27815-1-semen.protsenko@linaro.org>
References: <20240222030235.27815-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it possible to use wait_until_mux_stable() for MUX registers where
the mask is different from MUX_MASK (e.g. in upcoming CPU clock
implementation for Exynos850).

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - none

 drivers/clk/samsung/clk-cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 93e961855875..89b24fd5d0a9 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -135,16 +135,16 @@ static void wait_until_divider_stable(void __iomem *div_reg, unsigned long mask)
  * value was changed.
  */
 static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
-				  unsigned long mux_value)
+				  unsigned long mask, unsigned long mux_value)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(MAX_STAB_TIME);
 
 	do {
-		if (((readl(mux_reg) >> mux_pos) & MUX_MASK) == mux_value)
+		if (((readl(mux_reg) >> mux_pos) & mask) == mux_value)
 			return;
 	} while (time_before(jiffies, timeout));
 
-	if (((readl(mux_reg) >> mux_pos) & MUX_MASK) == mux_value)
+	if (((readl(mux_reg) >> mux_pos) & mask) == mux_value)
 		return;
 
 	pr_err("%s: re-parenting mux timed-out\n", __func__);
@@ -249,7 +249,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	/* select sclk_mpll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg | (1 << 16), base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 16, 2);
+	wait_until_mux_stable(base + regs->mux_stat, 16, MUX_MASK, 2);
 
 	/* alternate parent is active now. set the dividers */
 	writel(div0, base + regs->div_cpu0);
@@ -290,7 +290,7 @@ static int exynos_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
 	/* select mout_apll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg & ~(1 << 16), base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 16, 1);
+	wait_until_mux_stable(base + regs->mux_stat, 16, MUX_MASK, 1);
 
 	if (cpuclk->flags & CLK_CPU_NEEDS_DEBUG_ALT_DIV) {
 		div |= (cfg_data->div0 & E4210_DIV0_ATB_MASK);
@@ -362,7 +362,7 @@ static int exynos5433_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	/* select the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg | 1, base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 0, 2);
+	wait_until_mux_stable(base + regs->mux_stat, 0, MUX_MASK, 2);
 
 	/* alternate parent is active now. set the dividers */
 	writel(div0, base + regs->div_cpu0);
@@ -390,7 +390,7 @@ static int exynos5433_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
 	/* select apll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg & ~1, base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 0, 1);
+	wait_until_mux_stable(base + regs->mux_stat, 0, MUX_MASK, 1);
 
 	exynos_set_safe_div(cpuclk, div, div_mask);
 	spin_unlock_irqrestore(cpuclk->lock, flags);
-- 
2.39.2


