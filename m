Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017E772B79C
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 07:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbjFLFkI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 01:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbjFLFjr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 01:39:47 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7231E10F3
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f649db9b25so4445495e87.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548376; x=1689140376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12KfBxyupk1YLsR4LfK27MLdb2HYA0IiWo4sN5Ku4D4=;
        b=Ka13oZ3EaGZGnegDgOIKIXuUZ+aZ3PPJt+Xxn85S5YjsGU+iuXRZLrdVLqwCcXf64L
         vToUpgOmPKhiX0p9cZAQUffzICJBOxxRuMD8f1QzBv1b7xT+XRSyogN1i8Rv2hxcIVZg
         CW2ZN1vkuQh6hxog8c1jfyk/C/bSca5pBYzKjZqiONJB4qhKXQxr721gMf3Zr92PDyR0
         IC+pwPSJxmVxTdevVoiiHJ1ZoiADNXJEfwjXVN2b1jvI8XJ/bYfFh+vjhGpuR30u6VYE
         dxHM2c9EiTU5DuFcf6w1CDALui6mE39ZmA8dJhIMbb+oyJG+WWf9wxv4KuQT4mdUj82/
         ljXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548376; x=1689140376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12KfBxyupk1YLsR4LfK27MLdb2HYA0IiWo4sN5Ku4D4=;
        b=GWU58zICUd3dobxB4VDuKH1deoM00LjRB7kt70v9nsxce86CK6DECQlP5zJ1AStT2c
         bLSsEdJMPMg/h8K3e3GeCY0yu0X4wqlY8aqWtwOwfrHLxPDWudHtlAQF0hTjIxj5hveB
         UMZT2I2s81HY/6XPvfMBFGx1m4BDLAiRCykWiUCZPfCoKfsKo1N+/Bl4r5wspvRZ9TJX
         +cOnu1daonuu+gKL/13i6OnbpUuxKLr3nCJRqyhdrv3ajFaK7nBkVGhv4x/WQ/+sIDX/
         q0OcPpq41hNYF6ANhmqe0w6DuKOZNDf+gErVGc1frcvEsN/4Iwh93FqOggoB+f7IhJ3L
         iAnw==
X-Gm-Message-State: AC+VfDzL/96Pv4UDHOI/v0ED3tZif5NTS1pmrNdj6YSYYNEqP0bcuuEJ
        6orgi+EB/pBPX5AMuXkjSNzl5A==
X-Google-Smtp-Source: ACHHUZ6tRyWuhGaJHuJgq6ONXEmBjmav9NmZMlUJkr9sjZNQzFup9241oHZ34rm7IGfGWTrUB1ldVQ==
X-Received: by 2002:a19:4307:0:b0:4f6:437b:b131 with SMTP id q7-20020a194307000000b004f6437bb131mr2515444lfa.58.1686548375803;
        Sun, 11 Jun 2023 22:39:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 12/18] ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
Date:   Mon, 12 Jun 2023 08:39:16 +0300
Message-Id: <20230612053922.3284394-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
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

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,spm.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d2289205ff81..471eeca6a589 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -422,25 +422,25 @@ acc3: clock-controller@20b8000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: power-controller@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: power-controller@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw2: power-controller@20a9000 {
+		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw3: power-controller@20b9000 {
+		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
-- 
2.39.2

