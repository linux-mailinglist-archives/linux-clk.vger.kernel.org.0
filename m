Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17EAD4CAFE0
	for <lists+linux-clk@lfdr.de>; Wed,  2 Mar 2022 21:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243759AbiCBUcb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Mar 2022 15:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243770AbiCBUcT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 15:32:19 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB11CD0040
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 12:31:25 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id gb21so2797693pjb.5
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 12:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WWC9dqBz+lDH+nVtZcEeQtAyALBaRdonpw4pBAJ7QQM=;
        b=dJbI8R7OHXHwQk4Dldy/InhjylGtauQIqBg6uzpcdWBZEZm+LTXtSmYd34fbkwCe5i
         e/sg3bpiATOobW5QXMbJrnwCapsuH4wlNbrmaYa62f9/oeYg07v6wu+ODZWbUKR6Gkce
         G9iKeGKuyLZ+l95OYtBr//KNsCPhM/DE4/FJqvVj5G+i481Dqb2vkpLDEFMvGXQigcEu
         +pQLnxbVpjoSz/DTdq3hzgxrEk07OH7YzHa/BK2BmO13EbrHw6hI0AZuVPX6Yxto7oXh
         dLRsUOalTSQx5fMk482ZSvabLbwfzz196c/kc9iIyVZr8OiOjXi94NQjJj7Oc3t1IjcW
         KvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WWC9dqBz+lDH+nVtZcEeQtAyALBaRdonpw4pBAJ7QQM=;
        b=Jsel+ubmrTZIdEXswGKPbiBQ8gtKIZwp1MYa1SyeLzukMrFPVchFoWnNyVbfQAH629
         zXmob4DD2I7xWMnFwBJDwo++Ghlrk/RRbicwTErNwwZgNLs0BdxXZbVquDFD7d31KuzZ
         VHdV53ryjihxK6XhBrHv7v9ZlP5IEcnjjwd0N0yTfeqXIzy/gvLQY9QsXc9oOMpswYcA
         Gw0p5o1wcZg8UkRv5j7w6j/t5VMoPYAN73dV9oTDDkY3H87ao5es9g2tHlwnVzsEL2og
         Ob+MOEpv6XrFh0THBhyf0aajowgYqOkq3Gtg35/GpkYk2lN0FBvg1OWAbSPg4S9kaEKb
         H2jA==
X-Gm-Message-State: AOAM530EwzrA4cBkhcpj4+aACQi31qg3AHltF8MBqTe3VR9rp//e1gRb
        BhG7IUe+ElB2oP2eevvQ7VWjAA==
X-Google-Smtp-Source: ABdhPJxltN/KLZpliXQJocHT1h1XwitZuKd+FFHlQwKvMtW9dW1b6myW+oMBuqBcDoJP79mnyu/cOg==
X-Received: by 2002:a17:90a:ae11:b0:1be:efe6:4c6c with SMTP id t17-20020a17090aae1100b001beefe64c6cmr1637194pjq.128.1646253085071;
        Wed, 02 Mar 2022 12:31:25 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090aa58100b001bcb7bad374sm5963410pjq.17.2022.03.02.12.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:31:24 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 5/7] PCI: qcom: Add SM8150 SoC support
Date:   Thu,  3 Mar 2022 02:00:43 +0530
Message-Id: <20220302203045.184500-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
References: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PCIe IP (rev 1.5.0) on SM8150 SoC is similar to the one used on
SM8250. Hence the support is added reusing the members of ops_1_9_0.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c19cd506ed3f..564e2f10ea65 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1511,6 +1511,13 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 	.ops = &ops_2_7_0,
 };
 
+static const struct qcom_pcie_cfg sm8150_cfg = {
+	/* sm8150 has qcom IP rev 1.5.0. However 1.5.0 ops are same as
+	 * 1.9.0, so reuse the same.
+	 */
+	.ops = &ops_1_9_0,
+};
+
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
 };
@@ -1626,6 +1633,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
+	{ .compatible = "qcom,pcie-sm8150", .data = &sm8150_cfg },
 	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
-- 
2.35.1

