Return-Path: <linux-clk+bounces-20201-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9224A7DB37
	for <lists+linux-clk@lfdr.de>; Mon,  7 Apr 2025 12:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FCBE1892646
	for <lists+linux-clk@lfdr.de>; Mon,  7 Apr 2025 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF53D231C9F;
	Mon,  7 Apr 2025 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6YkbIKY"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864232309AD;
	Mon,  7 Apr 2025 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021699; cv=none; b=DR0oH/xampBpYiS6QlCJOEplp3L8jpCrKTRwLyEV6cIG2hkCzu59NNUpcd58CMhrpTEzDazE0nEQWhFp6WYeJsn57b0V+E0Mp3wY8mGv3qB/plj59RK95SEKTBNp+esLzpZ/0JZHziptGFAW1JZPm6Ju1ioh0wxwoysQUGWBxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021699; c=relaxed/simple;
	bh=Iq+d8+KNth2nrBHa0/Mo3Pmi8HpSU+Mwsq7ExAcOZMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQ1sjvw3uk8BgX0sFDBkz+MMxgUqQ8bOdx8Qbgn9gRuSfE8hItjG2a3QyMavQRSkHRfFjV3K2r+mKvDPaDvYirVouCqWyXwAPHOzJ9nH1o0QOOCPQIgKrCy+jJ99a5UZAtz20KU90ylnzwTgIg2LA/0v/tp8RYrZJ7fS8M11sHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6YkbIKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B3EAC4CEF0;
	Mon,  7 Apr 2025 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744021699;
	bh=Iq+d8+KNth2nrBHa0/Mo3Pmi8HpSU+Mwsq7ExAcOZMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J6YkbIKYYYu945x2MS5NvgNokyXFBLxmx2vdiCPetohwEI4sOtETdischc+tFxVVX
	 4UNDzhhLRPUqsU2bBmOhihCVkBXok+K3FOocBqtXcyfm2517J3z7w9tyX0wiB3tiuL
	 PStdsXvMcVIvBvkJxne9AOvNHTHW2aUQiiUMKqM9uuuNIXWSHmSZUTFqZRFN6j32iv
	 KXcpl4XP7N+i3VLUaWrQSvVc5knCsL7ccKgDLvO15DLvH1LCFvc421JUQ901esYlNz
	 6OcnNOE3Cv9yVfxaUJY56N8saadxX0ZZxQutQVCwXkvvOnn3SLgh+/5wbR8XGfBjUy
	 hLFCcU6MoTNaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31642C369A2;
	Mon,  7 Apr 2025 10:28:19 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Mon, 07 Apr 2025 11:28:18 +0100
Subject: [PATCH v3 4/6] clk: clk-axi-clkgen: detect axi_clkgen_limits at
 runtime
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-dev-axi-clkgen-limits-v3-4-33c7f27c9d69@analog.com>
References: <20250407-dev-axi-clkgen-limits-v3-0-33c7f27c9d69@analog.com>
In-Reply-To: <20250407-dev-axi-clkgen-limits-v3-0-33c7f27c9d69@analog.com>
To: linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744021699; l=3698;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=iBmfD8SeeesocRGR7ow2MXwCfnSXtfBsCbwFv9xpXxk=;
 b=K01RSyoiK8pVy3wGTN0J2DCVAYKrP31FAHvA97wxGn2ecEfqv61/tIs2W3V91hKmYouKAFE2X
 xlzdruBuBYmALjm/q+9xW4cZ0zwVl6288k3pgONx3M7wrcdJEOhAjg1
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

This patch adds support for setting the limits in struct
axi_clkgen_limits  in accordance with fpga speed grade, voltage,
technology and family. This new information is extracted from
two new registers implemented in the ip core that are only available
for core versions higher or equal to 4.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk-axi-clkgen.c | 62 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 2a95f9b220234a1245024a821c50e1eb9c104ac9..8c270ba7626bc24c4385615b7aa08ee95e198881 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -16,6 +16,8 @@
 #include <linux/mod_devicetable.h>
 #include <linux/err.h>
 
