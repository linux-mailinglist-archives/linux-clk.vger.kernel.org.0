Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6186614E4AC
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2020 22:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgA3VNr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Jan 2020 16:13:47 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36219 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgA3VMy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jan 2020 16:12:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id gv17so1885363pjb.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2020 13:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0XoSuGyqNEgB75IwM+XmimRDu75qzQuIcV/EwSuAJM=;
        b=jMU9zGKgBOBNllW9XZIw0g9AOLLZ5Vj2JIaOdChfocVUyNqDD4m6qBdopC/RE6PUJH
         fCVpq66hw6aTVQJxY86HFMSzfd/b+TUu0i75shdttFKG2Ys0VeOEacgB4bTrDt82h8kD
         D0cS2v0Z7/RPVbl2wz8j2u3Cg5FmGNCuxDMzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0XoSuGyqNEgB75IwM+XmimRDu75qzQuIcV/EwSuAJM=;
        b=Mm/iq4oKUF4Knu1sWOYAPT+OHtW9K0XcEaRXJfnoEBTnOo5kjB/JhR2+cRHh6FF4B6
         A7ZxTGFFw9iGn+muK0TvSI6i63PhLH58vqndeW4y7Ov+BXGoTo341YkLuoY0eLzKY8TD
         7l+wJ9dqNWlVsu62Wx0vlgsThB2H3olex0dsJbGhtjz8MgNFqDZ3MECZt+/MxT9uuND1
         epzhz0FjliUGdVYxX8Ekx4yBE5ipvmfZ7Gr+lictSL3Uq+A5y2FOksmoz/6wwQazCwcq
         SfehzJhzBKBpk+k2oUKeRa4Qzn4FL2/pRMOFD0Yc9H0vrhgqSfqooXeC4xWPY8z054sB
         PqIQ==
X-Gm-Message-State: APjAAAXAvR7msSYcKyFyLMrby5JN5caIUh/ESgkmBt1+ynQ/mt7DrCFd
        7h6gd6LZG1nz/oo2JRovwbVI9Q==
X-Google-Smtp-Source: APXvYqynCN6w21P8hmWBFQ1aqUqYCVjtZhBJEtINjT7jo1jag3FXsGA/Luh9zWpaQq2LkwWTRW6QOg==
X-Received: by 2002:a17:902:9342:: with SMTP id g2mr6378449plp.339.1580418773549;
        Thu, 30 Jan 2020 13:12:53 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:12:53 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/15] clk: qcom: Get rid of fallback global names for dispcc-sc7180
Date:   Thu, 30 Jan 2020 13:12:20 -0800
Message-Id: <20200130131220.v3.4.Ia3706a5d5add72e88dbff60fd13ec06bf7a2fd48@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the new world input clocks should be matched by ".fw_name".  sc7180
is new enough that no backward compatibility use of global names
should be needed.  Remove it.

With a proper device tree and downstream display patches I have
verified booting a sc7180 up and seeing the display after this patch.

Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Get rid of fallback...dispcc-sc7180") split out for v3.
- Unlike in v2, use internal name instead of purist name.

Changes in v2: None

 drivers/clk/qcom/dispcc-sc7180.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 30c1e25d3edb..a820e1558677 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -81,7 +81,7 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -93,10 +93,9 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
-	{ .fw_name = "dp_phy_pll_vco_div_clk",
-				.name = "dp_phy_pll_vco_div_clk"},
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "dp_phy_pll_link_clk" },
+	{ .fw_name = "dp_phy_pll_vco_div_clk" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -107,9 +106,8 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk",
-				.name = "dsi0_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -125,7 +123,7 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
 	{ .hw = &disp_cc_pll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -137,7 +135,7 @@ static const struct parent_map disp_cc_parent_map_4[] = {
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -148,9 +146,8 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk",
-				.name = "dsi0_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
-- 
2.25.0.341.g760bfbb309-goog

