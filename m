Return-Path: <linux-clk+bounces-2012-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE5820685
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 14:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF9C1C21192
	for <lists+linux-clk@lfdr.de>; Sat, 30 Dec 2023 13:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A2C8C1B;
	Sat, 30 Dec 2023 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+47yBLS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A2154BB
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-555d4232e4fso1243863a12.3
        for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 05:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703941484; x=1704546284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm7vsf6UZKbMh6cnZmrwv/W/K4dUYmjWU07UgTkkSLk=;
        b=c+47yBLSl7PtCVEMtO6HP390mXcTwJ8lwyTZtrkYMIrZ3mhRpbMSh4Rkx3XAR+5UNH
         DC9GxojPUXssBK7bZXwVifI5aqbV9hiGKXZbhs/NkKe5RR0AcPuMggosAZ5ye3+LhZem
         mKr73UzdKjeQvVmlmtQ1vC91ZeIOc4nktTnpP4Jy715FPem1w81LB1vox+I0s7p+riJ6
         aUCzlPlauVyxMck8vU4TI1AruuguABzEWPC02n16tP7/APpEmiTSmUI+RiRIlAh/Xls6
         SMNf6tJBGbwKzjTSZ/pSFUgXgbgEARXrzVATOghBTrIlGzSikifRyd28+1+RlUQ+nAwS
         ABqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703941484; x=1704546284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tm7vsf6UZKbMh6cnZmrwv/W/K4dUYmjWU07UgTkkSLk=;
        b=ThfM7fhMBBwk/WzOu5kvkJut9JFFFAhB7aGnnlYDImxlH6g8OgQAS5TZdAe8S/juDI
         zyeo0nss7FjIgBoA+Bit9kRSDIXiFc7ShPihCZmVUn4Hc1BhKAlZ7YD1zg2G6Jdshqag
         filWmyzbh52NaM/U40Led7J+9hl+RYdfh1+JGji0foiSvPmSzYGroTr9pr1jgWD/sah7
         N6UnDf3XInnMAzT9JLdMbUAVWZJJBcGbIMbKDhNUgipa4EPIUA7FyeN1rIYDI35WQsQh
         UXpztCfGu6Os8y1g2a2YHJY6ZUCz17ua30I4qV9RFKwjf8DWGJauL1RVeYMNLMnzyNKs
         +yTg==
X-Gm-Message-State: AOJu0YzzKzNMutnLQNbFBz0b8D0vH2h/OamaF/syEmwMvpZ8/nAw7qqS
	QiqFfUS1JzQ5JjA6jj7HtnUlf46kNoLs1w==
X-Google-Smtp-Source: AGHT+IE8CLWTwVqXhrXagDlUixdt41c4Ebadrmx2BwiKRKpMjRslFUWt71ZhsLa9rD+uQ2nCN6OYNA==
X-Received: by 2002:a05:6402:14c1:b0:553:752b:bb5 with SMTP id f1-20020a05640214c100b00553752b0bb5mr8709848edx.76.1703941484121;
        Sat, 30 Dec 2023 05:04:44 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id ij14-20020a056402158e00b00554368c9ce8sm11359578edb.1.2023.12.30.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 05:04:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 14:04:13 +0100
Subject: [PATCH v4 11/12] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v4-11-32c293ded915@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703941465; l=758;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L7WLthXykOxwSCjhfTNvX8JtR2g4GIz2oFPri6fp1uU=;
 b=GwNF2J1vtZRWZdz41SC2P/mgnGEbEcxm01szA/FS3OPjNwFdeBeowf/zuhWg1tw9U4rPEEJPY
 joNt3DySywDBnf9udT81VDIXUFxj9u45Ku7h+dt739cERAVGhWOfmnQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..30b140e1cec0 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -807,6 +807,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd SM6115_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0