+#include <linux/fpga/adi-axi-common.h>
+
 #define AXI_CLKGEN_V2_REG_RESET		0x40
 #define AXI_CLKGEN_V2_REG_CLKSEL	0x44
 #define AXI_CLKGEN_V2_REG_DRP_CNTRL	0x70
@@ -497,6 +499,54 @@ static u8 axi_clkgen_get_parent(struct clk_hw *clk_hw)
 	return parent;
 }
 
+static int axi_clkgen_setup_limits(struct axi_clkgen *axi_clkgen,
+				   struct device *dev)
+{
+	unsigned int tech, family, speed_grade, reg_value;
+
+	axi_clkgen_read(axi_clkgen, ADI_AXI_REG_FPGA_INFO, &reg_value);
+	tech = ADI_AXI_INFO_FPGA_TECH(reg_value);
+	family = ADI_AXI_INFO_FPGA_FAMILY(reg_value);
+	speed_grade = ADI_AXI_INFO_FPGA_SPEED_GRADE(reg_value);
+
+	axi_clkgen->limits.fpfd_min = 10000;
+	axi_clkgen->limits.fvco_min = 600000;
+
+	switch (speed_grade) {
+	case ADI_AXI_FPGA_SPEED_1 ... ADI_AXI_FPGA_SPEED_1LV:
+		axi_clkgen->limits.fvco_max = 1200000;
+		axi_clkgen->limits.fpfd_max = 450000;
+		break;
+	case ADI_AXI_FPGA_SPEED_2 ... ADI_AXI_FPGA_SPEED_2LV:
+		axi_clkgen->limits.fvco_max = 1440000;
+		axi_clkgen->limits.fpfd_max = 500000;
+		if (family == ADI_AXI_FPGA_FAMILY_KINTEX || family == ADI_AXI_FPGA_FAMILY_ARTIX) {
+			axi_clkgen_read(axi_clkgen, ADI_AXI_REG_FPGA_VOLTAGE,
+					&reg_value);
+			if (ADI_AXI_INFO_FPGA_VOLTAGE(reg_value) < 950) {
+				axi_clkgen->limits.fvco_max = 1200000;
+				axi_clkgen->limits.fpfd_max = 450000;
+			}
+		}
+		break;
+	case ADI_AXI_FPGA_SPEED_3:
+		axi_clkgen->limits.fvco_max = 1600000;
+		axi_clkgen->limits.fpfd_max = 550000;
+		break;
+	default:
+		return dev_err_probe(dev, -ENODEV, "Unknown speed grade %d\n",
+				     speed_grade);
+	};
+
+	/* Overwrite vco limits for ultrascale+ */
+	if (tech == ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS) {
+		axi_clkgen->limits.fvco_max = 1600000;
+		axi_clkgen->limits.fvco_min = 800000;
+	}
+
+	return 0;
+}
+
 static const struct clk_ops axi_clkgen_ops = {
 	.recalc_rate = axi_clkgen_recalc_rate,
 	.determine_rate = axi_clkgen_determine_rate,
@@ -511,6 +561,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 {
 	const struct axi_clkgen_limits *dflt_limits;
 	struct axi_clkgen *axi_clkgen;
+	unsigned int pcore_version;
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
@@ -556,7 +607,16 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 			return -EINVAL;
 	}
 
-	memcpy(&axi_clkgen->limits, dflt_limits, sizeof(axi_clkgen->limits));
+	axi_clkgen_read(axi_clkgen, ADI_AXI_REG_VERSION, &pcore_version);
+
+	if (ADI_AXI_PCORE_VER_MAJOR(pcore_version) > 0x04) {
+		ret = axi_clkgen_setup_limits(axi_clkgen, &pdev->dev);
+		if (ret)
+			return ret;
+	} else {
+		memcpy(&axi_clkgen->limits, dflt_limits,
+		       sizeof(axi_clkgen->limits));
+	}
 
 	clk_name = pdev->dev.of_node->name;
 	of_property_read_string(pdev->dev.of_node, "clock-output-names",

-- 
2.49.0



