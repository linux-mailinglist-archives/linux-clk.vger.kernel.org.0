Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2555014E4A7
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2020 22:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgA3VMx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Jan 2020 16:12:53 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38350 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgA3VMx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jan 2020 16:12:53 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so2293553pgm.5
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2020 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ksW7l4fWNLieSdrD5EsRsMEIiSgG7sjjBAvxsINRjjI=;
        b=lIJoBPTf3duj1eGQFhz8YZ62Df5Wff7+ob6LqqpeugT+H1yud6k/Zqa6NEla/2kNxa
         XhvZHWFcApCtUzFq+g3sI+fNNpM7vtTTuAe7F0FoHjweGDvnvcLVehSj5wp/nMORMZKr
         s7PJGCe+AhcIao2G8L5JmqjVFlzfmralDLnc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ksW7l4fWNLieSdrD5EsRsMEIiSgG7sjjBAvxsINRjjI=;
        b=MrOltUQrS/1ewudWHwhk1FkNZ0cwZDW2In04P3ido2jwIW8lH8JpXj7ULx+66DbAo1
         x0EkNZGEgKAVVcnGFQ19+uMlq5ZUbxggxqZbjHZSd4Oq8EGyAYOKJqQbTO6jfPL/rIJ8
         NMjlJre2JxWkzfeWUqM5rHOGLNuW7tgOtUGjLL/qCVpQenSI/V2gclmy894fuUWb0Qxr
         WaAeAG28AeLDMC4cfHOZvN9GHA7cwSWs9qrovyoN5xr9uawXg9oripP68bjuNrku5o1D
         ontyLdj9rHe8NTmnVo2LpdvL9sbqNP2iItcd3bf5UX1uNfCRiDEo8kbpH8YEnwPrjps9
         S4Cw==
X-Gm-Message-State: APjAAAW1Dc0pQ/akbdzmbGN3U077EEnAhqnXQUFVCuARrYAqVLtfTR84
        dvvWvNmu7E7FlYoIVVlIOwIG5A==
X-Google-Smtp-Source: APXvYqxLqyb7vvP/CmhMs7YyJCKrP+csYoKAiXN3h5NKS0788VFJpZYxoKMMWiN7TlkQ4j8Te7RKKw==
X-Received: by 2002:a63:6602:: with SMTP id a2mr6293262pgc.403.1580418772289;
        Thu, 30 Jan 2020 13:12:52 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:12:51 -0800 (PST)
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
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 03/15] arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
Date:   Thu, 30 Jan 2020 13:12:19 -0800
Message-Id: <20200130131220.v3.3.Ie80fa74e1774f4317d80d70d30ef4b78f16cc8df@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're transitioning over to requiring the Qualcomm Display Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTES:
- Until the Linux driver for sdm845's dispcc is updated, these clocks
  will not actually be used in Linux.  It will continue to use global
  clock names to match things up.
- Although the clocks from the DP PHY are required, the DP PHY isn't
  represented in the dts yet.  Apparently the magic for this is just
  to use <0>.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Newly discovered gcc_disp_gpll0_div_clk_src added.
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..0985813fee50 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2933,6 +2933,24 @@ opp-200000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_link_clk_divsel_ten",
+				      "dp_vco_divided_clk_src_mux";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

