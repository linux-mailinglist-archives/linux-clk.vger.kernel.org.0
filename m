Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1126D25A9
	for <lists+linux-clk@lfdr.de>; Fri, 31 Mar 2023 18:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjCaQez (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 31 Mar 2023 12:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjCaQe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 12:34:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464201FD2E;
        Fri, 31 Mar 2023 09:31:10 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-248-213-136.ewe-ip-backbone.de [91.248.213.136])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A834660319B;
        Fri, 31 Mar 2023 17:31:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680280268;
        bh=i9BGs9btRS2BixYzGSGiY/eZWnra7PBJGPH/Gfsqa5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SJ/LjGbI66nhSuRZXYkGXnqnwz0uAZB+ruqqNBAOrtyg0QpLNdNIJ+rU4ykx28gEA
         uIEEwak+ANqFBVilGO47JbjBB/i9GszhHec58FO/R4M/94lHcTgIPqrZP3UHmsGCUb
         tyVYrSN3v9ZraU3WeqATVPtr3x1gcLCKo+WSa2Po+q9xZwti2H+pkgeInEZrFlAHbr
         00J1JR1XsWclHnmyv5Iuy+dGoMwzD7wdbm7gunxqyfj7t8fIzHH9x5ujTG1vzyr9mg
         K2jaIjkOV5OOMlaqwlsuHZMzQgyXusyrYbToZfVvXh82fmiMIHjIhDSaixGk64C+6k
         QYdfO+CK05xTw==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 5C1344807E3; Fri, 31 Mar 2023 18:31:06 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Jagan Teki <jagan@edgeble.ai>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv1 2/2] soc: rockchip: power-domain: add rk3588 mem module support
Date:   Fri, 31 Mar 2023 18:30:58 +0200
Message-Id: <20230331163058.5688-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331163058.5688-1-sebastian.reichel@collabora.com>
References: <20230331163058.5688-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

On RK3588 it's also possible to power down the memory used by the
particular power domains via PMU_MEM_PWR_GATE_SFTCON. This adds
support for this feature.

Co-Developed-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/soc/rockchip/pm_domains.c | 160 +++++++++++++++++++++++-------
 1 file changed, 125 insertions(+), 35 deletions(-)

diff --git a/drivers/soc/rockchip/pm_domains.c b/drivers/soc/rockchip/pm_domains.c
index 84bc022f9e5b..8b3c745925a3 100644
--- a/drivers/soc/rockchip/pm_domains.c
+++ b/drivers/soc/rockchip/pm_domains.c
@@ -43,8 +43,10 @@ struct rockchip_domain_info {
 	bool active_wakeup;
 	int pwr_w_mask;
 	int req_w_mask;
+	int mem_status_mask;
 	int repair_status_mask;
 	u32 pwr_offset;
+	u32 mem_offset;
 	u32 req_offset;
 };
 
