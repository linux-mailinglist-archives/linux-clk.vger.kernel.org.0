Return-Path: <linux-clk+bounces-1991-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D6D8202F3
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 01:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D392839B3
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 00:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD0319D;
	Sat, 30 Dec 2023 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDDcCvWA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2CA5C
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d4103aed7so88646625e9.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Dec 2023 16:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894709; x=1704499509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DylJjoN2AOQJa9PDb6h9+DyUFHVNz6qyFwVRj7sTsTU=;
        b=sDDcCvWASHGgNoPAz6+5JKJ99/7dQLngOY/fTpvmI1xuTwhpkj8q9Hgenyo9Tnz8RY
         UxEmZPyeTyNCwqHzoi0gjZjDa9bceUsoddNEWUi0wHx5B/McdJN83IB6wFAxVTnG5mSm
         SPcqea4QRG9o5ykIDdgtpXYYNNSeHN4wiZ2cNf8mcEiaw0rhW15fzq47fz5Sp9s2+PKt
         RuxWZDOKuCsuzJ7h8+fqHmBb1goLv4o/CkiHRzqPZ3FlQMyoKDy+J9SUkS+psy6EJYSQ
         Tt0lGWGs3Zs4eDV3zSlrZK9RBwvkMYnh5CDtZ0NfuziAEvaCAyPGrKln/g7Y/mavKUFb
         Cifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894709; x=1704499509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DylJjoN2AOQJa9PDb6h9+DyUFHVNz6qyFwVRj7sTsTU=;
        b=IX7zqXD06uajuNpyAh6LKcbV+N9oUtEXDPrYfoLwv2qrjrMLZ6QFS2VZghOSKVlpzd
         9iu9san23GTnhAEixGCCyjKAVU5PBy0edV43bXC7PLtipR1aOXyCbllqPcL1wtjDzSsw
         9JmqilKrZ7Pihgfufkl94Ghn+rinCysCqJS49VjuCMc//BhiHqbr8yYcNv/8JyG5ovMw
         QqbSbWM5BwLzA3eMGY5/rX13xeSW3/3BuaTRx4a1TzhcmN+qTNMjK8qI9O4cpe2BmTWQ
         rwSFOZ7JTksVTEyXtba6Q+fcuW21OEVTVXhNrn24uo/mUcoyUQs2dxWoc2hQClpaY0X+
         owbA==
X-Gm-Message-State: AOJu0Yx0i1jemP07a7yYA35kZlkpk3l+dwQIJ2Vepi1tD0kMHxebFp1V
	h9C4QG1Q/gUui2Cj4/cifbxWI8prcSy2rQ==
X-Google-Smtp-Source: AGHT+IHgBEVZCQPeZ7wQeWmxoAZQUE/CrhGn5b6M1zQBcWdEj/DocV8lmwXy973Gbq5wsF9BFbmx0Q==
X-Received: by 2002:a05:600c:2184:b0:40d:5c4c:a4ea with SMTP id e4-20020a05600c218400b0040d5c4ca4eamr3071971wme.162.1703894709018;
        Fri, 29 Dec 2023 16:05:09 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:03 +0100
Subject: [PATCH 02/10] arm64: dts: qcom: sc8180x: Hook up VDD_CX as GCC
 parent domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-2-93b5c107ed43@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=804;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fM2ScZAfkldMIMY7bpO8Z6Zd7TjylAMnSp6mV61kAh4=;
 b=I77TlPoSmEB+MCaCPOsdmiDbqhbXtFivDq/xBBbbHln8RMASgu78WMhScmpnAtna2R2pFSxPt
 CCXTwLktNA6BV7LDirK2FuMfq6+NHAFM/dxToRlM5FCXEq11IvHFW/r
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Most of GCC is powered by the CX rail. Describe that relationship to
let the performance state requests trickle up the chain.

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 0430d99091e3..91fd805f17a1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -782,6 +782,7 @@ gcc: clock-controller@100000 {
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";
+			power-domains = <&rpmhpd SC8180X_CX>;
 		};
 
 		qupv3_id_0: geniqup@8c0000 {

-- 
2.43.0


