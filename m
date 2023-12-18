Return-Path: <linux-clk+bounces-1622-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD0816D7F
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 13:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6FEB1C23675
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 12:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1417495F0;
	Mon, 18 Dec 2023 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmQS0kNP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBC4F5FC
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3d0faf262so907355ad.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901287; x=1703506087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQdElwhJNkunjNkKmQMPCEqC6kOTfOJsifUeDg9TJE0=;
        b=vmQS0kNPYf/uSwTrjjmt50O0wy4qZ2MjCi+cNhpCeyB1AlZmN9XmK5ub+nO+9hECtF
         TiVV9KINraluoWkl+p1zSv1u5L4JM+lLSZFjDSQbH5aJmC4oFa+28Bg02jBN5CW0iG1m
         urboom/uvGQ8mG34vIC+4vYKlb+RvJ++bCsuNRH+qPFTRkHzy8JLOfQXVTU+pZDV9J5y
         WIlcfNhgljXzM6o/M9amQXosMXOhly0+fInQCfMzXD0+L9TvUyiCBtvlk0/blucYhKJT
         kuydy2V8BIhDV6Je3GWms5QPVdv/0N+pIVeDEtADTHR8kkM1Te4NaKlDP61zypNUhLMq
         CQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901287; x=1703506087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQdElwhJNkunjNkKmQMPCEqC6kOTfOJsifUeDg9TJE0=;
        b=FxT1do7FyC7RMCpkFP6bIMaVgVH6iK7HwFUCIrtD44mIamwV5uHpLlf6KO1EAUWlUA
         No7VwJow0nMdWX0DrOT1lLUVWjS8MRF1FGWO0Z+0s6IG8OH0+YJarv+pJrfOPudRumVq
         63UqvYSPhla0NS77Ro1OC9jVJ4utqUqSbcTVHAzfNd54ch8Tm0+4gpHnvtpjualabtQQ
         AxAK8gByMFyKX9Zl4DuohmCmGJDMTXOyWy1ud3qyDzPHzFdLsGA38oYnzfgIqal/AEm4
         PhkzvVZbXQasZDLVrSmaA2d/fetocnZxbgqp50J6arTDe7SWcOui2jXuu72+7lyr2VX8
         FcuA==
X-Gm-Message-State: AOJu0YymRma+CFiwkGpMsAtH+B+ecOlVf1VSatkUHUTmM2KJ1qvr/hSq
	ry4UE++ydXhQILnGTWzs+8jj
X-Google-Smtp-Source: AGHT+IFNgLs5EPRIQlG8vNg7cDLPbZb3pQzoiuB8DApHzGVX2h2mUfRn7BSJx96zPNyECoKW+QnqKA==
X-Received: by 2002:a17:902:f68b:b0:1d0:6ffe:9f7 with SMTP id l11-20020a170902f68b00b001d06ffe09f7mr20769460plg.85.1702901287157;
        Mon, 18 Dec 2023 04:08:07 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:06 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 07/16] arm64: dts: qcom: sdm845: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:03 +0530
Message-Id: <20231218120712.16438-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SDM845 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: cc16687fbd74 ("arm64: dts: qcom: sdm845: add UFS controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cb3bfd262851..a7529af5bc6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2619,10 +2619,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1