@@ -54,6 +56,9 @@ struct rockchip_pmu_info {
 	u32 req_offset;
 	u32 idle_offset;
 	u32 ack_offset;
+	u32 mem_pwr_offset;
+	u32 chain_status_offset;
+	u32 mem_status_offset;
 	u32 repair_status_offset;
 
 	u32 core_pwrcnt_offset;
@@ -119,13 +124,15 @@ struct rockchip_pmu {
 	.active_wakeup = wakeup,			\
 }
 
-#define DOMAIN_M_O_R(_name, p_offset, pwr, status, r_status, r_offset, req, idle, ack, wakeup)	\
+#define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup)	\
 {							\
 	.name = _name,					\
 	.pwr_offset = p_offset,				\
 	.pwr_w_mask = (pwr) << 16,			\
 	.pwr_mask = (pwr),				\
 	.status_mask = (status),			\
+	.mem_offset = m_offset,				\
+	.mem_status_mask = (m_status),			\
 	.repair_status_mask = (r_status),		\
 	.req_offset = r_offset,				\
 	.req_w_mask = (req) << 16,			\
@@ -269,8 +276,8 @@ void rockchip_pmu_unblock(void)
 }
 EXPORT_SYMBOL_GPL(rockchip_pmu_unblock);
 
-#define DOMAIN_RK3588(name, p_offset, pwr, status, r_status, r_offset, req, idle, wakeup)	\
-	DOMAIN_M_O_R(name, p_offset, pwr, status, r_status, r_offset, req, idle, idle, wakeup)
+#define DOMAIN_RK3588(name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, wakeup)	\
+	DOMAIN_M_O_R(name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, idle, wakeup)
 
 static bool rockchip_pmu_domain_is_idle(struct rockchip_pm_domain *pd)
 {
@@ -408,17 +415,92 @@ static bool rockchip_pmu_domain_is_on(struct rockchip_pm_domain *pd)
 	return !(val & pd->info->status_mask);
 }
 
+static bool rockchip_pmu_domain_is_mem_on(struct rockchip_pm_domain *pd)
+{
+	struct rockchip_pmu *pmu = pd->pmu;
+	unsigned int val;
+
+	regmap_read(pmu->regmap,
+		    pmu->info->mem_status_offset + pd->info->mem_offset, &val);
+
+	/* 1'b0: power on, 1'b1: power off */
+	return !(val & pd->info->mem_status_mask);
+}
+
+static bool rockchip_pmu_domain_is_chain_on(struct rockchip_pm_domain *pd)
+{
+	struct rockchip_pmu *pmu = pd->pmu;
+	unsigned int val;
+
+	regmap_read(pmu->regmap,
+		    pmu->info->chain_status_offset + pd->info->mem_offset, &val);
+
+	/* 1'b1: power on, 1'b0: power off */
+	return val & pd->info->mem_status_mask;
+}
+
+static int rockchip_pmu_domain_mem_reset(struct rockchip_pm_domain *pd)
+{
+	struct rockchip_pmu *pmu = pd->pmu;
+	struct generic_pm_domain *genpd = &pd->genpd;
+	bool is_on;
+	int ret = 0;
+
+	ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_chain_on, pd, is_on,
+					is_on == true, 0, 10000);
+	if (ret) {
+		dev_err(pmu->dev,
+			"failed to get chain status '%s', target_on=1, val=%d\n",
+			genpd->name, is_on);
+		goto error;
+	}
+
+	udelay(20);
+
+	regmap_write(pmu->regmap, pmu->info->mem_pwr_offset + pd->info->pwr_offset,
+		     (pd->info->pwr_mask | pd->info->pwr_w_mask));
+	dsb(sy);
+
+	ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_mem_on, pd, is_on,
+					is_on == false, 0, 10000);
+	if (ret) {
+		dev_err(pmu->dev,
+			"failed to get mem status '%s', target_on=0, val=%d\n",
+			genpd->name, is_on);
+		goto error;
+	}
+
+	regmap_write(pmu->regmap, pmu->info->mem_pwr_offset + pd->info->pwr_offset,
+		     pd->info->pwr_w_mask);
+	dsb(sy);
+
+	ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_mem_on, pd, is_on,
+					is_on == true, 0, 10000);
+	if (ret) {
+		dev_err(pmu->dev,
+			"failed to get mem status '%s', target_on=1, val=%d\n",
+			genpd->name, is_on);
+	}
+
+error:
+	return ret;
+}
+
 static void rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
 					     bool on)
 {
 	struct rockchip_pmu *pmu = pd->pmu;
 	struct generic_pm_domain *genpd = &pd->genpd;
 	u32 pd_pwr_offset = pd->info->pwr_offset;
-	bool is_on;
+	bool is_on, is_mem_on = false;
 
 	if (pd->info->pwr_mask == 0)
 		return;
-	else if (pd->info->pwr_w_mask)
+
+	if (on && pd->info->mem_status_mask)
+		is_mem_on = rockchip_pmu_domain_is_mem_on(pd);
+
+	if (pd->info->pwr_w_mask)
 		regmap_write(pmu->regmap, pmu->info->pwr_offset + pd_pwr_offset,
 			     on ? pd->info->pwr_w_mask :
 			     (pd->info->pwr_mask | pd->info->pwr_w_mask));
@@ -428,6 +510,9 @@ static void rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
 
 	wmb();
 
+	if (is_mem_on && rockchip_pmu_domain_mem_reset(pd))
+		return;
+
 	if (readx_poll_timeout_atomic(rockchip_pmu_domain_is_on, pd, is_on,
 				      is_on == on, 0, 10000)) {
 		dev_err(pmu->dev,
@@ -645,7 +730,9 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	pd->genpd.flags = GENPD_FLAG_PM_CLK;
 	if (pd_info->active_wakeup)
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
-	pm_genpd_init(&pd->genpd, NULL, !rockchip_pmu_domain_is_on(pd));
+	pm_genpd_init(&pd->genpd, NULL,
+		      !rockchip_pmu_domain_is_on(pd) ||
+		      (pd->info->mem_status_mask && !rockchip_pmu_domain_is_mem_on(pd)));
 
 	pmu->genpd_data.domains[id] = &pd->genpd;
 	return 0;
@@ -1024,35 +1111,35 @@ static const struct rockchip_domain_info rk3568_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3588_pm_domains[] = {
-	[RK3588_PD_GPU]		= DOMAIN_RK3588("gpu",     0x0, BIT(0),  0,       BIT(1),  0x0, BIT(0),  BIT(0),  false),
-	[RK3588_PD_NPU]		= DOMAIN_RK3588("npu",     0x0, BIT(1),  BIT(1),  0,       0x0, 0,       0,       false),
-	[RK3588_PD_VCODEC]	= DOMAIN_RK3588("vcodec",  0x0, BIT(2),  BIT(2),  0,       0x0, 0,       0,       false),
-	[RK3588_PD_NPUTOP]	= DOMAIN_RK3588("nputop",  0x0, BIT(3),  0,       BIT(2),  0x0, BIT(1),  BIT(1),  false),
-	[RK3588_PD_NPU1]	= DOMAIN_RK3588("npu1",    0x0, BIT(4),  0,       BIT(3),  0x0, BIT(2),  BIT(2),  false),
-	[RK3588_PD_NPU2]	= DOMAIN_RK3588("npu2",    0x0, BIT(5),  0,       BIT(4),  0x0, BIT(3),  BIT(3),  false),
-	[RK3588_PD_VENC0]	= DOMAIN_RK3588("venc0",   0x0, BIT(6),  0,       BIT(5),  0x0, BIT(4),  BIT(4),  false),
-	[RK3588_PD_VENC1]	= DOMAIN_RK3588("venc1",   0x0, BIT(7),  0,       BIT(6),  0x0, BIT(5),  BIT(5),  false),
-	[RK3588_PD_RKVDEC0]	= DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),  0,       BIT(7),  0x0, BIT(6),  BIT(6),  false),
-	[RK3588_PD_RKVDEC1]	= DOMAIN_RK3588("rkvdec1", 0x0, BIT(9),  0,       BIT(8),  0x0, BIT(7),  BIT(7),  false),
-	[RK3588_PD_VDPU]	= DOMAIN_RK3588("vdpu",    0x0, BIT(10), 0,       BIT(9),  0x0, BIT(8),  BIT(8),  false),
-	[RK3588_PD_RGA30]	= DOMAIN_RK3588("rga30",   0x0, BIT(11), 0,       BIT(10), 0x0, 0,       0,       false),
-	[RK3588_PD_AV1]		= DOMAIN_RK3588("av1",     0x0, BIT(12), 0,       BIT(11), 0x0, BIT(9),  BIT(9),  false),
-	[RK3588_PD_VI]		= DOMAIN_RK3588("vi",      0x0, BIT(13), 0,       BIT(12), 0x0, BIT(10), BIT(10), false),
-	[RK3588_PD_FEC]		= DOMAIN_RK3588("fec",     0x0, BIT(14), 0,       BIT(13), 0x0, 0,       0,       false),
-	[RK3588_PD_ISP1]	= DOMAIN_RK3588("isp1",    0x0, BIT(15), 0,       BIT(14), 0x0, BIT(11), BIT(11), false),
-	[RK3588_PD_RGA31]	= DOMAIN_RK3588("rga31",   0x4, BIT(0),  0,       BIT(15), 0x0, BIT(12), BIT(12), false),
-	[RK3588_PD_VOP]		= DOMAIN_RK3588("vop",     0x4, BIT(1),  0,       BIT(16), 0x0, BIT(13) | BIT(14), BIT(13) | BIT(14), false),
-	[RK3588_PD_VO0]		= DOMAIN_RK3588("vo0",     0x4, BIT(2),  0,       BIT(17), 0x0, BIT(15), BIT(15), false),
-	[RK3588_PD_VO1]		= DOMAIN_RK3588("vo1",     0x4, BIT(3),  0,       BIT(18), 0x4, BIT(0),  BIT(16), false),
-	[RK3588_PD_AUDIO]	= DOMAIN_RK3588("audio",   0x4, BIT(4),  0,       BIT(19), 0x4, BIT(1),  BIT(17), false),
-	[RK3588_PD_PHP]		= DOMAIN_RK3588("php",     0x4, BIT(5),  0,       BIT(20), 0x4, BIT(5),  BIT(21), false),
-	[RK3588_PD_GMAC]	= DOMAIN_RK3588("gmac",    0x4, BIT(6),  0,       BIT(21), 0x0, 0,       0,       false),
-	[RK3588_PD_PCIE]	= DOMAIN_RK3588("pcie",    0x4, BIT(7),  0,       BIT(22), 0x0, 0,       0,       true),
-	[RK3588_PD_NVM]		= DOMAIN_RK3588("nvm",     0x4, BIT(8),  BIT(24), 0,       0x4, BIT(2),  BIT(18), false),
-	[RK3588_PD_NVM0]	= DOMAIN_RK3588("nvm0",    0x4, BIT(9),  0,       BIT(23), 0x0, 0,       0,       false),
-	[RK3588_PD_SDIO]	= DOMAIN_RK3588("sdio",    0x4, BIT(10), 0,       BIT(24), 0x4, BIT(3),  BIT(19), false),
-	[RK3588_PD_USB]		= DOMAIN_RK3588("usb",     0x4, BIT(11), 0,       BIT(25), 0x4, BIT(4),  BIT(20), true),
-	[RK3588_PD_SDMMC]	= DOMAIN_RK3588("sdmmc",   0x4, BIT(13), 0,       BIT(26), 0x0, 0,       0,       false),
+	[RK3588_PD_GPU]		= DOMAIN_RK3588("gpu",     0x0, BIT(0),  0,       0x0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false),
+	[RK3588_PD_NPU]		= DOMAIN_RK3588("npu",     0x0, BIT(1),  BIT(1),  0x0, 0,       0,       0x0, 0,       0,       false),
+	[RK3588_PD_VCODEC]	= DOMAIN_RK3588("vcodec",  0x0, BIT(2),  BIT(2),  0x0, 0,       0,       0x0, 0,       0,       false),
+	[RK3588_PD_NPUTOP]	= DOMAIN_RK3588("nputop",  0x0, BIT(3),  0,       0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false),
+	[RK3588_PD_NPU1]	= DOMAIN_RK3588("npu1",    0x0, BIT(4),  0,       0x0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false),
+	[RK3588_PD_NPU2]	= DOMAIN_RK3588("npu2",    0x0, BIT(5),  0,       0x0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false),
+	[RK3588_PD_VENC0]	= DOMAIN_RK3588("venc0",   0x0, BIT(6),  0,       0x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false),
+	[RK3588_PD_VENC1]	= DOMAIN_RK3588("venc1",   0x0, BIT(7),  0,       0x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false),
+	[RK3588_PD_RKVDEC0]	= DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),  0,       0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false),
+	[RK3588_PD_RKVDEC1]	= DOMAIN_RK3588("rkvdec1", 0x0, BIT(9),  0,       0x0, BIT(17), BIT(8),  0x0, BIT(7),  BIT(7),  false),
+	[RK3588_PD_VDPU]	= DOMAIN_RK3588("vdpu",    0x0, BIT(10), 0,       0x0, BIT(18), BIT(9),  0x0, BIT(8),  BIT(8),  false),
+	[RK3588_PD_RGA30]	= DOMAIN_RK3588("rga30",   0x0, BIT(11), 0,       0x0, BIT(19), BIT(10), 0x0, 0,       0,       false),
+	[RK3588_PD_AV1]		= DOMAIN_RK3588("av1",     0x0, BIT(12), 0,       0x0, BIT(20), BIT(11), 0x0, BIT(9),  BIT(9),  false),
+	[RK3588_PD_VI]		= DOMAIN_RK3588("vi",      0x0, BIT(13), 0,       0x0, BIT(21), BIT(12), 0x0, BIT(10), BIT(10), false),
+	[RK3588_PD_FEC]		= DOMAIN_RK3588("fec",     0x0, BIT(14), 0,       0x0, BIT(22), BIT(13), 0x0, 0,       0,       false),
+	[RK3588_PD_ISP1]	= DOMAIN_RK3588("isp1",    0x0, BIT(15), 0,       0x0, BIT(23), BIT(14), 0x0, BIT(11), BIT(11), false),
+	[RK3588_PD_RGA31]	= DOMAIN_RK3588("rga31",   0x4, BIT(0),  0,       0x0, BIT(24), BIT(15), 0x0, BIT(12), BIT(12), false),
+	[RK3588_PD_VOP]		= DOMAIN_RK3588("vop",     0x4, BIT(1),  0,       0x0, BIT(25), BIT(16), 0x0, BIT(13) | BIT(14), BIT(13) | BIT(14), false),
+	[RK3588_PD_VO0]		= DOMAIN_RK3588("vo0",     0x4, BIT(2),  0,       0x0, BIT(26), BIT(17), 0x0, BIT(15), BIT(15), false),
+	[RK3588_PD_VO1]		= DOMAIN_RK3588("vo1",     0x4, BIT(3),  0,       0x0, BIT(27), BIT(18), 0x4, BIT(0),  BIT(16), false),
+	[RK3588_PD_AUDIO]	= DOMAIN_RK3588("audio",   0x4, BIT(4),  0,       0x0, BIT(28), BIT(19), 0x4, BIT(1),  BIT(17), false),
+	[RK3588_PD_PHP]		= DOMAIN_RK3588("php",     0x4, BIT(5),  0,       0x0, BIT(29), BIT(20), 0x4, BIT(5),  BIT(21), false),
+	[RK3588_PD_GMAC]	= DOMAIN_RK3588("gmac",    0x4, BIT(6),  0,       0x0, BIT(30), BIT(21), 0x0, 0,       0,       false),
+	[RK3588_PD_PCIE]	= DOMAIN_RK3588("pcie",    0x4, BIT(7),  0,       0x0, BIT(31), BIT(22), 0x0, 0,       0,       true),
+	[RK3588_PD_NVM]		= DOMAIN_RK3588("nvm",     0x4, BIT(8),  BIT(24), 0x4, 0,       0,       0x4, BIT(2),  BIT(18), false),
+	[RK3588_PD_NVM0]	= DOMAIN_RK3588("nvm0",    0x4, BIT(9),  0,       0x4, BIT(1),  BIT(23), 0x0, 0,       0,       false),
+	[RK3588_PD_SDIO]	= DOMAIN_RK3588("sdio",    0x4, BIT(10), 0,       0x4, BIT(2),  BIT(24), 0x4, BIT(3),  BIT(19), false),
+	[RK3588_PD_USB]		= DOMAIN_RK3588("usb",     0x4, BIT(11), 0,       0x4, BIT(3),  BIT(25), 0x4, BIT(4),  BIT(20), true),
+	[RK3588_PD_SDMMC]	= DOMAIN_RK3588("sdmmc",   0x4, BIT(13), 0,       0x4, BIT(5),  BIT(26), 0x0, 0,       0,       false),
 };
 
 static const struct rockchip_pmu_info px30_pmu = {
@@ -1207,6 +1294,9 @@ static const struct rockchip_pmu_info rk3588_pmu = {
 	.req_offset = 0x10c,
 	.idle_offset = 0x120,
 	.ack_offset = 0x118,
+	.mem_pwr_offset = 0x1a0,
+	.chain_status_offset = 0x1f0,
+	.mem_status_offset = 0x1f8,
 	.repair_status_offset = 0x290,
 
 	.num_domains = ARRAY_SIZE(rk3588_pm_domains),
-- 
2.39.2

