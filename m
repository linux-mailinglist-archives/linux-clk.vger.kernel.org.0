Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFEE717AF6
	for <lists+linux-clk@lfdr.de>; Wed, 31 May 2023 11:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjEaJBh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 May 2023 05:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbjEaJBc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 05:01:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BA611F
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af2c7f2883so58973591fa.3
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523689; x=1688115689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwKzCoB/TILHKyYpnl4R4TBT0ZP2W8fCrxJWyMABiAg=;
        b=VEGUj0x9Uzf8Pr5fl4WpLLIvhZBGhzK4Q4mHOJp7suaXLvfHMv8N5fPWEGjp9CdlWs
         Lksbh9LvBEdK8N21eKo0gl0ZiZB5wJoy/G6swWYe29TmlNq7uONg1xQFwtyxs4ctoZJl
         CpoaYoFdIbgVJHhku72BprC4KSqX+dQ0Z5sogbU4KEqFUtRViwGIDF8QaE3SQk2hql/5
         e9Kbd90BAVc+ncYxnSRYQu0ZGTeOv7gsb6uvxPwdRPS/vtAFyCSwYrzPOP79bxmb+Pcv
         9Xk53QUfhvnWZOdOGmJwZD5yRELyIq35B1DlpCoyaM4RUcR74uSQrw0Lce9hFDgDht54
         upOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523689; x=1688115689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwKzCoB/TILHKyYpnl4R4TBT0ZP2W8fCrxJWyMABiAg=;
        b=ZcvHo0QxBAtoqZ1l7aKxq2+jFFG5IPWGQLZ4EkaIvseBzAYhMZBnrDrD7WQPs3UpZO
         BQGaSYW48VHBM1YlVfSkss9Ur8A0wmmghgpmOlUPPHteArHb8QevAn3Id6QQXkeJNGom
         wtrMPIdH8i6lIdZhVgezE9Z2QzOBoyY+/2kFdO/+raMSAK+c5wNba8pXGsBOZ/f10m/t
         CbY2G5dQGCHEvZ/2gyAhFfmA5onys+ZYWdl0u0h8/pMh81hEJv+Db1j2Rcbq6xyJP70e
         XaABC2zFSyZ8qd+K4U/XDi0+Gh4qiUGqusmFUMimu2KZjupuBx9UCdylVDjzWiyO6Hwg
         WK7Q==
X-Gm-Message-State: AC+VfDxMlNlt40PlUc/boZ/mki+munyrkVlW82OKsJAWTCcteGSDmNba
        2GhANwaP01drHMGMEwnx/6DJcg==
X-Google-Smtp-Source: ACHHUZ5eeMdogXUkIZOGHqySKWYHoayjit9FS3WVhcQFuA/mcrIpJjfpQZOK2mPjgdom1ljzUvl5+g==
X-Received: by 2002:a2e:2c06:0:b0:2af:18c3:8bd5 with SMTP id s6-20020a2e2c06000000b002af18c38bd5mr2308261ljs.14.1685523689448;
        Wed, 31 May 2023 02:01:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e9184000000b002adbe01cd69sm3217446ljg.9.2023.05.31.02.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:01:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 11:01:20 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: msm8998: Properly describe MMSS SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v1-1-2b5a8fc90991@linaro.org>
References: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685523686; l=1326;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=i0NwJMAAnRECp+k7KcPhWAOJXSM4/4ftIM+77PjbY6U=;
 b=BGyufNvhaW0pxT12xw1LjSk1u+kvz6rfQ1SRXNhMYH3mgey6Icz+rTWlHdTqfAz2wnjT6t3Md
 MZ5/Y3eyck+A2AoAIcZW/PS3Wr7F3rDncrHYuSykoAPO3FHLjrNNxYF
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

The MMSS SMMU has been abusingly consuming the exposed RPM interconnect
clock and not describing the power domain it needs. Put an end to that.

Fixes: 05ce21b54423 ("arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f0e943ff0046..a4016085b750 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2737,10 +2737,10 @@ mmss_smmu: iommu@cd00000 {
 
 			clocks = <&mmcc MNOC_AHB_CLK>,
 				 <&mmcc BIMC_SMMU_AHB_CLK>,
-				 <&rpmcc RPM_SMD_MMAXI_CLK>,
 				 <&mmcc BIMC_SMMU_AXI_CLK>;
-			clock-names = "iface-mm", "iface-smmu",
-				      "bus-mm", "bus-smmu";
+			clock-names = "iface-mm",
+				      "iface-smmu",
+				      "bus-smmu";
 
 			#global-interrupts = <0>;
 			interrupts =
@@ -2764,6 +2764,8 @@ mmss_smmu: iommu@cd00000 {
 				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&mmcc BIMC_SMMU_GDSC>;
 		};
 
 		remoteproc_adsp: remoteproc@17300000 {

-- 
2.40.1

