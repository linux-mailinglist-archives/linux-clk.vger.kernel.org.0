Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8AF6E1507
	for <lists+linux-clk@lfdr.de>; Thu, 13 Apr 2023 21:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjDMTRa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Apr 2023 15:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjDMTRV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 15:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB3183E6
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681413351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fEno2IWkUzFj29uJBLwx+d+I43Od4gaX+U+WEKiwH6s=;
        b=dcpJWKlmuGt0P2rQxJsWznuXWTz/hdaI3xOwbu703UluF2DBV0J24LKpNH4fawFrowVS58
        gOXPTiCpHpSJBCGIoNd1iz3NIyRbu9ELqcNxLx+vdB1UU8h3H8mJDyO5kqdHuwrJO4SOsy
        dzx1QRxRgmejJQBscCr37dmrISMjp1A=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-2XfxJOv8NyG2XRu35QCMAA-1; Thu, 13 Apr 2023 15:15:50 -0400
X-MC-Unique: 2XfxJOv8NyG2XRu35QCMAA-1
Received: by mail-yb1-f200.google.com with SMTP id 65-20020a250244000000b00b8f53d3e51cso4186317ybc.20
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681413350; x=1684005350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEno2IWkUzFj29uJBLwx+d+I43Od4gaX+U+WEKiwH6s=;
        b=ZWlA2LIiC7GsbzC7Xxevs7AflcqJBsN2o+Tt99U25xDYqXVPkiVwXbJqRVNnQuorUr
         pkSsW09y9eyOHUB52wBTbHNfQLs7fUs38jp5IE6fDNv69nYOya4Mvv0p04PxgmsjtI2u
         SSqcibDJo2TfJJGYKwfZjSJhMoj3AelaOYKDrXX9nZLYTZWVBXNeMSBrmCpHBW9i4Ij8
         QSQhb7B3Ntcih61laOVFV4YRzMB9uhOgFyjmdI5pd7FfMnuvGiBXgzdd+55+excP8Th4
         e3Upm1+3ElYf/yO2d9zWCyfLsxJcDq+rpjGGbZLr7ERoDYmG75+lI+Wak1Ab7CFpfGue
         lvlA==
X-Gm-Message-State: AAQBX9ektszkVFOzP+Uf8dnu6E/Laxf+N3oz2D9I5nXZV4iCpwSmjY9M
        +opyyUF7cmRKqXzWaab6mo8Wwr3aLF9XxoxWr9WtmP7KNMb+Ce1E8kvXnXxpXkELAwvOesdrUmq
        8E4j7H1ckvHS8Jt1z+V9M
X-Received: by 2002:a0d:f684:0:b0:54c:5c8:a391 with SMTP id g126-20020a0df684000000b0054c05c8a391mr2599331ywf.17.1681413350054;
        Thu, 13 Apr 2023 12:15:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350bHbGIQofLRPOMmHAj0myzlOt8hgVHye3/1Gnd8hH/LkDHhOGimSeGuQZ7/E9FQ/Ar9WITXkg==
X-Received: by 2002:a0d:f684:0:b0:54c:5c8:a391 with SMTP id g126-20020a0df684000000b0054c05c8a391mr2599320ywf.17.1681413349787;
        Thu, 13 Apr 2023 12:15:49 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id t11-20020a81780b000000b00545a4ec318dsm673203ywc.13.2023.04.13.12.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 12:15:49 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v5 1/3] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Date:   Thu, 13 Apr 2023 14:15:39 -0500
Message-Id: <20230413191541.1073027-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413191541.1073027-1-ahalaney@redhat.com>
References: <20230413191541.1073027-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the EMAC GDSCs to allow the EMAC hardware to be enabled.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v4:
    * Add Tested-by (Brian)

Changes since v3:
    * None

Changes since v2:
    * Add Konrad's Reviewed-by

Changes since v1:
    * Add Stephen's Acked-by
    * Explicitly tested on x13s laptop with no noticeable side effect (Konrad)

 drivers/clk/qcom/gcc-sc8280xp.c               | 18 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b3198784e1c3..04a99dbaa57e 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6873,6 +6873,22 @@ static struct gdsc usb30_sec_gdsc = {
 	.pwrsts = PWRSTS_RET_ON,
 };
 
+static struct gdsc emac_0_gdsc = {
+	.gdscr = 0xaa004,
+	.pd = {
+		.name = "emac_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc emac_1_gdsc = {
+	.gdscr = 0xba004,
+	.pd = {
+		.name = "emac_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
 	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
@@ -7351,6 +7367,8 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
 	[USB30_MP_GDSC] = &usb30_mp_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
+	[EMAC_0_GDSC] = &emac_0_gdsc,
+	[EMAC_1_GDSC] = &emac_1_gdsc,
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index cb2fb638825c..721105ea4fad 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -492,5 +492,7 @@
 #define USB30_MP_GDSC					9
 #define USB30_PRIM_GDSC					10
 #define USB30_SEC_GDSC					11
+#define EMAC_0_GDSC					12
+#define EMAC_1_GDSC					13
 
 #endif
-- 
2.39.2

