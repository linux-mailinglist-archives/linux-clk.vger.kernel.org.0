Return-Path: <linux-clk+bounces-1629-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC2816D9F
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 13:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB814284B20
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 12:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE28563AD;
	Mon, 18 Dec 2023 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KizIXyRJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83D51C36
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3d0faf262so913185ad.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901328; x=1703506128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTvHTb3eBsG5jFvbdhGh0zasO09G1PrRZVvH3m7yDqQ=;
        b=KizIXyRJpSpN3S/Heox2u3MvQu8xAzrTibmSxDbPKVNYb2SgnRXI6xy6lksX1xuYWy
         d6XgmhWYfdzGoSDCoZuvyWUuXMZCMhvzOuiYpvcbFZDvX7CVBgCxvYYfDd0OzScrtcK5
         RLTaWT9R0ZkPWAX1+6yKlxp+T3tGkaHGOiov/IOK6Do2ZGrLxKyCzOVgQtaVhHLQJ7oB
         c5p0JIdVVk5Rne2qSF6vTGHzm4VPqhGsG3ERYKfwWQDMB1Sq5aH8HI5tiZb1vJ84oT/Y
         /Cb1WssG5grMrbou8uzmApRT0lkElmqYa4IOQxm0EXJnibgqvqbf/nOEecCm42IhmwSg
         Vrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901328; x=1703506128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTvHTb3eBsG5jFvbdhGh0zasO09G1PrRZVvH3m7yDqQ=;
        b=n7l/uc5ga5ecutqvSVSDpiKVzPcOBO/+hr7hxtW2h3SaXmJse+M+bpvN0UbEVajNCx
         mlqnNWtrgCs29rBBm/IAjnBqqB9zwhZKsM+zUlIJa7V75hmwpjSzUU5MJNkEE9xPYS7q
         QHuo7RJ4Rvsw5HZ4JO3I/3j583qQu0KIpS97WxRzyQceyOP+delKXpZXOzuN327mIfNV
         FtPupiPbYawNEu5o3sh0s3pLmPycXQI77AOjnME32uNeCIAYT87M25lkkBZBwMsL9ujL
         S0nc8fbScoh8lCfb2QMt+6HLoPpWJ/kzcOTvCEsSl8x+YpzD6nLSugyuUiciSAtIYQoc
         rHlA==
X-Gm-Message-State: AOJu0YylSzYif0c7Spw8ovgUYoimF3I9DeGCp10NA68ml/Uj955Sbd7V
	PhH8QNtrOuq2rzTWgRRafd9S
X-Google-Smtp-Source: AGHT+IHfpzfQ7Ho4J5k5zn3DQtdaxoP2BboWND0BEobz+wq9+jlz0BY2a2FXfVNGhh1hdWdcLpfjzg==
X-Received: by 2002:a17:902:ce8c:b0:1d0:9228:575e with SMTP id f12-20020a170902ce8c00b001d09228575emr19580256plg.43.1702901328528;
        Mon, 18 Dec 2023 04:08:48 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:48 -0800 (PST)
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
Subject: [PATCH v2 14/16] arm64: dts: qcom: sc8280xp: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:10 +0530
Message-Id: <20231218120712.16438-15-manivannan.sadhasivam@linaro.org>
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

QMP PHY used in SC8280XP requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..37344abbe8bf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2256,9 +2256,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sc8280xp-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
-			clocks = <&gcc GCC_UFS_CARD_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CARD_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
@@ -2318,9 +2321,12 @@ ufs_card_phy: phy@1da7000 {
 			compatible = "qcom,sc8280xp-qmp-ufs-phy";
 			reg = <0 0x01da7000 0 0x1000>;
 
-			clocks = <&gcc GCC_UFS_1_CARD_CLKREF_CLK>,
-				 <&gcc GCC_UFS_CARD_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_CARD_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1_CARD_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_CARD_GDSC>;
 
-- 
2.25.1


