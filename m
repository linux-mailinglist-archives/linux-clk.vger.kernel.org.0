Return-Path: <linux-clk+bounces-1654-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692D8176BA
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 17:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B51D1C25771
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ABA3D54A;
	Mon, 18 Dec 2023 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCrhBWow"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672B4FF7B
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2358a75b69so227949466b.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702915344; x=1703520144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT6UxuEKPmgj4jLSU2GUCRPmbth0aVHzMw+IpobCJZM=;
        b=dCrhBWowh3/hZ0T83tgYq9ZhNjPrAZdof0dna0PXYpawAdaTtSqdGfGT/NgKBLTN4b
         HA6FcewY8HACN+TIMO4KWi9AZZpfPD4vJfV+VefiIPJ3AfRGFCrdC88t4hWIhY2jXKbW
         weiTjmoCeHMUv0KIdjzdMKFLu1f14LipufXcO7fmpA3B5VnhAC2PcE3p46YC69ui4k7V
         /eMq6XzZNlUH7510pldYqMqLMFzTDuiiPPWkXbiRx4PVijUDIWEeK0qO38xazr/LHfWC
         0uvECNTWSgY9HuqeX4SgX2m890ekRhvFHqJNkgEo12P+C6NwANfADVDNYFVf9Sch/Zpq
         VIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915344; x=1703520144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT6UxuEKPmgj4jLSU2GUCRPmbth0aVHzMw+IpobCJZM=;
        b=Y+FBW2Q5N+u6lSNqYwxEGGwLr9DGzGAuzKCV/iddAi2gUfGZ2y+Wn15bmio4E/OAQ5
         nIDBBd0olG740OtkhrgrqBCGAj4XLwMZCY8o9nmizwWCwdOEUuXqbYi6vcLYkC6gFdcN
         EQ+IQxOot4IsWhc3PcpuV+3/ZdSG4X9GzIXy1Vquz/5uLmwxe2Fc7vJKn8ZaK4jBV2bg
         qr3eUMJMLwIQVPXu3qsx7+nOEfNpQsGWXvRiQo/e48lM5d2CcEuDuYpy2HWRO/MwgwcQ
         zxJ3QEBFIP/KDfn8X8vbtsdG1VF1ChdgvZsjiSRgBTj/sBmV/o+5Xbn11SGB62nt066H
         LEvA==
X-Gm-Message-State: AOJu0Yx1Go6nlnW+EEbIxiZkfeqM0hTM1LWwoPXOrw0qe6Jc2E6KRRcY
	qYzFAV+vx1iFqqeWdGiBwfmcVA==
X-Google-Smtp-Source: AGHT+IFMUg3W1ZnrrBBif7zvuPAXmotgD+6XxD9Si/YfU4KMSkMTQFW/g2o1+cOLheClBTLlwPLIqQ==
X-Received: by 2002:a17:906:c6:b0:a1f:821a:11a7 with SMTP id 6-20020a17090600c600b00a1f821a11a7mr11143127eji.25.1702915344275;
        Mon, 18 Dec 2023 08:02:24 -0800 (PST)
Received: from [10.167.154.1] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm14260693ejc.119.2023.12.18.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:02:24 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 18 Dec 2023 17:02:05 +0100
Subject: [PATCH 04/12] clk: qcom: gcc-sm8550: Mark the PCIe GDSCs votable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-topic-8550_fixes-v1-4-ce1272d77540@linaro.org>
References: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
In-Reply-To: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702915332; l=1748;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=P+3qldiPbBZFJ8BOsbpVXXtVoE2i4b8QX9ekzA577Gk=;
 b=JFonqRDRhPpQ/2YnHmDHF5ERvXSDmDhffrNQqfycNc0wNJVn91FvnKARVHGTGkWHLvphmIces
 sksBRdyjZc9DCPCWikRNnz2innkwqtBzoV7YCsykCMD55qtzeUVuRq5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The PCIe GDSCs on most Qualcomm platforms expect the OS to always
consider collapse requests as successful. This also concerns SM8550.

Add the VOTABLE flag to the GDSCs in question to comply with these
expectations.

Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 1c3d78500392..a16d07426b71 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3002,7 +3002,7 @@ static struct gdsc pcie_0_gdsc = {
 		.name = "pcie_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_0_phy_gdsc = {
@@ -3011,7 +3011,7 @@ static struct gdsc pcie_0_phy_gdsc = {
 		.name = "pcie_0_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_1_gdsc = {
@@ -3020,7 +3020,7 @@ static struct gdsc pcie_1_gdsc = {
 		.name = "pcie_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_1_phy_gdsc = {
@@ -3029,7 +3029,7 @@ static struct gdsc pcie_1_phy_gdsc = {
 		.name = "pcie_1_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_phy_gdsc = {

-- 
2.43.0


