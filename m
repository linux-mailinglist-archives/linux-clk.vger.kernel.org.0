Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDB272FC92
	for <lists+linux-clk@lfdr.de>; Wed, 14 Jun 2023 13:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbjFNLgD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Jun 2023 07:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244081AbjFNLf5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 07:35:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90E6199B
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 04:35:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8379172e87.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686742555; x=1689334555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT0FhlQTqZJwPJ3Zh5frLeDreQMYYDJ2nQ7BrmaR2ho=;
        b=YEDYdRbkwtTcCZpnfO3XSRU5W8zNnW9TGdiUJIewFY6rzAh9+ldajb/ReUCuiVqvgu
         Co2qOHiv+8hSJ4be6PuIo4zh6iE5g+u6w66GUdOyaeTamMB+uaKZiOVSfN/HFH6B4Rht
         yoDKyE7W7mYYnpNSPWkRSokjT/7VqBUxxJoEUN8h9t/SMu277sLP5MzdEZnNmvwOr2em
         zrt/O8RaX2vCiUruKiV74yzcHsYok1wJ2fpTsB/xiL+pOSH996r1YHQI7E8A/s+XHTjb
         9phkL2s5Um4Z8wtijDyWaX8pszunlfjOCAzeJVJmh6WY+ICpALWrR8EJsPPoOYNNc2zz
         qffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742555; x=1689334555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT0FhlQTqZJwPJ3Zh5frLeDreQMYYDJ2nQ7BrmaR2ho=;
        b=fHIGwF0VxYgnMCwUosFFC5c86WX9LqkUgNjW0fiZmG9OYJ3gPlNPWkc0djndbmPp2/
         fkpeXAzM3F0AMGg02PVQWN4Od4ZvhgVzwnOj4gCrIzB4e4pEvWNHiFOpkXs6WyTKPvgm
         j59a7tZPYG88SDUEZ/offnzAA+I9nZFkMhSJMJOZeGic8Nu0DIlIvxlrAhatyuDClR/r
         PDIEoUCu5TT/RYPWZ7uBqw+Y6ug0MP8uMdOwOBl0BKWmSnr7nmleddxNm46M4BCCt2vL
         m3ynsnx8A2hlyUTciwX0wtZdFBMa0YOovxRHVuIFu5k01JcSMt3x2RRbNGp71oKtZhb8
         2KRg==
X-Gm-Message-State: AC+VfDwH2C3jIu4/13Q2WoIlJzc0fINNAEa8R4Mdb9NybShyrmwUOkTV
        GUT8fPCBK4yvx5ERaf1jUwP8jg==
X-Google-Smtp-Source: ACHHUZ5muu6w2LniG99CPtvkiIdie2btUG3ZPtShEgWaaBJcDaXpYP+5e6eN9kTFS0cXrcIWIF/2CA==
X-Received: by 2002:ac2:5f9b:0:b0:4ed:d2cf:857b with SMTP id r27-20020ac25f9b000000b004edd2cf857bmr7373622lfe.5.1686742554922;
        Wed, 14 Jun 2023 04:35:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id x1-20020ac25dc1000000b004f64b8eee61sm2088406lfq.97.2023.06.14.04.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 04:35:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 13:35:35 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6350: Add QFPROM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-lagoon_gpu-v2-4-afcdfb18bb13@linaro.org>
References: <20230315-topic-lagoon_gpu-v2-0-afcdfb18bb13@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v2-0-afcdfb18bb13@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686742545; l=1015;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TggODcqRcO65aCiU+0R8QACbCdlm3fHtH5g6iGTdYXg=;
 b=eik+ywxR3TJ0062wxnoAh1itVOjRVx4cRNY4gXrs+/1XC65DLXtb0Ai5VgZ+8NbsHdhKiX2fv
 efNQbzK5jJtDtCRmhKZ7FbMXdmy4/CU6bsEIIyIZbL4xOvpJmUac82E
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add a node for the QFPROM NVMEM hw and define the GPU fuse.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index fd35810bcfb5..c0f34bc1d78c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -805,6 +805,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: qfprom@784000 {
+			compatible = "qcom,sm6350-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@2015 {
+				reg = <0x2015 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		rng: rng@793000 {
 			compatible = "qcom,prng-ee";
 			reg = <0 0x00793000 0 0x1000>;

-- 
2.41.0

