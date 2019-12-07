Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E56A1115EA3
	for <lists+linux-clk@lfdr.de>; Sat,  7 Dec 2019 21:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfLGUgf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 7 Dec 2019 15:36:35 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46283 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfLGUge (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 7 Dec 2019 15:36:34 -0500
Received: by mail-pg1-f196.google.com with SMTP id z124so5055649pgb.13
        for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2019 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NuLMD+vpCNoGiyyrC9smw6iJ6GTLCuAG8SiEJlfGjVQ=;
        b=AYpKXKAF9cVhSOUeE0rNxEWXQ5UlDNg+Qn06frUuC/ydvfbPLUcDjnSBkeWPOwI6I6
         LpRv7UPgVLO1B5pSDqq15EYmMOScSSqgHXr0Xv+Bbl1JqUDt7LoOs/NDE0/IvW/mXgQT
         bp0g1dANmQ33bqP6+EqCBbWMSjbzd0ActrShyNkp13JL4aifwdFx+IW3VHDX1z6z+G4N
         gOJsbHsep6T+JsCGxd+kxs3nmSPMIIMb0v6SIptBtkYkzBUauXSaXkD0GxrCss9fy9Nj
         htKVb1CrEsvyQHzBdzchJ/J6lC5Fl3Xt8Ptfp4OllahNkqVEFcSgngUvr1Jrkd+/n6Xa
         myug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NuLMD+vpCNoGiyyrC9smw6iJ6GTLCuAG8SiEJlfGjVQ=;
        b=Q2OmUUpFe0O+HUj18neS0zDN3NPJGZ598Rc23MRhnwp3wZBABtA4IQf1QNtPi6hCWf
         WcjpXTsTSjsTzvR0OCc5SwNWLdKOqIk25cyl8fxh3tDQdmx7xQcbcgh9NGfJbddOPy93
         P+GXy7j9cyogQJgEZFAEuCMSGQo1izTMjHgG/2MxD3FlbU9osir1nKojiLBOc3A+1IkH
         Q4ZTL3MNQChv0XUjlAIufSo/ht7klvMAJMjG53PFeAkaiQHwKwTPLs44Eis6WAxJ3XU5
         69ZWtelnnRt0Xr/HMGdWO7Z6bBcS+wvdpQFhJAEVWFrJzbgz8IzA2fIaknTuXHpn0xeP
         Gt2g==
X-Gm-Message-State: APjAAAWq0tHyFhvuEpLTWZsHTxWAuLROVqO71BbEJBV3WsreIDKY3A7B
        IRPuRaJcjQfc2DFWfbjlCVBTYA==
X-Google-Smtp-Source: APXvYqwF3axss4ziuaTI7f3irpvgaatsEyyoCLhoH6QDheWLdMZIFM01+feX6FrPD47K79MTg4bO+A==
X-Received: by 2002:a63:115c:: with SMTP id 28mr10660719pgr.6.1575750993877;
        Sat, 07 Dec 2019 12:36:33 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm22982186pfq.117.2019.12.07.12.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: Define parent clocks for gcc
Date:   Sat,  7 Dec 2019 12:36:03 -0800
Message-Id: <20191207203603.2314424-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CLKREF clocks in GCC are parented by RPM_SMD_LN_BB_CLK, through the
CXO2 pad. Wire this up so that this is properly enabled when need by the
various PHYs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4ca2e7b44559..c9c6efbbcc01 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -635,6 +635,9 @@ gcc: clock-controller@300000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x300000 0x90000>;
+
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>;
+			clock-names = "cxo2";
 		};
 
 		stm@3002000 {
-- 
2.24.0

