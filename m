Return-Path: <linux-clk+bounces-1652-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D284C8176AD
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 17:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019A92827D0
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 16:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282995A841;
	Mon, 18 Dec 2023 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ET0SNX9g"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114E4FF73
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a1f33c13ff2so269201266b.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702915339; x=1703520139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/cUjOTCjdJi3GHiAbeX7Aqusov41HuBo2ahAKhsdxQ=;
        b=ET0SNX9gaTqAfTUvB8Ys/hMaLOSkfr3ACiXsqEAJ7bXtSUxEgOLKePc+Wztp+hfgNC
         y8LZNnN0r5QJB/5x+WC37K+eLrFD8R1WEypFnCWne6KgvK4wDjjvqIoGHPb0uEy+JcaL
         /onYA+NEZ0YMsWghrPCGljcVf77lO1DK8ObmHYTxsEfBCb90D0gpmA47DamDFQu5UDJT
         dsfZGL8D02Jg7YYaoZvbmt5fAVFsLliTugOzchGVuyNeIGKeNCtzZApmjBDpXL/Re2EI
         3L9soAhmcEKNZrFdfdaAsvS2VO+aQwHi8JgGx8AXI4zJwnJV3uP2+2DAWJr7w1PfTuQi
         Q96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915339; x=1703520139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/cUjOTCjdJi3GHiAbeX7Aqusov41HuBo2ahAKhsdxQ=;
        b=TS5GXmYd05KCIj8bhH094dt7qAXsHgMQLp8DfUNTl+2p+GQp8a16GaPEcL9PWXNw4c
         jQizcrmsXb3Je0HI4VseGIpMWnedagvWHTWmExEPfNpwLauFGGbFqL9I9gD/y1NWk8cV
         l/exwwuwk9kW/xhRbvg1kDBF0Buh52Z6/eJ47+uKoNtOSh6NIAEcs2dEXkOgJkhOd9An
         JqFPccCvkWfwc/B8PPT/N9w4oNHZgE/1gREX8E48uTw/3pGK5Oza3gS2FLjga9Cos8Gh
         p3I+LncDd3Ii5VxNXgi8OvRxB/hjyBJSVinH+el505yElTrDJFmbiiDiTB2NDb1tw7Qh
         ESHw==
X-Gm-Message-State: AOJu0YyTonl/9V3aWHGdejAUNR2H8yTlmL/5rQ0jJS8PmS/eDx9zA7xy
	L6QQJm0qpM+NXQXcQ03ViyZXmQ==
X-Google-Smtp-Source: AGHT+IFyfanRnecTIvzlZBtBwF8Pb2rCOTpczmDVT+/SXpLxI9DdbEdCTSut//UTa3WqwHynqq0udA==
X-Received: by 2002:a17:906:73d2:b0:a23:357f:f583 with SMTP id n18-20020a17090673d200b00a23357ff583mr1479782ejl.30.1702915339425;
        Mon, 18 Dec 2023 08:02:19 -0800 (PST)
Received: from [10.167.154.1] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm14260693ejc.119.2023.12.18.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:02:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 18 Dec 2023 17:02:03 +0100
Subject: [PATCH 02/12] interconnect: qcom: sm8550: Enable sync_state
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-topic-8550_fixes-v1-2-ce1272d77540@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702915332; l=794;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vn3HlIlPR6ucV7JF0xNr2wT4h4pXu1XpkqI9qeViBog=;
 b=NAyGsbdan2haOqAWOkwgUgINzfJZo+6CBBSFmKyYwJlLOaooPc8dnPr8UBAlz7a+e58XODMnH
 Q54QEwcjOMEDRBauJyD1DSpTyc6ddEKIPfMlu9phhAyI3PiuvN65/0C
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To ensure the interconnect votes are actually meaningful and in order to
prevent holding all buses at FMAX, introduce the sync state callback.

Fixes: e6f0d6a30f73 ("interconnect: qcom: Add SM8550 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm8550.c b/drivers/interconnect/qcom/sm8550.c
index abc52ad3d1f2..4d0e6fa9e003 100644
--- a/drivers/interconnect/qcom/sm8550.c
+++ b/drivers/interconnect/qcom/sm8550.c
@@ -1649,6 +1649,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8550",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.43.0


