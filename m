Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5F72B7B4
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 07:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjFLFka (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 01:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235688AbjFLFj7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 01:39:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5240E1984
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:51 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f655293a38so4112688e87.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548381; x=1689140381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3KfhKRM2Bpo1zmKLCtOCcwF4OmfBaYvC1ZALMgeIRg=;
        b=blRhZQakA5n+RjIiR5NEcHL6LC6qslAhKpdeuaIHkvHQHfK6rIxzbBvzdRLu0qfWri
         OlCCQKAaJLC48lhY5LKbcmD3PAcA1Xjs5MFh913/Nu5NUTY7Cd+E7YUnvMzygVxLy3HI
         lw0tAtNXQiZjlziW5WJZsABt+WJrSAda2DlBPYCe83hZH/amcIdKnPZohdMrwqAVsj2W
         Ne8OSXV3sOqgtNQ8jkX6/z62UUVucMiNdTvI3NClcd5QPrB0He430+yeLN+fbH007zc0
         ZdGrQMpb5r8f5re/FK17rhtUBoEQGX/Exa2haOZhXDodwDTGmYpf3dcm+v7hNoB2Cfj9
         GvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548381; x=1689140381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3KfhKRM2Bpo1zmKLCtOCcwF4OmfBaYvC1ZALMgeIRg=;
        b=VbwdqGdvmRaPYuHdvF0RkpSEtN2zYZun1ItSv55sx75DobeO27qKLhYkHaEo10SCga
         7SBuMZMUZz1PrmU9NP1xLbyaAchuLAVuDeAwPLW+yTdxkf6xhLXNeP8v8X9odBqDe+ut
         VoOArg65itbtseYb6gQmbAnmKjQlOepJEb8QiO5I3aDYtlDmuse96j/qMfNZPOK7VIr9
         o2Rm5rhDNRgd2S3kzkQuGB7RS9O4HufY4eO6qVgw0jAD/n4HRCf10uu7SAHjG9ifwFn0
         xtyuF+21i/f4cm2x4UuLkgIUPyaia74jlUVE3q1oNIOqE/IaYQrF690CUgIdpojBd59o
         9twg==
X-Gm-Message-State: AC+VfDwrNUmJJL9vkS+IP9auQ+Lshw+6gm8RNQZObpd0LAth7XJ83V3r
        g67K87CmsK4R7frDRdnVYvr4/A==
X-Google-Smtp-Source: ACHHUZ7dBv7Ysw90aWXg/I3haPn5OIJokEnhwINFdBVz7hcuwd+ValiA2gmIiVcr/UwxlLUo1Pj4Zw==
X-Received: by 2002:a19:5059:0:b0:4e9:59cd:416c with SMTP id z25-20020a195059000000b004e959cd416cmr3083458lfj.0.1686548381226;
        Sun, 11 Jun 2023 22:39:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:40 -0700 (PDT)
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
Subject: [PATCH 18/18] ARM: dts: qcom: apq8064-ifc6410: constraint cpufreq regulators
Date:   Mon, 12 Jun 2023 08:39:22 +0300
Message-Id: <20230612053922.3284394-19-dmitry.baryshkov@linaro.org>
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

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 96307550523a..ad3cd45362df 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -215,8 +215,8 @@ s1 {
 		};
 
 		s3 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1400000>;
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
 
@@ -262,6 +262,12 @@ l23 {
 			bias-pull-down;
 		};
 
+		l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
 		lvs1 {
 			bias-pull-down;
 		};
@@ -269,6 +275,14 @@ lvs1 {
 		lvs6 {
 			bias-pull-down;
 		};
+
+		/* HFPLL regulator */
+		lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
 	};
 };
 
-- 
2.39.2

