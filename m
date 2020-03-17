Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B141882C0
	for <lists+linux-clk@lfdr.de>; Tue, 17 Mar 2020 12:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCQL7U (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Mar 2020 07:59:20 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:18671 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726852AbgCQL7T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Mar 2020 07:59:19 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 48hWtF3Jj6z10h;
        Tue, 17 Mar 2020 12:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1584446357; bh=YDLY5FGk5ezE2D74yK2q49/v1sYP+aO1kVO+bT17lz4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=QKthxDcVSj1gPXS9IyIn4d/2us8KAHXv0Jv6fjz/N9v9buHjrEwz7OAOltT27aWgU
         HKVvE0z8ziqYsxwH+Yal4fWGKkcXwShtFUya6veKZOdeYyR8sIKr4SjOv6xp1JSrHX
         tMtUupDjbJFssPsLYN8HfoK6BLMaRBQ2rgaDZE4JuWGrLQctxnGhPC7pTLICoyh4Ol
         2HsM+THB8St+ujCl0lz9PCh+4ZmHxCKo1luQZxNYOIKGqmCFel5c+8M3t5py/jIVd8
         bBR9L//AThYJmptNjr2n9t6j8whiWC+peADRKcSI8emMTJHxAmgzsc28QqobKUYfFl
         ad35Dm+vRlUmw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 17 Mar 2020 12:59:17 +0100
Message-Id: <e397446e159ce0894033ce4ed25997d3627cbb17.1584446053.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1584446053.git.mirq-linux@rere.qmqm.pl>
References: <cover.1584446053.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 2/3] clk: at91: allow setting PCKx parent via DT
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This exposes PROGx clocks for use in assigned-clocks DeviceTree property
for selecting PCKx parent clock.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
v2: rebase and update to clk/clk-at91 branch
---
 drivers/clk/at91/at91sam9260.c   |  5 ++++-
 drivers/clk/at91/at91sam9g45.c   |  4 +++-
 drivers/clk/at91/at91sam9n12.c   |  4 +++-
 drivers/clk/at91/at91sam9rl.c    |  4 +++-
 drivers/clk/at91/at91sam9x5.c    |  4 +++-
 drivers/clk/at91/pmc.c           | 12 ++++++++++--
 drivers/clk/at91/pmc.h           |  5 ++++-
 drivers/clk/at91/sam9x60.c       |  4 +++-
 drivers/clk/at91/sama5d2.c       |  4 +++-
 drivers/clk/at91/sama5d3.c       |  4 +++-
 drivers/clk/at91/sama5d4.c       |  4 +++-
 include/dt-bindings/clock/at91.h |  1 +
 12 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 946f03a09858..7e5ff252fffc 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -354,7 +354,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc = pmc_data_allocate(PMC_MAIN + 1,
 					    ndck(data->sck, data->num_sck),
-					    ndck(data->pck, data->num_pck), 0);
+					    ndck(data->pck, data->num_pck),
+					    0, data->num_progck);
 	if (!at91sam9260_pmc)
 		return;
 
@@ -434,6 +435,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 						    &at91rm9200_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		at91sam9260_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < data->num_sck; i++) {
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index 53e8252b8a63..5d18eb04c218 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -117,7 +117,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	at91sam9g45_pmc = pmc_data_allocate(PMC_MAIN + 1,
 					    nck(at91sam9g45_systemck),
-					    nck(at91sam9g45_periphck), 0);
+					    nck(at91sam9g45_periphck), 0, 2);
 	if (!at91sam9g45_pmc)
 		return;
 
@@ -182,6 +182,8 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 						    &at91sam9g45_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		at91sam9g45_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_systemck); i++) {
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index f3ae1cd3cb8d..3a2564c2f724 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -129,7 +129,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 		return;
 
 	at91sam9n12_pmc = pmc_data_allocate(PMC_MAIN + 1,
-					   nck(at91sam9n12_systemck), 31, 0);
+					   nck(at91sam9n12_systemck), 31, 0, 2);
 	if (!at91sam9n12_pmc)
 		return;
 
@@ -198,6 +198,8 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 						    &at91sam9x5_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		at91sam9n12_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(at91sam9n12_systemck); i++) {
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index cc739d214ae3..bcf07f6a0e0e 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -89,7 +89,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 
 	at91sam9rl_pmc = pmc_data_allocate(PMC_MAIN + 1,
 					   nck(at91sam9rl_systemck),
-					   nck(at91sam9rl_periphck), 0);
+					   nck(at91sam9rl_periphck), 0, 2);
 	if (!at91sam9rl_pmc)
 		return;
 
