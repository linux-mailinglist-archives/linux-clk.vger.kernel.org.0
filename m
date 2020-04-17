Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EC01AD6BD
	for <lists+linux-clk@lfdr.de>; Fri, 17 Apr 2020 09:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgDQHBf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Apr 2020 03:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgDQHBN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Apr 2020 03:01:13 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75DFC061A0F
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:13 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ng8so700096pjb.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e5yt6ZDVqr+7QSHc88Bnrv499SbQQkOFM9/QQvODlrQ=;
        b=i+z1H6qc1RQjl8dF/ZQWkrj1LOmONZiANWqZQj2D1MApZKXOwpspT+eAloxxqIWDgb
         2lxvRDCuJUmPo5f5TTlJ8mQBdorfC+3Sb+nANtWH/ShuFGYtSopy6PHdifjCPMZVjFw0
         AlpaM40+KsDeja6zYbzc2ZmmTZHvG3PuGI2VjJzpwekWr1/xHwTCLj2eRw2dd++Kcv8e
         Xzje+GzPKMh1Dk+AEFwcOENQ6LqmvYTKIHbkteGRf9J1pkfjaBWgL+y1r0LghOq1kuNM
         xnXo6BRHouV9DGEgGcOsahVlGL65Hf3d4c/zFgk9eZUDuLcAnx4GX+ynjLehVLKhyejD
         ijew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e5yt6ZDVqr+7QSHc88Bnrv499SbQQkOFM9/QQvODlrQ=;
        b=r5FbIhzCLQkN2fTA+kPu+YGRMhCodQ7kgFk51oQNwp4DGhXP7lzbq3EXnop+wSO6QQ
         GMiHI4ypbbpmjvngRO/yqQjRWmE08fAzSGzwGiEMW8u8ApmP3IGxp/+Rl4jArHKtO8Wq
         EYTOMVFKh5m1I+1h3eAA401Pt0nqpSTgLd+Gpw/dQjxewn9CLfZGkOgmscUZgHqgWC7f
         AkeRfzPW5l2Q82pAoY/QgZZK4BtPQ2u+g/S3fbpNUoQ9kgMI2S559gjw/DIAsj+k+n67
         lO/+4z8SabAu4bfVK56ENDYJQeE3H0wLDKTVDK1KxNj2E+CryVlselPpknPv+GHBISb6
         X5Ow==
X-Gm-Message-State: AGi0PuZjn1LgTsqFbgqop1cZzZHG/i0oD3pxD+dTurCPcJ2RVHsTqo8C
        hCIOarZRQIZXDC93vRSdYv0Bhg==
X-Google-Smtp-Source: APiQypKAPouxJUj8ZEHXCCyGsr9aFHrJPhULvsgTpcyEK+wS31hk0TH+VbwkpYL+s3wPwKVaYlchtA==
X-Received: by 2002:a17:90a:68cb:: with SMTP id q11mr2759270pjj.15.1587106873385;
        Fri, 17 Apr 2020 00:01:13 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc
Date:   Fri, 17 Apr 2020 00:00:43 -0700
Message-Id: <20200417070044.1376212-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

Add the SPMI regulator node in the PMI8994, use it to give us VDD_GX
at a fixed max nominal voltage for the db820c and specify this as supply
for the MMSS GPU_GX GDSC.

With the introduction of CPR support the range for VDD_GX should be
expanded.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
[bjorn: Split between pmi8994 and db820c, changed voltage, rewrote commit message]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Polished commit message
- vdd_gfx -> vdd-gfx

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/pmi8994.dtsi        |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 4692b7ad16b7..fc23b381c5e4 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -251,6 +251,10 @@ &mdss {
 	status = "okay";
 };
 
+&mmcc {
+	vdd-gfx-supply = <&vdd_gfx>;
+};
+
 &msmgpio {
 	gpio-line-names =
 		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
@@ -688,6 +692,16 @@ pinconf {
 	};
 };
 
+
+&pmi8994_spmi_regulators {
+	vdd_gfx: s2@1700 {
+		reg = <0x1700 0x100>;
+		regulator-name = "VDD_GFX";
+		regulator-min-microvolt = <980000>;
+		regulator-max-microvolt = <980000>;
+	};
+};
+
 &rpm_requests {
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 21e05215abe4..e5ed28ab9b2d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -26,5 +26,11 @@ pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmi8994_spmi_regulators: regulators {
+			compatible = "qcom,pmi8994-regulators";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
-- 
2.24.0

