Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2D07306E9
	for <lists+linux-clk@lfdr.de>; Wed, 14 Jun 2023 20:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240783AbjFNSFi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Jun 2023 14:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbjFNSEy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 14:04:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C4F26BE
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f649db9b25so9040285e87.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765887; x=1689357887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J74hRLqdt4phs0w4W6UJv8aBJOI01g/JO9GJ5bngPB0=;
        b=aJft9mlYztYXjpqZB04XC1o8/3JEVe7q+IhZdoS04JzIW+Bxccn1JyhO8ucm4r5XAL
         uaZwuBTyVtvePfl7uvmnhdwjWYjltNEaZXWAYoGwnE6uUsS1fE0GuUYdaQtSrXTcW3/C
         aGTr6siT1RInQL/SzA9SWuLgrXtrGWeqdqze4jLeE7ootKJEvbX5/gyVfnfDVDTwWssl
         XgsmnqPcxY5bDPv31w1OZF4PljVoJZScTb2uZkhZYNgnxn5C7KW9K8urUlDFlz/BK55S
         FrUATfUmSOUYhp3dV9KqOTurOelcv3SelQVL2gmA4NTHfZo8SRXEHXR3axxkWOWOddsb
         4lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765887; x=1689357887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J74hRLqdt4phs0w4W6UJv8aBJOI01g/JO9GJ5bngPB0=;
        b=gKnr7waKjUmcmeOLUz52Q0rHlkbXPPqitJzmZxXVRK891KL3xuG85etDBWVNg3NvGF
         Irzc7raER09lherds195aOmPTW9XnXIews+EemYAV3WuAsCc1eBeqRHixnTdSr8XRjDP
         So4+S7F0h1jlC7pDXOv9A4jLMm31HXTqyLEwxtxDnWynlW4jzLsrEsaaE1cWbGldUzAw
         PekF533sNc6fmLftmxkOJdu+Z3gwDNS3hbQqlQ8U3cF5j1Tpn3mcVVsla+B9yqIgVY1g
         e0kws6tezd1Wsop/wtzulEBgVC0rjbbo0l4rYFEXvrbw+xmNC+Hci9BB1wEzH/0up6Zz
         52XA==
X-Gm-Message-State: AC+VfDxCwalW1HANKldwZNDNzmLy/Ic2seyBesex4/Fav7TFz6rE8q6f
        gTQFIHgpXqQHd5hpsDgnEpUhJg==
X-Google-Smtp-Source: ACHHUZ672V+6XbQkVKXR8YYblH3aL/UgXv+4sxCLSH/fHh8s0F22yKCKPz3WvpNfLgDhya9E+UwLRA==
X-Received: by 2002:ac2:5bca:0:b0:4f6:2c03:36b0 with SMTP id u10-20020ac25bca000000b004f62c0336b0mr8039232lfn.26.1686765887589;
        Wed, 14 Jun 2023 11:04:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:28 +0200
Subject: [PATCH v6 09/22] interconnect: qcom: smd-rpm: Add rpmcc handling
 skeleton code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-9-263283111e66@linaro.org>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765872; l=3261;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=q5JnbdD4AZQp53PuMKdCoeW41i5whKLsOXgMlTL64nI=;
 b=tafWmjRtwf+e8Suf9DtjEJQCeY2j9wH0XotnHZCko9vHv9bf1sFuh7Y6XEwih31jHwJBEwxj7
 1YIhEZFvBEFBgMODgZ+3PcSoWUMdJFrrlfVNP304vDARdlVQ3THNzVG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce qcom_icc_rpm_set_bus_rate() in preparation for handling RPM
clock resources within the interconnect framework. This lets us greatly
simplify all of the code handling, as setting the rate comes down to:

u32 rate_khz = max(clk.sleep_rate, clk.active_rate, clk_a.active_rate)
write_to_rpm(clock.description, rate_khz);

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.h | 15 +++++++++++++++
 drivers/interconnect/qcom/smd-rpm.c | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 4755e422d2d1..5c43a8023ffa 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -25,6 +25,18 @@ enum qcom_icc_type {
 	QCOM_ICC_QNOC,
 };
 
+/**
+ * struct rpm_clk_resource - RPM bus clock resource
+ * @resource_type: RPM resource type of the clock resource
+ * @clock_id: index of the clock resource of a specific resource type
+ * @branch: whether the resource represents a branch clock
+*/
+struct rpm_clk_resource {
+	u32 resource_type;
+	u32 clock_id;
+	bool branch;
+};
+
 #define NUM_BUS_CLKS	2
 
 /**
@@ -50,6 +62,7 @@ struct qcom_icc_provider {
 	unsigned int qos_offset;
 	u64 bus_clk_rate[NUM_BUS_CLKS];
 	struct clk_bulk_data bus_clks[NUM_BUS_CLKS];
+	const struct rpm_clk_resource *bus_clk_desc;
 	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
 	bool is_on;
@@ -107,6 +120,7 @@ struct qcom_icc_desc {
 	struct qcom_icc_node * const *nodes;
 	size_t num_nodes;
 	const char * const *bus_clocks;
+	const struct rpm_clk_resource *bus_clk_desc;
 	const char * const *intf_clocks;
 	size_t num_intf_clocks;
 	bool keep_alive;
@@ -128,5 +142,6 @@ int qnoc_remove(struct platform_device *pdev);
 
 bool qcom_icc_rpm_smd_available(void);
 int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val);
+int qcom_icc_rpm_set_bus_rate(const struct rpm_clk_resource *clk, int ctx, u32 rate);
 
 #endif
diff --git a/drivers/interconnect/qcom/smd-rpm.c b/drivers/interconnect/qcom/smd-rpm.c
index b0183262ba66..24bc994e1a12 100644
--- a/drivers/interconnect/qcom/smd-rpm.c
+++ b/drivers/interconnect/qcom/smd-rpm.c
@@ -16,6 +16,7 @@
 #include "icc-rpm.h"
 
 #define RPM_KEY_BW		0x00007762
+#define QCOM_RPM_SMD_KEY_RATE	0x007a484b
 
 static struct qcom_smd_rpm *icc_smd_rpm;
 
@@ -44,6 +45,26 @@ int qcom_icc_rpm_smd_send(int ctx, int rsc_type, int id, u32 val)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_rpm_smd_send);
 
+int qcom_icc_rpm_set_bus_rate(const struct rpm_clk_resource *clk, int ctx, u32 rate)
+{
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(QCOM_RPM_SMD_KEY_RATE),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+	};
+
+	/* Branch clocks are only on/off */
+	if (clk->branch)
+		rate = !!rate;
+
+	req.value = cpu_to_le32(rate);
+	return qcom_rpm_smd_write(icc_smd_rpm,
+				  ctx,
+				  clk->resource_type,
+				  clk->clock_id,
+				  &req, sizeof(req));
+}
+EXPORT_SYMBOL_GPL(qcom_icc_rpm_set_bus_rate);
+
 static int qcom_icc_rpm_smd_remove(struct platform_device *pdev)
 {
 	icc_smd_rpm = NULL;

-- 
2.41.0