@@ -138,6 +138,8 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 						    &at91rm9200_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		at91sam9rl_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(at91sam9rl_systemck); i++) {
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index aac99d699568..f13756b407e2 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -151,7 +151,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		return;
 
 	at91sam9x5_pmc = pmc_data_allocate(PMC_MAIN + 1,
-					   nck(at91sam9x5_systemck), 31, 0);
+					   nck(at91sam9x5_systemck), 31, 0, 2);
 	if (!at91sam9x5_pmc)
 		return;
 
@@ -227,6 +227,8 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 						    &at91sam9x5_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		at91sam9x5_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(at91sam9x5_systemck); i++) {
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index fe788512fcc0..874385c981f7 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -67,6 +67,10 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data)
 		if (idx < pmc_data->ngck)
 			return pmc_data->ghws[idx];
 		break;
+	case PMC_TYPE_PROGRAMMABLE:
+		if (idx < pmc_data->npck)
+			return pmc_data->pchws[idx];
+		break;
 	default:
 		break;
 	}
@@ -77,9 +81,10 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data)
 }
 
 struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
-				   unsigned int nperiph, unsigned int ngck)
+				   unsigned int nperiph, unsigned int ngck,
+				   unsigned int npck)
 {
-	unsigned int num_clks = ncore + nsystem + nperiph + ngck;
+	unsigned int num_clks = ncore + nsystem + nperiph + ngck + npck;
 	struct pmc_data *pmc_data;
 
 	pmc_data = kzalloc(sizeof(*pmc_data) + num_clks * sizeof(struct clk_hw *),
@@ -99,6 +104,9 @@ struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
 	pmc_data->ngck = ngck;
 	pmc_data->ghws = pmc_data->phws + nperiph;
 
+	pmc_data->npck = npck;
+	pmc_data->pchws = pmc_data->ghws + ngck;
+
 	return pmc_data;
 }
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 49cc3d67b98e..bf44ee5d1b79 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -24,6 +24,8 @@ struct pmc_data {
 	struct clk_hw **phws;
 	unsigned int ngck;
 	struct clk_hw **ghws;
+	unsigned int npck;
+	struct clk_hw **pchws;
 
 	struct clk_hw *hwtable[0];
 };
@@ -96,7 +98,8 @@ struct clk_pcr_layout {
 #define ndck(a, s) (a[s - 1].id + 1)
 #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
 struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
-				   unsigned int nperiph, unsigned int ngck);
+				   unsigned int nperiph, unsigned int ngck,
+				   unsigned int npck);
 
 int of_at91_get_clk_range(struct device_node *np, const char *propname,
 			  struct clk_range *range);
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index a7d4f648db26..db14e0427c7f 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -185,7 +185,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc = pmc_data_allocate(PMC_MAIN + 1,
 					nck(sam9x60_systemck),
 					nck(sam9x60_periphck),
-					nck(sam9x60_gck));
+					nck(sam9x60_gck), 8);
 	if (!sam9x60_pmc)
 		return;
 
@@ -255,6 +255,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 						    &sam9x60_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		sam9x60_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(sam9x60_systemck); i++) {
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index b2560670e5af..ae5e83cadb3d 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -169,7 +169,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	sama5d2_pmc = pmc_data_allocate(PMC_I2S1_MUX + 1,
 					nck(sama5d2_systemck),
 					nck(sama5d2_periph32ck),
-					nck(sama5d2_gck));
+					nck(sama5d2_gck), 3);
 	if (!sama5d2_pmc)
 		return;
 
@@ -267,6 +267,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 						    &sama5d2_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		sama5d2_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(sama5d2_systemck); i++) {
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 914e6f225510..507eef6797f1 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -127,7 +127,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 
 	sama5d3_pmc = pmc_data_allocate(PMC_MAIN + 1,
 					nck(sama5d3_systemck),
-					nck(sama5d3_periphck), 0);
+					nck(sama5d3_periphck), 0, 3);
 	if (!sama5d3_pmc)
 		return;
 
@@ -201,6 +201,8 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 						    &at91sam9x5_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		sama5d3_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(sama5d3_systemck); i++) {
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 4ca9a4619500..80692902b4e4 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -142,7 +142,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc = pmc_data_allocate(PMC_MCK2 + 1,
 					nck(sama5d4_systemck),
-					nck(sama5d4_periph32ck), 0);
+					nck(sama5d4_periph32ck), 0, 3);
 	if (!sama5d4_pmc)
 		return;
 
@@ -224,6 +224,8 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 						    &at91sam9x5_programmable_layout);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		sama5d4_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(sama5d4_systemck); i++) {
diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 38b5554153c8..c3f4aa6a2d29 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -12,6 +12,7 @@
 #define PMC_TYPE_SYSTEM		1
 #define PMC_TYPE_PERIPHERAL	2
 #define PMC_TYPE_GCK		3
+#define PMC_TYPE_PROGRAMMABLE	4
 
 #define PMC_SLOW		0
 #define PMC_MCK			1
-- 
2.20.1

