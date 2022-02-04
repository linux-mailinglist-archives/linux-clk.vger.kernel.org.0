Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C63F4A9B4F
	for <lists+linux-clk@lfdr.de>; Fri,  4 Feb 2022 15:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359437AbiBDOq6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Feb 2022 09:46:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359447AbiBDOq6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Feb 2022 09:46:58 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C24C061714
        for <linux-clk@vger.kernel.org>; Fri,  4 Feb 2022 06:46:57 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id o17so8861769ljp.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Feb 2022 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1j2Q5XxkmWrr7M0KKFyu0KiO6cRW71BJZcx3JxtL2w=;
        b=ainVI4CEOf94KXd/b/UCZEE37fzAFUz1AZzfVMkBnGgoZHbUymgeaxSRzyCcxG5nDb
         UN5XgQKg2B4g2HqN4QarLWhRANAwDlykcN0GPZtnGqDBDHYAAGTviJwjoKwHih6z7xI2
         rYpGN7LZcJUJgzazbG2AmjAe8LF1p10BHor/FMQATYHuH9bUVGHxAYK4KnXBRZozarga
         Kp8Wp6odpsE3YuFip7M0GfnRyYdxzeeo/rvQkmJPo+fffzn9n9tc0s+of2qLUHwiChFt
         gsBfbNn8zU93mNengHYaFFqWEO/1Uxn371gPQXNZWfK3vezeupVaFabvWVeI9pwkFjjm
         cIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1j2Q5XxkmWrr7M0KKFyu0KiO6cRW71BJZcx3JxtL2w=;
        b=TpeCz/Y92JMcpGnAZVYvXmmTKGKWqw9DM3Wfg5D3vZoxr76wDJ8cL/dLuRDrKo9D7v
         ixznKoK+UH9F0AVM3vojJOQF0faYJVqI2W/igC04XBEWZjvMuGgHYwaDb/koKjQ8lDXR
         4iiy9YtyrP3nli3T27B5uOutcx3s1E6Aj4PqoEM6vNHvfJAdbd3fY48JxZID89lqQN0v
         ypGTgRGyObfHLjchbLteGepuGOIKLKuI//9kCvz3tX48+i3QCTnpvOWafNez433ldaOD
         VBrfeaPeFN6PKPSDucMoXewy1O2QSs/KzZkUyy8aKuuVD1NYGJZPYjmRZ0obUGwfHoS2
         rlgg==
X-Gm-Message-State: AOAM530Vsy63LNzJeX+fTYpIna+aZ+6XzZzY0Uyo2xAxyVq+TEmS6jqg
        Rw7fOmN6SGVlQF/1r6jTBPtagQ==
X-Google-Smtp-Source: ABdhPJzWW0z3SGSltZDbb869075XfBoW6NZXPOlLdEedYo2bmbGY5Ciuvlpil0HmrpQtyXso5PJS9w==
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr1961399ljj.215.1643986015812;
        Fri, 04 Feb 2022 06:46:55 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y23sm348222lfb.2.2022.02.04.06.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 06:46:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 10/11] PCI: qcom: Add ddrss_sf_tbu flag
Date:   Fri,  4 Feb 2022 17:46:44 +0300
Message-Id: <20220204144645.3016603-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
References: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Qualcomm PCIe driver uses compatible string to check if the ddrss_sf_tbu
clock should be used. Since sc7280 support has added flags, switch to
the new mechanism to check if this clock should be used.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 3a0da577b75d..6034a933814d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -189,6 +189,7 @@ struct qcom_pcie_ops {
 
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
+	bool has_ddrss_sf_tbu_clk;
 };
 
 struct qcom_pcie {
@@ -1131,7 +1132,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[3].id = "bus_slave";
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
-	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250")) {
+	if (pcie->cfg->has_ddrss_sf_tbu_clk) {
 		res->clks[6].id = "ddrss_sf_tbu";
 		res->num_clks = 7;
 	} else {
@@ -1430,6 +1431,7 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
+	.has_ddrss_sf_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
-- 
2.34.1

