Return-Path: <linux-clk+bounces-1994-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3F8202FD
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 01:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998352839AA
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 00:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DCC646;
	Sat, 30 Dec 2023 00:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQsboK5z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F763C4
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7af5f618so4545095e87.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Dec 2023 16:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894714; x=1704499514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdzQ6yptIX2njJ0HGgMcRRxrAbv6o00bIQPPcaFemQk=;
        b=OQsboK5zx/Ow/FpT9GEFU/73ZZv2yGtI74qaNmcjXHA41rR8NAFU1sJ9Q4aLF6p1dp
         QrJC2ygU8Vepk2BHcQ6LlHH6WQodXg4sKrtMM7FZ4krsxHhW9l1CICLFfyYR+DAVP/RY
         ETyoAb+qUfYI/EY8NScdMjlvCIjBQmKtuZnDbjME80Gu6k5oULij6WUZqpqWCWqQuoxw
         6f0yY+tPeBpJX+55v1n32p7xigU8jBw6hq3sEvsUJn8eUgqnRNYmIq6Cd5pJd24+JivQ
         iUMqAxVrZEs2BOxGiyFD106qBeJFbDgizCVrPWmTfNc1+BrDzs2QawkqWXHdIJIc1B8w
         +rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894714; x=1704499514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdzQ6yptIX2njJ0HGgMcRRxrAbv6o00bIQPPcaFemQk=;
        b=QxnWp7dHQmnFc9mG6EMvZu0wbm1lJOXnKaJdsM8XR2Ip6AG8+sS0RhI0gzg73wDaOi
         GrR8LEpY9AAnQvoO3kmAm/rh4Jo0a8j7hPBoxB8Zk5kaJjqre//xk9q1zC1bgsQMUxoE
         oU2GzCGJyYWWzdlJUdqx7GehZGlaaf+8tPfI8oc8AkWRlsycy9y/wU2MU1Ng74OnsX2u
         dsRQLtSt2hGPqSYWwIPyw77AF90NBAdVJxr1OKdHp/i27hYjxrYi3SmaM4rJiP24CG3K
         B1mw5Q4sCK2w4bRey+R02hjcu8xcCDO9Dlr0+Nr0369MC8K1wk5sTkLtb03l+DnE0jdX
         ahMg==
X-Gm-Message-State: AOJu0YziUC7VCbOqVVx/8bSBQRr6bj5ew8R3CKsZHspCzjaC7it0d5hd
	mzG2VSpYFkoExsqBZZDkz/tOU0oZ78g7wQ==
X-Google-Smtp-Source: AGHT+IHkJHo0JcVN0pEEyc43DnIDm7I38b446ESXoLDcibwuplTstgMHQrj8QXKgxITeKwZfb1AiBw==
X-Received: by 2002:a05:6512:374f:b0:50e:7410:d5b0 with SMTP id a15-20020a056512374f00b0050e7410d5b0mr4113081lfs.28.1703894713845;
        Fri, 29 Dec 2023 16:05:13 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:13 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:06 +0100
Subject: [PATCH 05/10] arm64: dts: qcom: sc8180x: Fix eDP PHY power-domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-5-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=823;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ObS9KPr+adD530yamp8rmXpRsOgSyb9ixOlL4drF0HY=;
 b=Jr3YGkabU6aSzD4cFb/dwjAYacsf7jNVjfNOzcDsyKHQWtv9EvTY2/My+1aY7gkQIHjN26DmC
 6iV/UZIe5hEAVqNDTDbh6UDR1GMbNGV1mtFqtioW8hAYRUmBLL01x+m
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The (e)DP PHYs are powered by the MX line, not through the MDSS GDSC.
Fix that up.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8849469d0aa1..8f7f5b74cdb9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3193,7 +3193,7 @@ edp_phy: phy@aec2a00 {
 				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
 			clock-names = "aux", "cfg_ahb";
 
-			power-domains = <&dispcc MDSS_GDSC>;
+			power-domains = <&rpmhpd SC8180X_MX>;
 
 			#clock-cells = <1>;
 			#phy-cells = <0>;

-- 
2.43.0


