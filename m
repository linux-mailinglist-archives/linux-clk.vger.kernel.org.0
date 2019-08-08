Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C58786E86
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2019 01:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404558AbfHHXrD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Aug 2019 19:47:03 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:12811 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404428AbfHHXrD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Aug 2019 19:47:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4cb4780001>; Thu, 08 Aug 2019 16:47:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 16:47:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 08 Aug 2019 16:47:02 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 23:47:02 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 23:47:02 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Aug 2019 23:47:02 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.110]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4cb4750004>; Thu, 08 Aug 2019 16:47:01 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>,
        <rjw@rjwysocki.net>, <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH v8 01/21] pinctrl: tegra: Fix write barrier placement in pmx_writel
Date:   Thu, 8 Aug 2019 16:46:40 -0700
Message-ID: <1565308020-31952-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565308024; bh=T0hWkMA7tg/ATUVmKaM0W8R8UCCke0gXGlSnoSao7QA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dW5zAICIci4d3L+OGJSb36xBzsKxNRj2JDnWjg0uLubLbv1IqliyrOlSBVkkep1z8
         RKdl9krgJwXV8NPBxgk6Tlp6TePx/QMvGf03PajVYd3zheR74ceO9ksOTydeMv4k5D
         1jG/duE0z19uikiPkMoeaztomqnBzJVuT1UUbbsEczIA3s5ly24OO6RzHzICqMKb3u
         ZNW+j3tvhQK/a5/eQB/CzBEDxD3A4uGIDtrixS8eAy7sF/LE/bf9VD5+1lHgRhWWow
         smDE5IHiW57sSVqUfZXRKfF8GdnVNoIeJisBRNILhfEJztMox4WYJLTGeg99ykJzJq
         chrlqcNHZcIxQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

pmx_writel uses writel which inserts write barrier before the
register write rather.

This patch has fix to replace writel with writel_relaxed followed
by a write barrier to ensure write operation before the barrier
is completed for successful pinctrl change.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index e3a237534281..982ee634b3b1 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -32,7 +32,9 @@ static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 
 static inline void pmx_writel(struct tegra_pmx *pmx, u32 val, u32 bank, u32 reg)
 {
-	writel(val, pmx->regs[bank] + reg);
+	writel_relaxed(val, pmx->regs[bank] + reg);
+	/* make sure pinmux register write completed */
+	wmb();
 }
 
 static int tegra_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
-- 
2.7.4

